package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(filterName = "/AccessControlFilter", urlPatterns = "/*")
public class AccessControlFilter extends HttpFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;

        Boolean isAdmin = (Boolean) httpServletRequest.getSession().getAttribute("isAdmin");
        String path = httpServletRequest.getServletPath();
        if (path.contains("admin") && (isAdmin == null || !isAdmin)) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath());
            return;
        }

        chain.doFilter(request, response);
    }
}
