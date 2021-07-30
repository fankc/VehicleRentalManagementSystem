数据库配置信息
'DB_TYPE'   => 'mysql', // 数据库类型
'DB_HOST'   => 'localhost', // 服务器地址
'DB_NAME'   => 'dc_zulin', // 数据库名
'DB_USER'   => 'root', // 用户名
'DB_PWD'    => '123456', // 密码
'DB_PORT'   => 3306, // 端口
'DB_PREFIX' => 'dc_', // 数据库表前缀

用户
账号	密码	类型
admin	123456	系统管理员
gl1	123456	管理员
kh1	123456	客户1
kh2	123456	客户2
sj1	123456	司机1
sj2	123456	司机2

开发工具：phpstudy集成环境
php版本：5.6


使用说明
下载 phpstudy 后，启动 apache 和 mysql

在环境里安装 phpMyAdmin 和 php 5.6

将项目文件 'zulin' 移至 phpstudy 的 WWW 根目录下

在网站里创建网站
域名为 www.zulin.com
根目录选择已经移到 WWW 目录里的项目文件 zulin
php版本选5.6

重启 apache 和 mysql

在数据库里将 root 数据库的密码改为 123456

在首页打开数据库工具 phpMyAdmin

创建数据库 dc_zulin

最后在浏览器打开 www.zulin.com/admin.php