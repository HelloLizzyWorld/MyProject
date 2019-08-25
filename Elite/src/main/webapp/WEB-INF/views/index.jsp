<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>당근마켓 - 우리 동네 중고 직거래 마켓</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost:9000/daangn/resources/css/index.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:9000/daangn/resources/css/main.css">
</head>
<body>

	<!-- header -->

	<!-- top_keywords(header top) -->
	<jsp:include page="main/top_keywords.jsp"></jsp:include>

	<!-- hot_article -->
	<jsp:include page="main/hot_articles.jsp"></jsp:include>

	<!-- introduction -->
	<jsp:include page="main/introduction.jsp"></jsp:include>

	<!-- review -->
	<jsp:include page="main/review.jsp"></jsp:include>

	<!-- footer -->

</body>
</html>