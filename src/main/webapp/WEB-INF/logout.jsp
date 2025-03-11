<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Invalidate the session
    HttpSession session1 = request.getSession(false);
    if (session1 != null) {
        session1.invalidate();
    }
    // Redirect to login page
    response.sendRedirect("/Library_Management/login-page");
%>