package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class loginView_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <!-- Fonts -->\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Icons -->\r\n");
      out.write("        <link href=\"assets/css/nucleo-icons.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"https://use.fontawesome.com/releases/v5.0.6/css/all.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Theme CSS -->\r\n");
      out.write("        <link type=\"text/css\" href=\"assets/css/blk-design-system.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link type=\"text/css\" href=\"assets/css/customcss.css\" rel=\"stylesheet\">\r\n");
      out.write("        <style>\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body class=\"register-page\">\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "_menu.jsp", out, false);
      out.write("   \r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "_header.jsp", out, false);
      out.write(" \r\n");
      out.write("\r\n");
      out.write("            <div class=\"page-header\">\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                    <br/><br/>\r\n");
      out.write("                    <h3>Login Page</h3>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"col-lg-5 col-md-6 offset-lg-0 offset-md-3\">\r\n");
      out.write("                        <div id=\"square7\" class=\"square square-7\"></div>\r\n");
      out.write("                        <div id=\"square8\" class=\"square square-8\"></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"alert-danger\"><h4 class=\"col-5\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${errorMessage}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h4></div>\r\n");
      out.write("                <form method=\"POST\" action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/login\">\r\n");
      out.write("                    <input type=\"hidden\" name=\"redirectId\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.redirectId}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" />\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"username\">Username: </label>\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"username\" aria-describedby=\"emailHelp\" placeholder=\"Enter email\" name=\"userName\" value= \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.userName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("                        <small id=\"emailHelp\" class=\"form-text text-muted\">We'll never share your email with anyone else.</small>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"password\">Password</label>\r\n");
      out.write("                        <input type=\"password\" class=\"form-control\" id=\"password\" placeholder=\"Password\" name=\"password\" value= \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.password}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <input type=\"submit\" value= \"Submit\" class=\"btn btn-primary\"/>\r\n");
      out.write("                    <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/\">Cancel</a>\r\n");
      out.write("                </form>\r\n");
      out.write("                <div class=\"register-bg\"></div>\r\n");
      out.write("                <div id=\"square1\" class=\"square square-1\"></div>\r\n");
      out.write("                <div id=\"square2\" class=\"square square-2\"></div>\r\n");
      out.write("                <div id=\"square3\" class=\"square square-3\"></div>\r\n");
      out.write("                <div id=\"square4\" class=\"square square-4\"></div>\r\n");
      out.write("                <div id=\"square5\" class=\"square square-5\"></div>\r\n");
      out.write("                <div id=\"square6\" class=\"square square-6\"></div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "_footer.jsp", out, false);
      out.write("\r\n");
      out.write("        <!-- Core -->\r\n");
      out.write("        <script src=\"assets/js/core/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/js/core/popper.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/js/core/bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <!-- Theme JS -->\r\n");
      out.write("\r\n");
      out.write("        <script src=\"assets/js/blk-design-system.min.js\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
