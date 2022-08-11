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
	MemberDao mDao = new MemberDao();
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	int point = Integer.parseInt(request.getParameter("point"));
	int myPoint = Integer.parseInt(request.getParameter("mypoint"));
	int newMyPoint = myPoint - point;
	if(title.equals("C")){
		title = "C++";
	}
	if(newMyPoint<0) {
		%>
		<script>
			alert('포인트가 부족합니다. 광고를 클릭하세요.')
			history.back();
		</script>
		<%
	}else {
		mDao.UpdatePoint(newMyPoint, id);
		%>
		<script>
			alert('컨텐츠(<%=title%>)를 구입하였습니다.')
			location.href = 'main.jsp?id=<%=id%>';
		</script>
		<%
	}
%>
</body>
</html>