<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>당근마켓 - 우리 동네 중고 직거래 마켓</title>


</head>
<body>

	<section id="hot-articles">
		<h3>당근마켓 최근 매물</h3>
		<div class="title-line-divider"></div>
		<section class="cards-wrap">
			<c:forEach var="vo" items="${list}">
				<article class="card-top ">
					<a class="card-link "
						href="http://localhost:9000/daangn/board_content.carrot?pid=${vo.pid}">
						<div class="card-photo">
						
					<c:choose>
						<c:when test="${not empty vo.fileArray}">
							<c:forEach var="file" items="${vo.fileArray}" begin = "0" end = "0">
								<img  alt="${vo.ptitle}" src="http://localhost:9000/daangn/resources/upload/${file.pfile}"/>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<img alt="${vo.ptitle}" src="https://seoul-p-studio.bunjang.net/product/101832538_1_1557381938_w152.jpg" />
						</c:otherwise>
					</c:choose>
<%-- 							
					<c:choose>
						<c:when test="${ vo.fileArray[0] != null }">
							<img alt="${vo.ptitle}"	src="http://localhost:9000/daangn/resources/upload/${vo.fileArray[0].pfile}" style="width: 211px;height: 158.9px;">
						</c:when>
						<c:otherwise>
							<img src="https://seoul-p-studio.bunjang.net/product/101832538_1_1557381938_w152.jpg" style="width: 211px;height: 158.9px;"> 
						</c:otherwise>
					</c:choose> 
--%>
						</div>
						<div class="card-desc">
							<h2 class="card-title">${vo.ptitle}</h2>
							<div class="card-region-name">${vo.address}</div>
							<div class="card-price ">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.pprice}" />
								원
							</div>
							<div class="card-counts">
								<span> 관심 ${vo.cart} </span> ∙ <span> 채팅 ${vo.msg} </span>
							</div>
						</div>
					</a>
				</article>
			</c:forEach>

			<div class="card-top " id="cards-more">
				<a class="card-link"
					href="http://localhost:9000/daangn/product_list.carrot?state=1&keyword=all">
					<div id="cards-more-text">
						<img alt="+"
							src="https://d3qlrgda07sb6k.cloudfront.net/assets/home/base/mobile/icon-add-dcfb7aac98f18d19ca4c27e9dc29c63cf73861f3b10e0a42c06163d2658d0691.svg" />
						<div id="more-text">
							당근마켓<br />최근 매물<br />더 보기
						</div>
					</div>
				</a>
			</div>

		</section>
		</div>
	</section>

</body>
</html>