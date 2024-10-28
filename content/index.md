# 项目说明文档

## 配置

### 文件上传配置

```yaml [application]
# 文件上传映射本地路径
# 在项目的源文件夹中建立upload目录，用于文件上传
imagesPath: E:/Code/kd-shop/upload/
```

### 数据库配置

```yaml [application]
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://127.0.0.1:3306/market?serverTimezone=GMT%2B8&useSSL=FALSE
    username: root  #数据库用户名
    password: 123!@# #该数据库用户的密码
```
