package com.yupi.apiclientsdk.utils;

import java.time.Instant;

public class TimeUtils {
    public static boolean IsFiveMinutes(String timestampStr){
        // 将字符串时间戳解析为长整型
        long timestamp = Long.parseLong(timestampStr);

        // 获取当前时间的时间戳（单位为秒）
        long currentTimestamp = Instant.now().getEpochSecond();

        // 计算时间差（单位为秒）
        long differenceInSeconds = currentTimestamp - timestamp;

        // 将时间差转换为分钟
        long differenceInMinutes = differenceInSeconds / 60;

        // 检查是否超过5分钟
        return differenceInMinutes > 5;
    }
}
