package com.yupi.apiinterface.controller;

import com.yupi.apiclientsdk.model.User;
import com.yupi.apiclientsdk.utils.SignUtils;
import com.yupi.apiclientsdk.utils.TimeUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 查询名称接口
 *
 * @author 智博
 */
@RestController
@RequestMapping("/name")
public class NameController {
    @GetMapping("/")
    public String getNameByGet(String name, HttpServletRequest request) {
        return "GET 你的名字是" + name;
    }

    @PostMapping("/")
    public String getNameByPost(@RequestParam String name) {
        return "POST 你的名字是" + name;
    }

    @PostMapping("/user")
    public String getUserNameByPost(@RequestBody User user, HttpServletRequest request) {
        String accessKey = request.getHeader("accessKey");
        // String secretKey = request.getHeader("secretKey");
        String nonce = request.getHeader("nonce");
        String timestamp = request.getHeader("timestamp");
        String sign = request.getHeader("sign");
        String body = request.getHeader("body");

        // TODO 实际情况下应该去数据库查是否已分配给用户
        if(!accessKey.equals("yupi")){
            throw new RuntimeException("无权限");
        }

        if(Long.parseLong(nonce) > 10000){
            throw new RuntimeException("无权限");
        }

        if(TimeUtils.IsFiveMinutes(timestamp)){
            throw new RuntimeException("无权限");
        }

        // 实际情况中是从数据库中查出secretKey
        String serverSign = SignUtils.getSign(body, "abcdefg");
        if(!serverSign.equals(sign)){
            throw new RuntimeException("无权限");
        }

        return "POST 用户名字是" + user.getUsername();
    }
}
