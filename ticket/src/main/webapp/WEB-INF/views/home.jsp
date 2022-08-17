<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />   

<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%> 
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
   
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie List</title>
    <link rel="stylesheet"
	href="${rootPath}/static/css/main.css?ver=2022-08-17-001">
</head>

<body>
    <section class="wrapper">
        <h1>영화대리예매</h1>
        <ul class="navbar">
			<li><a href="${rootPath}/">HOME</a></li>

			<sec:authorize access="isAnonymous()">
				<li><a href="${rootPath}/user/login">로그인</a></li>
				<li><a href="${rootPath}/user/join">회원가입</a></li>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
				<li><a href="${rootPath}/todo/sale">판매글 작성</a></li>
				<li><a href="${rootPath}/">로그아웃</a></li>
				<li><a href="${rootPath}/user/mypage">myPage</a></li>
			</sec:authorize>

</ul>
<ul>
		
	<section>
		<c:choose>
			<c:when test="${LAYOUT == 'JOIN' }">
				<%@ include file="/WEB-INF/views/user/join.jsp"%>
			</c:when>
			<c:when test="${LAYOUT == 'LOGIN' }">
				<%@ include file="/WEB-INF/views/user/login.jsp"%>
			</c:when>
			<c:when test="${LAYOUT == 'TODO_LIST' }">
				<%@ include file="/WEB-INF/views/todo/list.jsp"%>
			</c:when>

		</c:choose>
	</section>



	<form:form class="logout" action="${rootPath}/logout" />
	</ul>
        <ul class="movie_list">
            <li class="movie_list_item">
                <a href="#">
                    <img src="${rootPath}/static/image/cgv.png" alt="cgv">
                    <div class="contents">
                        <strong class="title">영화 대리예매 1매 7000원 (3사가능)</strong>
                        <div class="sub_info">
                            <strong class="info">판매자 이름<span>판타지</span></strong>
                            <strong class="info">판매자 평점<span class="rank">9.05</span></strong>
                        </div>
                        <strong class="info">작성일<span>2022.08.17</span></strong>
                    </div>
                </a>
                <div class="btn">
                    <a href="#">예약하기</a>
                    <a href="#" class="trailer"></a>
                </div>
            </li>
        </ul>
    </section>

    <footer>
        <h2>영화대리예매</h2>
        <dl>
            <dt>(주) 한국경영원</dt>
            <dt>대표</dt>
            <dd>나준희</dd>
            <dt>사업자 번호</dt>
            <dd>000-0000-0000</dd>
            <dt>주소</dt>
            <dd>서울특별시</dd>
        </dl>
        <ul class="sns_list">
            <li class="twitter"><a href="#">twitter</a></li>
            <li class="instagram"><a href="#">instagram</a></li>
            <li class="facebook"><a href="#">facebook</a></li>
        </ul>
        <span class="copyright">&copy;영화대리예매</span>
    </footer>
</body>

</html>