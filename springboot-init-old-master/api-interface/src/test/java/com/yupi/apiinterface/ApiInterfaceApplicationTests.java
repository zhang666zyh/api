package com.yupi.apiinterface;

import com.yupi.apiclientsdk.client.ApiClient;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class ApiInterfaceApplicationTests {
    @Resource
    private ApiClient apiClient;

    @Test
    void contextLoads() {
        String yuapi = apiClient.getNameByGet("zhangsan");
        System.out.println(yuapi);

        String yuapi_two = apiClient.getNameByPost("lisi");
        System.out.println(yuapi_two);

        String yuapi_three = apiClient.getNameByPost("wangwu");
        System.out.println(yuapi_three);
    }

}
