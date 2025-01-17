package com.kdshop.config;

import com.kdshop.interceptor.AccessInterceptor;
import com.kdshop.interceptor.AdminAccessInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class KdShopWebConfig implements WebMvcConfigurer {

    /**图片地址*/
    @Value("${imagesPath}")
    private String mImagesPath;
    /**显示相对地址*/
    @Value("${fileUploadPathRelative}")
    private String fileRelativePath;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private AccessInterceptor accessInterceptor;

    @Autowired
    private AdminAccessInterceptor adminAccessInterceptor;
    /**
     * 静态资源映射
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String os = System.getProperty("os.name");
        //如果是Windows系统
        if (os.toLowerCase().startsWith("win")) {
            //表示在磁盘mImagesPath目录下的所有资源会被解析为fileRelativePath的路径
            registry.addResourceHandler(fileRelativePath).addResourceLocations("file:"+mImagesPath);
            //和页面有关的静态目录都放在项目的static目录下
            registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
            logger.info("=========================Windows 图片资源映射============================");
        }else {  //linux 和mac //媒体资源
            registry.addResourceHandler("/OTA/**")
                    .addResourceLocations("file:/www/wwwroot/www.bolglan.cn/dist/resource/OTA/");
        }
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(accessInterceptor)
                .addPathPatterns("/user/**")
                .excludePathPatterns("/user/toLogin","/user/login",
                                     "/user/check_login", "/user/toRegister",
                        "/user/register", "/user/checkPhone", "/user/checkCode",
                        "/user/search", "/user/collect", "/user/forget_password",
                        "/user/forget", "/user/showAddress", "/user/get_verify_code",
                        "/user/search/search");

        registry.addInterceptor(adminAccessInterceptor)
                .addPathPatterns("/admin/**")
                .excludePathPatterns("/admin/toLogin", "/admin/login");
    }
}
