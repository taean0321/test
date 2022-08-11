<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ta.dao.*"%>  
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
		
		MemberDao dao = new MemberDao();
		
		dao.insertMember(id,pw,name);
	%>
	<script>
		alert("가입되었습니다. 로그인 해주세요.");
		location.href="login.jsp";
	</script>
</body>
</html>