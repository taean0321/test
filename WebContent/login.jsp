<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
	.btn {
		width : 190px;
	}
</style>
</head>
<body>
	<h1>로그인 </h1>
	<form action="loginAction.jsp" >
		ID : <input style="width:152px;"id="log" type="text" name="id"/><br/>
		PW : <input style="width:144px;" type="password" name="pw"/><br/>
		<input class="btn" type="submit" value="로그인"/><br/>
	</form>
	<form action="join.jsp">
		<input class="btn" type="submit" value="회원가입" />
	</form>
</body>
</html>