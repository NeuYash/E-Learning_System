<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       <div id="piechart" style="width: 900px; height: 500px;"></div>
   <script type="text/javascript">
   google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	 <%--  var i1=<%=i1 %>;
    	  var j1=<%=j1 %>;
    	  var k1=<%=k1 %>;
 --%>
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      </script>
</body>


</html>