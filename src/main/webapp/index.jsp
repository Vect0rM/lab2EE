<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.lab2ee.model.PointsBean" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
        <td>

                <svg id="areas" width="800px" height="800px">
                    <!-- Координатные оси -->
                    <line  x1="0" x2="300" y1="150" y2="150" stroke="red"></line>
                    <line x1="150" x2="150" y1="0" y2="300" stroke="red"></line>
                    <!--Стрелки-->
                    <polygon points="150,0 145,10 155,10" stroke="#343548"></polygon>
                    <polygon points="300,150 290,145 290,155" stroke="#343548"></polygon>
                    <polygon points="150,150 150,100 250,100 250,150"></polygon>
                        <polygon points="100,150 150,250 150,150"></polygon>
                    <path d="M250,150 A100,100 90 0,1 150,250 L 150,150 Z"></path>
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
</body>
</html>