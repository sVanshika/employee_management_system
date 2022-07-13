package base.spring.configuration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

public class WebApplicationInitializerImpl implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        // WebApplicationContext (I)
        WebApplicationContext webCtx = getContext();

        // listener listens to some event. it is registered with ServletContext (which is application specific)
        ContextLoaderListener ctxListener = new ContextLoaderListener(webCtx);
        // registering listener
        servletContext.addListener(ctxListener);

        // adding security filter - DelegatingProxyFilter
        // DelegatingFilterProxy delegatingFilterProxy = new DelegatingFilterProxy("springSecurityFilterChain");
        // servletContext.addFilter("securityFilter", delegatingFilterProxy);

        // registring DispatcherServlet class with ServletContext
        // These below lines are equivalent to what we wrote in web.xml
        DispatcherServlet frontController = new DispatcherServlet(webCtx);
        ServletRegistration.Dynamic dispatcher = servletContext.addServlet("DispatcherServlet", frontController);
        dispatcher.addMapping("/"); //<url-pattern>
    }

    private AnnotationConfigWebApplicationContext getContext(){
        AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
        ctx.setConfigLocation("base"); //context:component-scan basePackage = "main"

        // ctx.register(SpringSecurityConfig.class); // registering security config class

        return ctx;
    }

}
