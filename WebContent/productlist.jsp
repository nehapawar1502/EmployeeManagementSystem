<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="johnny.mongodbtutorial.model.Product"%>
<%@page import="johnny.mongodbtutorial.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String errmsg = "";
    MongoClient mongo = (MongoClient) request.getServletContext()
    .getAttribute("MONGO_CLIENT");
    ProductDao productDao = new ProductDao(mongo);

    List<Product> products = productDao.getList();
    if (products == null || products.size() == 0) {
        errmsg = "There is no Employee!";
    }

    pageContext.setAttribute("errmsg", errmsg);
    pageContext.setAttribute("products", products);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MongoDB Tutorial</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container">
 
  <h6>Data from MongoDB</h6>
  <table class="table">
    <thead>
      <tr>
        <th>Employee ID</th>
        <th>Employee Name</th>
        <th>Mobile Number</th>
        <th>Address</th>
        <th>Date of Birth</th>
        <th>Salary</th>
      </tr>
    </thead>
    <tbody>
      <c:choose>
        <c:when test="${not empty errmsg}">
          <tr style='color:red'><td>${errmsg}</td></tr>
        </c:when>
        <c:otherwise>
          <c:forEach var="product" items="${products}">
            <tr>
              <td><c:out value="${product.id}"/></td>
              <td><c:out value="${product.name}"/></td>
              <td><c:out value="${product.mob}"/></td>
              <td><c:out value="${product.add}"/></td>
              <td><c:out value="${product.dob}"/></td>
              <td><c:out value="${product.sal}"/></td>
              <td><a class="btn btn-success" href="productedit.jsp?id=${product.id}">Edit</a>&nbsp;
              </br> <a class="btn btn-danger" href="productdel.jsp?id=${product.id}" onclick="return confirm('Are you sure to delete this record?')">Delete</a></td>
            </tr>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </tbody>
  </table>
</div>
</body>
</html>