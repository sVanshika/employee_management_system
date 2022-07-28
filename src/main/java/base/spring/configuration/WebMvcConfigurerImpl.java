package base.spring.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
public class WebMvcConfigurerImpl implements WebMvcConfigurer {
    @Bean
    public ViewResolver getViewResolver(){
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("main/webapp/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");

        return viewResolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // WebMvcConfigurer.super.addResourceHandlers(registry);
        registry.addResourceHandler("/resources/**")
        .addResourceLocations("/resources/")
        .setCachePeriod(31556926);
    }

     // equivalent for <mvc:default-servlet-handler/> tag
     @Override
     public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
         configurer.enable();
     }
}
