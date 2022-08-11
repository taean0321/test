<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ta.dao.*"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	MemberDao mDao = new MemberDao();
	String id = request.getParameter("id");
	int get = mDao.getPoint(id)+1000;
	mDao.UpdatePoint(get, id);
	%>
	<script>
		alert('1000점이 적립되었습니다.');
		location.href = 'main.jsp?id=<%=id%>';
	</script>
	<%
%>
</head>
<body>
	
</body>
</html>