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
	String pw = request.getParameter("pw");
	MemberDao dao = new MemberDao();
	switch(dao.getCheck(id, pw)){
		case"admit" :
%>
	<script>
		location.href="admit.jsp?id=<%=id%>";
	</script>
<%
		break;
		case "re" :		
%>
	<script>
		location.href="login.jsp";
		alert("아이디/비밀번호를 다시 확인하세요");
	</script>
<%
		break;
		case "user" :
%>
	<script>
		location.href="main.jsp?id=<%=id%>";
	</script>	
<%	
	}
%>	
</head>
<body>
</body>
</html>