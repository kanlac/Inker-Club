package presentation.controller.filter;

import presentation.model.Entry;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "PublishFilter")
public class PublishFilter implements Filter {

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        String title = req.getParameter("title");
        String content = req.getParameter("content");

        System.out.println("Accessing doFilter.");

        if (title.equals("") || content.equals("")) {
            System.out.println("Either title or content is null.");

            RequestDispatcher rd = req.getRequestDispatcher("/publish.jsp");
            rd.include(req, resp);

            PrintWriter out = resp.getWriter();
            out.print("<br/><br/><br/><p style='text-align: center; color: #D0021B; font-family: Menlo-Regular;'>Error: Please fill in title or content.</p>");
            out.close();
        } else {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("PublishFilter initialized.");
    }

}
