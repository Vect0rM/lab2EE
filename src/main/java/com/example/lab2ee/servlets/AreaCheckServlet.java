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


    private boolean areaRectangle(double x, double y, double r) {
        return (x >= 0 && x <= r) && (y >= 0 && y <= r / 2);
    }

    private boolean areaTriangle(double x, double y, double r) {
        return  (x <= 0) && (y <= 0) && (y >= (-2) * x - r);
    }

    private boolean areaSector(double x, double y, double r) {
        return  (x * x + y * y <= r * r) && (x >= 0) && (y <= 0);
    }

    private boolean area(double x, double y, double r) {
        return areaRectangle(x, y, r) || areaTriangle(x, y, r) || areaSector(x, y, r);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long start = System.nanoTime();

        request.getParameter("time-offset");
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
            PointsBean pointsBean = new PointsBean();
            pointsBean.setX(Double.parseDouble(x));
            pointsBean.setY(Double.parseDouble(y));
            pointsBean.setR(Double.parseDouble(r));
            pointsBean.setCurrentTime(date);
            pointsBean.setExecutionTime(executionTime);
            pointsBean.setInArea(area(Double.parseDouble(x), Double.parseDouble(y), Double.parseDouble(r)));
            result.add(pointsBean);
        } catch (NumberFormatException e) {
            System.out.println("Can't parse numbers");
        }

        context.setAttribute("results", result);
        request.getRequestDispatcher("/index.jsp").forward(request, response);


    }
}
