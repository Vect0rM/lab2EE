package com.example.lab2ee.servlets;

import com.example.lab2ee.model.PointsBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.LinkedList;


@WebServlet(name = "AreaCheckServlet", value = "/AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {


    private boolean hitRectangle(double x, double y, double r) {
        return (x >= 0 && x <= r) && (y >= 0 && y <= r / 2);
    }

    private boolean hitTriangle(double x, double y, double r) {
        return  (x <= 0) && (y <= 0) && (y >= (-2) * x - r);
    }

    private boolean hitSector(double x, double y, double r) {
        return  (x * x + y * y <= r * r) && (x >= 0) && (y <= 0);
    }

    private boolean hit(double x, double y, double r) {
        return hitRectangle(x, y, r) || hitTriangle(x, y, r) || hitSector(x, y, r);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long start = System.nanoTime();

        String timeOffset = request.getParameter("time-offset");
        String date = new SimpleDateFormat("HH:mm:ss dd.MM.yyyy").format(Calendar.getInstance().getTime());

        String x = request.getParameter("x");
        String y = request.getParameter("y");
        String r = request.getParameter("r");

        ServletContext context = getServletContext();

        Object resultsAtt = context.getAttribute("results");
        LinkedList<PointsBean> result;

        if (resultsAtt != null) {
            if (resultsAtt instanceof LinkedList
                    && !((LinkedList<?>) resultsAtt).isEmpty()
                    && ((LinkedList<?>) resultsAtt).getFirst() instanceof PointsBean) {
                result = (LinkedList<PointsBean>) resultsAtt;
            } else {
                System.out.println("Can't cast history list");
                result = new LinkedList<>();
            }
        } else {
            result = new LinkedList<>();
        }

        long executionTime = System.nanoTime() - start;

        try {
            PointsBean responseBean = new PointsBean();
            responseBean.setX(Double.parseDouble(x));
            responseBean.setY(Double.parseDouble(y));
            responseBean.setR(Double.parseDouble(r));
            responseBean.setCurrentTime(date);
            responseBean.setExecutionTime(executionTime);
            responseBean.setInArea(hit(Double.parseDouble(x), Double.parseDouble(y), Double.parseDouble(r)));
            result.add(responseBean);
        } catch (NumberFormatException e) {
            System.out.println("Can't parse numbers");
        }

        context.setAttribute("results", result);

        request.getRequestDispatcher("/index.jsp").forward(request, response);

    }
}
