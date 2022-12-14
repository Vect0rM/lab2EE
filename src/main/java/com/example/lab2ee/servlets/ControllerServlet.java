package com.example.lab2ee.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ControllerServlet", value = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        if (request.getParameter("x") != null && request.getParameter("y") != null && request.getParameter("r") != null) {
            requestDispatcher = request.getRequestDispatcher("/AreaCheckServlet");
        } else {
            requestDispatcher = request.getRequestDispatcher("/index.jsp");
        }
        requestDispatcher.forward(request,response);
    }
}
