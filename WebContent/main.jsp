<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ta.dao.*"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<%
	String id = request.getParameter("id");
	MemberDao dao = new MemberDao();
	
%>
<script>
	$(function () {
		$('.btn').click(function () {
			alert('로그아웃 되었습니다.');
			location.href = 'login.jsp';
		});
	});
</script>
</head>
<body>
	<div>
		<span style="font-size:45px; border-radius: 20px;">메인페이지</span>
		<div style="float:right;"><%=dao.getName(id) %>님 안녕하세요
			<button class="btn">로그아웃</button> <br/>
			포인트 : <%=dao.getPoint(id) %>점
		</div>
	</div>
	<div>
		<p>구입할 컨텐츠를 선택하세요.</p>
		<a href="mainAction.jsp?title=intro&point=100000&mypoint=<%=dao.getPoint(id)%>&id=<%=id%>">
			<img src="img/1.png"/>
		</a>
		100.000포인트
		<a href="mainAction.jsp?title=java&point=500000&mypoint=<%=dao.getPoint(id)%>&id=<%=id%>">
			<img src="img/2.png"/>
		</a>
		500.000포인트
		<a href="mainAction.jsp?title=C&point=300000&mypoint=<%=dao.getPoint(id)%>&id=<%=id%>">
			<img src="img/3.png"/>
		</a>
		300.000포인트
	</div>
	<div style="border:1px solid black; float:right;">
		<광고>
		<div>
			<a href="mainAction2.jsp?id=<%=id%>">
				<img src="img/4.png"/>
			</a>
		</div>
	</div>
</body>
</html>