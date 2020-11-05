package com.voxmix;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class WelcomeServlet extends HttpServlet {
    public void doGet ( HttpServletRequest request , HttpServletResponse response )
        throws ServletException, IOException {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            String x = "<http><head><title>VOXMIX : Servlet</title></head><body><p>This is the response</p></body></http>";

            out.println(x);

            out.close();

        }

    public void doPost( HttpServletRequest request , HttpServletResponse response )
        throws ServletException, IOException {
            doGet( request, response );
        }

}
