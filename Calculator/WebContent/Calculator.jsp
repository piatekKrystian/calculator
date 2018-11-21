
<%@page import="info.bean.LogicCalculator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' type='text/css' href='style.css'>
<title>Kalkulator</title>
</head>
<body>
<h1>Kalkulator</h1>


<div class="ogloszenie">

<form method="post">
<table>
<tr><td>Liczba pierwsza:</td><td><input type="number" name="number1" value="${param.number1}"></td></tr>
<tr><td>Liczba druga:</td><td><input type="number" name="number2" value="${param.number2}"></td></tr>
<tr><td>Operacja:</td>
<td>
<select name='operation'>
<option value='+'>+</option>
<option value='-'>-</option>
<option value='*'>*</option>
<option value='/'>/</option>
</select>
</td></tr>
<tr><td><button>Oblicz</button></td></tr>
</table>
</form>
<jsp:useBean id="infoBean" class="info.bean.Beans"/>
<jsp:setProperty name="infoBean" property="number1" param="number1"/>
<jsp:setProperty name="infoBean" property="number2" param="number2"/>
<jsp:setProperty name="infoBean" property="operation" param="operation"/>
<%
int number1 = infoBean.getNumber1();
int number2 = infoBean.getNumber2();
String number1txt = Integer.toString(number1);
String number2txt = Integer.toString(number2);
String operation = infoBean.getOperation();
int score =0;
String scoretxt ="";
String result = "";
if(operation != null) {
	try {
score = LogicCalculator.score(number1, number2, operation);
scoretxt=Integer.toString(score);
result= number1txt + " "+ operation+" "+number2txt+" "+"="+" "+scoretxt;
session.setAttribute( "result", result );

	} catch(NumberFormatException e) {
		out.println("<p class='error'>Niepoprawny format liczby</p>");
	}
}

%>

<%= result%>

</div>
</body>
</html>