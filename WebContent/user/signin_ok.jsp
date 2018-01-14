<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
Gson gs = new Gson();
Map<String,String[]> map = gs.fromJson(request.getParameter("param"),HashMap.class);
String json = gs.toJson(map);
out.println(json);
%>
