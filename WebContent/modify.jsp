<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
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
%>
	<h1>회원관리-수정관리자</h1>
	<form action="modifyAction.jsp">
		ID : <input type="text" name="id" value="<%=id%>" readonly/>
		PW : <input type="text" name="pw" value="<%=pw%>"/>
		Name : <input type="text" name="name" value="<%=name%>"/>
		point : <input type="text" name="point" value="<%=point%>"/>
		<input type="submit" value="제출"/>
	</form>
</body>
</html>