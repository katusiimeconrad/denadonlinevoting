import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Login extends HttpServlet {
    public void doPost ( HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html");
                response.setHeader("Refresh", "10 ; URL = http://localhost:8080/U855/Hello.jsp?username=Conrad");
                PrintWriter out = response.getWriter();
                try {
                            out.println("Hello Con ^_^ ");
                }

                finally {
                    out.close();
                }

    }
}
