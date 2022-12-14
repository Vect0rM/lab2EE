<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.lab2ee.model.PointsBean" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>lab 2</title>
    <link rel="stylesheet" href="css/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

</head>
<body>
<table class="main_table">
    <tr>
        <th colspan="2" class="header">Скворцов Михаил P33222 и Максим Иоган P33222 Вариант 53537</th>
    </tr>
    <tr>
        <td id="graph">

                <svg id="areas" width="300px" height="300px" onclick="svgGR(event)">
                    <!-- Координатные оси -->
                    <line x1="0" x2="300" y1="150" y2="150" stroke="#343548"></line>
                    <line x1="150" x2="150" y1="0" y2="300" stroke="#343548"></line>
                    <!--Стрелки-->
                    <polygon points="150,0 145,10 155,10" stroke="#343548"></polygon>
                    <polygon points="300,150 290,145 290,155" stroke="#343548"></polygon>
                    <polygon points="150,150 150,100 250,100 250,150"></polygon>
                    <polygon points="100,150 150,250 150,150"></polygon>
                    <path d="M250,150 A100,100 90 0,1 150,250 L 150,150 Z"></path>
                    !!-->

                    <!-- Метки для значений R на оси X -->
                    <line x1="50" x2="50" y1="145" y2="155" stroke="#343548"></line>
                    <line x1="100" x2="100" y1="145" y2="155" stroke="#343548"></line>
                    <line x1="200" x2="200" y1="145" y2="155" stroke="#343548"></line>
                    <line x1="250" x2="250" y1="145" y2="155" stroke="#343548"></line>

                    <!-- Метки для значений R на оси Y -->
                    <line x1="145" x2="155" y1="50" y2="50" stroke="#343548"></line>
                    <line x1="145" x2="155" y1="100" y2="100" stroke="#343548"></line>
                    <line x1="145" x2="155" y1="200" y2="200" stroke="#343548"></line>
                    <line x1="145" x2="155" y1="250" y2="250" stroke="#343548"></line>

                    <!-- Подписи к осям -->
                    <text x="290" y="140">X</text>
                    <text x="155" y="10">Y</text>
                    <!-- Значения R на оси X -->
                    <text x="40" y="138">-R</text>
                    <text x="85" y="138">-R/2</text>
                    <text x="190" y="138">R/2</text>
                    <text x="245" y="138">R</text>
                    <!-- Значения R на оси Y -->
                    <text x="162" y="54">R</text>
                    <text x="162" y="104">R/2</text>
                    <text x="162" y="204">-R/2</text>
                    <text x="162" y="254">-R</text>
                    <%--@elvariable id="results" type="java.util.LinkedList"--%>
                    <c:forEach items="${results}" var="p">
                        <circle class="shot" cx="${150 + 50 * 2/p.getR() * p.getX()}"
                                cy="${150 - 50 * 2/p.getR() * p.getY()}" r="2"
                                fill="orangered" stroke-width="0"></circle>
                    </c:forEach>
                </svg>

        </td>
        <td>
            <form class="main_form" method="post" >
                <div class="input-container">
                    x :
                    <label>
                        <input class="input-val" type="text" name="x" placeholder="значение от -5 до 5">
                    </label>
                </div>

                <br>
                <div class="input-container">
                    Y :
                    <label>
                        <label>
                            <input type="checkbox" name="y" value="-5"/>
                       -5</label>

                        <label>
                            <input type="checkbox" name="y" value="-4" />
                       -4</label>

                        <label>
                            <input type="checkbox" name="y" value="-3" />-3
                        </label>

                        <label>
                            <input type="checkbox" name="y" value="-2"/>
                        -2</label>

                        <label>
                            <input type="checkbox" name="y" value="-1"/>
                        -1</label>

                        <label>
                            <input type="checkbox" name="y" value="0"/>0
                       </label>

                        <label>
                            <input type="checkbox" name="y" value="1"/>
                        1</label>

                        <label>
                            <input type="checkbox" name="y" value="2"/>
                        2</label>

                        <label>
                            <input type="checkbox" name="y" value="3"/>
                        3</label>
                    </label>
                </div>
                <br>
                <div class="input-container">
                    R :
                    <label>
                        <input type="checkbox" name="r" value="1"/>1</label>

                    <label>
                        <input type="checkbox" name="r" value="2"/>
                    2</label>

                    <label>
                        <input type="checkbox" name="r" value="3"/>
                    3</label>

                    <label>
                        <input type="checkbox" name="r" value="4"/>
                    4</label>

                    <label>
                        <input type="checkbox" name="r" value="5"/>
                    5</label>
                </div>
                <br>
                <button type="submit" name="submit">Подтвердить</button>
            </form>
            <table class="response_table">
                <thead>
                <td>Результат</td>
                <td>X</td>
                <td>Y</td>
                <td>R</td>
                <td>Время</td>
                <td>Выполнение, нс</td>
                </thead>
                <tbody id="response_body">
                <%
                    Object resultsAtt = application.getAttribute("results");
                    LinkedList results;
                    if (resultsAtt instanceof LinkedList) {
                        results = (LinkedList) resultsAtt;
                        for (Iterator it = results.descendingIterator(); it.hasNext(); ) {
                            Object next = it.next();
                            if (next instanceof PointsBean) {
                                PointsBean pointsBean = (PointsBean) next;
                                out.println("<tr><td>" + pointsBean.isInArea()
                                        + "</td><td>" + pointsBean.getX()
                                        + "</td><td>" + pointsBean.getY()
                                        + "</td><td>" + pointsBean.getR()
                                        + "</td><td>" + pointsBean.getCurrentTime()
                                        + "</td><td>" + pointsBean.getExecutionTime() + "</td></tr>");
                            }
                        }
                    }
                %>
                </tbody>
            </table>
        </td>
    </tr>
</table>
<script src="js/validationSend.js"></script>
<script src="js/svg.js"></script>
</body>
</html>