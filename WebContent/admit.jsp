<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ta.dao.*"%> 
    <%@ page import="com.ta.dto.*"%> 
    <%@ page import="java.util.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<%
	MemberDao mDao = new MemberDao();
	ArrayList<MemberDto> member = mDao.getMember();
%>	
<script>
	$(function () {
		$('#btn').click(function () {
			location.href = 'login.jsp';
		});
		$(".del").click(function(){
			var id = $(this).parent().parent().find(".userId").val();
			$(this).parent().parent().css("display","none");
			alert("삭제되었습니다.");
			$.ajax({
				type: 'get',
				url: 'DeleteServlet',
				data:{"id": id },
				datatype: 'json',
				success: function(data){
					
				},
				error: function(r,s,e){
					alert("에러");
				}
			});
		});
	});
</script>
</head>
<body>
	<div style="float:right;">
		<button id="btn">로그인</button>
	</div>
	<h1>회원관리</h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>Name</th>
			<th>Point</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
		for(int i=0; i<member.size(); i++){
		%>
			<tr>
				<td><%=member.get(i).getId()%></td>
				<td><%=member.get(i).getPw()%></td>
				<td><%=member.get(i).getName()%></td>
				<td><%=member.get(i).getPoint()%></td>
				<td>
					<form action="modify.jsp">
						<input class="userId" type="hidden" name="id" value="<%=member.get(i).getId()%>"/>
						<input type="hidden" name="pw" value="<%=member.get(i).getPw()%>"/>
						<input type="hidden" name="name" value="<%=member.get(i).getName()%>"/>
						<input type="hidden" name="point" value="<%=member.get(i).getPoint()%>"/>
						<button type="submit">수정</button>
					</form>
				</td>
				<td>
					<button class="del" name="id" value="<%=member.get(i).getId()%>">삭제</button>
				</td>
			</tr>
			<%
		}
		%>
	</table>
	
	<h1>스케줄러 관리</h1>
	<form action="quartzServlet" method="get">
		<button name="name" value="plus">스케줄러(20초마다 포인트1증가) 실행 시작</button>
		<button name="name" value="exit">스케줄러 실행 종료</button>
	</form>
</body>
</html>