package com.yupi.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yupi.project.mapper.UserInterfaceInfoMapper;
import com.yupi.project.model.entity.UserInterfaceInfo;
import com.yupi.project.service.UserInterfaceInfoService;
import org.springframework.stereotype.Service;

/**
* @author 张宇航
* @description 针对表【user_interface_info(用户调用接口关系)】的数据库操作Service实现
* @createDate 2023-09-22 10:56:03
*/
@Service
public class UserInterfaceInfoServiceImpl extends ServiceImpl<UserInterfaceInfoMapper, UserInterfaceInfo>
    implements UserInterfaceInfoService {

}




