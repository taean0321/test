<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
    <%@ page import="com.ta.dao.*"%>
    <%@ page import="com.ta.dto.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int point = Integer.parseInt(request.getParameter("point"));
		MemberDao mDao = new MemberDao();
		mDao.getModify(id, pw, name, point);
	%>
	<script>
		alert('수정되었습니다.');
		location.href = 'admin.jsp?id=admin';
	</script>
</body>
</html>