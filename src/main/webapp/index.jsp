<%@ page import="com.javarush.tictactoe.model.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <link href="static/main.css" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
    <title>Tic-Tac-Toe</title>
</head>
<body>
<h1>Tic-Tac-Toe</h1>

<%-- init table  --%>
<%--<table>
    <tr>
        <td>0</td>
        <td>1</td>
        <td>2</td>
    </tr>
    <tr>
        <td>3</td>
        <td>4</td>
        <td>5</td>
    </tr>
    <tr>
        <td>6</td>
        <td>7</td>
        <td>8</td>
    </tr>
</table>--%>

    <%--    table with onclick  --%>
<table>
    <%--<tr>
        <td onclick="window.location='/logic?click=0'">0</td>
        <td onclick="window.location='/logic?click=1'">1</td>
        <td onclick="window.location='/logic?click=2'">2</td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=3'">3</td>
        <td onclick="window.location='/logic?click=4'">4</td>
        <td onclick="window.location='/logic?click=5'">5</td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=6'">6</td>
        <td onclick="window.location='/logic?click=7'">7</td>
        <td onclick="window.location='/logic?click=8'">8</td>
    </tr>--%>

        <tr>
            <td onclick="window.location='/logic?click=0'">${data.get(0).getSign()}</td>
            <td onclick="window.location='/logic?click=1'">${data.get(1).getSign()}</td>
            <td onclick="window.location='/logic?click=2'">${data.get(2).getSign()}</td>
        </tr>
        <tr>
            <td onclick="window.location='/logic?click=3'">${data.get(3).getSign()}</td>
            <td onclick="window.location='/logic?click=4'">${data.get(4).getSign()}</td>
            <td onclick="window.location='/logic?click=5'">${data.get(5).getSign()}</td>
        </tr>
        <tr>
            <td onclick="window.location='/logic?click=6'">${data.get(6).getSign()}</td>
            <td onclick="window.location='/logic?click=7'">${data.get(7).getSign()}</td>
            <td onclick="window.location='/logic?click=8'">${data.get(8).getSign()}</td>
        </tr>
</table><hr>
<c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
<c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

<c:if test="${winner == CROSSES}">
    <h1>CROSSES WIN!</h1>
    <button onclick="restart()">Start again</button>
</c:if>

<c:if test="${winner == NOUGHTS}">
    <h1>NOUGHTS WIN!</h1>
    <button onclick="restart()">Start again</button>
</c:if>

<c:if test="${draw}">
    <h1>IT'S A DRAW</h1>
    <br>
    <button onclick="restart()">Start again</button>
</c:if>


<script>
    function restart() {
        $.ajax({
            url: '/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function () {
                location.reload();
            }
        });
    }
</script>

</body>
</html>