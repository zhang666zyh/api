-- 创建库
create database if not exists api;

-- 切换库
use api;

-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userName     varchar(256)                           null comment '用户昵称',
    userAccount  varchar(256)                           not null comment '账号',
    userAvatar   varchar(1024)                          null comment '用户头像',
    gender       tinyint                                null comment '性别',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user / admin',
    userPassword varchar(512)                           not null comment '密码',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    constraint uni_userAccount
        unique (userAccount)
) comment '用户';

-- 帖子表
create table if not exists post
(
    id            bigint auto_increment comment 'id' primary key,
    age           int comment '年龄',
    gender        tinyint  default 0                 not null comment '性别（0-男, 1-女）',
    education     varchar(512)                       null comment '学历',
    place         varchar(512)                       null comment '地点',
    job           varchar(512)                       null comment '职业',
    contact       varchar(512)                       null comment '联系方式',
    loveExp       varchar(512)                       null comment '感情经历',
    content       text                               null comment '内容（个人介绍）',
    photo         varchar(1024)                      null comment '照片地址',
    reviewStatus  int      default 0                 not null comment '状态（0-待审核, 1-通过, 2-拒绝）',
    reviewMessage varchar(512)                       null comment '审核信息',
    viewNum       int                                not null default 0 comment '浏览数',
    thumbNum      int                                not null default 0 comment '点赞数',
    userId        bigint                             not null comment '创建用户 id',
    createTime    datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime    datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete      tinyint  default 0                 not null comment '是否删除'
) comment '帖子';

-- 接口信息
create table if not exists api.`interface_info`
(
    `id` bigint not null auto_increment comment '主键' primary key,
    `name` varchar(256) not null comment '用户名',
    `description` varchar(256) null comment '接口描述',
    `url` varchar(512) not null comment '接口地址',
    `requestHeader` text null comment '请求头',
    `responseHeader` text null comment '响应头',
    `status` int default 0 not null comment '接口状态(0-关闭, 1-开启)',
    `userId` bigint not null comment '创建人',
    `method` varchar(256) not null comment '请求类型',
    `createTime` datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    `updateTime` datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    `isDelete` tinyint default 0 not null comment '是否删除(0-未删, 1-已删)'
) comment '接口信息';
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('曹旭尧', '田绍辉', 'www.william-emard.com', '汪钰轩', '苏伟宸', 0, 56, '梁天磊');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('萧鑫磊', '毛煜城', 'www.judy-ziemann.org', '薛修杰', '段晓博', 0, 5163678, '赵伟泽');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('张睿渊', '史鹤轩', 'www.vanetta-bartell.net', '彭子涵', '汪文', 0, 1, '蒋鹏');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('戴志泽', '江晓啸', 'www.luetta-willms.org', '曾文博', '顾耀杰', 0, 234896692, '陶鸿煊');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('丁果', '苏绍齐', 'www.christy-deckow.org', '白擎宇', '郝雨泽', 0, 2, '许擎苍');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('龚擎苍', '姚健雄', 'www.elsa-murray.info', '黄鹤轩', '苏晟睿', 0, 213, '蔡雨泽');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('汪俊驰', '韩鑫磊', 'www.jacelyn-bins.org', '卢健雄', '田文', 0, 47285, '卢靖琪');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('贾子骞', '陈擎宇', 'www.hailey-gaylord.com', '顾思', '钱昊强', 0, 269728, '傅航');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('冯锦程', '李琪', 'www.wally-beer.net', '宋琪', '贺绍辉', 0, 4041327151, '何明辉');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('何文轩', '于文博', 'www.emely-ernser.info', '傅炫明', '夏峻熙', 0, 173999727, '顾昊然');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('薛天磊', '任旭尧', 'www.eun-stoltenberg.info', '林智渊', '洪煜祺', 0, 1107011, '杨明辉');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('傅炎彬', '毛立辉', 'www.queen-braun.net', '秦致远', '陆雨泽', 0, 377490, '陆凯瑞');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('薛钰轩', '杨鑫鹏', 'www.carson-beatty.io', '侯风华', '杨君浩', 0, 97334, '韦瑞霖');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('郝致远', '武炫明', 'www.leo-parker.biz', '谭智渊', '唐文昊', 0, 4282382151, '彭伟诚');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('雷致远', '覃修洁', 'www.lawrence-prosacco.co', '万博涛', '莫耀杰', 0, 25213371, '韩天翊');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('罗越泽', '熊浩轩', 'www.gladis-jakubowski.info', '夏文轩', '武鸿涛', 0, 5594, '陆苑博');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('熊健雄', '邓弘文', 'www.emerson-cummerata.biz', '蔡俊驰', '钟鹭洋', 0, 573983027, '贾凯瑞');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('莫凯瑞', '侯明', 'www.jona-kuhic.net', '严潇然', '许鹭洋', 0, 229981, '陶越泽');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('陈嘉懿', '陆苑博', 'www.nestor-beatty.info', '姚明杰', '毛乐驹', 0, 4, '田浩轩');
insert into api.`interface_info` (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `userId`, `method`) values ('刘思聪', '许瑾瑜', 'www.darlena-mcdermott.co', '谢峻熙', '白靖琪', 0, 3, '夏雨泽');


-- 用户调用接口关系表
create table if not exists api.`user_interface_info`
(
    `id` bigint not null auto_increment comment '主键' primary key,
    `userId` bigint not null comment '调用用户 id',
    `interfaceInfoId` bigint not null comment '接口id',
    `totalNum` int default 0 not null comment '总调用次数',
    `leftNum` int default 0 not null comment '剩余调用次数',
    `status` int default 0 not null comment '0-正常 1-禁用',
    `createTime` datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    `updateTime` datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    `isDelete` tinyint default 0 not null comment '是否删除(0-未删, 1-已删)'
) comment '用户调用接口关系'