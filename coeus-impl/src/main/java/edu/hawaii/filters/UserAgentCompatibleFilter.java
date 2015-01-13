package edu.hawaii.filters;
 
import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;
 
 
//@WebFilter(urlPatterns = {"/*"}, initParams = {@WebInitParam(name = "compatibilityMode", value = "IE=EmulateIE8")})
public class UserAgentCompatibleFilter implements javax.servlet.Filter {
    private Logger log = Logger.getLogger("UserAgentCompatibleFilter");
    private String compatibilityMode;
 
    public void destroy() {
    }
 
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        if (compatibilityMode != null) {
            HttpServletResponse res = (HttpServletResponse) resp;
            res.addHeader("X-UA-Compatible", compatibilityMode);
        }
        chain.doFilter(req, resp);
    }
 
    public void init(FilterConfig config) throws ServletException {
        compatibilityMode = config.getInitParameter("compatibilityMode");
        if (compatibilityMode == null) {
            log.warning("No CompatibilityMode set for UserAgentCompatibleFilter, thus disabling it");
        }
    }
} 
