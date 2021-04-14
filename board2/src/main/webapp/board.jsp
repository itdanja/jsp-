<%@page import="DTO.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="content-Type" content="text/html; charset = UTF-8">	<%// html 페이지 속성  %>
	<meta name="viewport" content ="width=device-width  initial-scale = 1 "> <%// 반응형 웹 만들기 %>
	<link rel="stylesheet" href="css/bootstrap.css">	<%// 링크 스타일 %>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- 부트스트랩 테이블  -->
	<div class="container">
		<div>
			<table class="table table-striped" style="text-align: center; ">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;"> 번호 </th>
						<th style="background-color: #eeeeee; text-align: center;"> 제목 </th>
						<th style="background-color: #eeeeee; text-align: center;"> 작성자 </th>
						<th style="background-color: #eeeeee; text-align: center;"> 작성일 </th>
					</tr>	
				</thead>
				
				<tbody> 
				<%
					
					BoardDao dao = BoardDao.getinstance();
					ArrayList<BoardDto> list =dao.getboardlist();
					
					for( int i=0 ; i<list.size() ; i++ ){
						BoardDto dto =list.get(i);
				%>
					<tr onclick="location.href='boarddetail.jsp?id='+<%=dto.getID() %> "> <!--  for문으로 반복  -->
						<td> <%=dto.getID() %> </td>
						<td> <%=dto.getTitle() %> </td>
						<td> <%=dto.getUserID() %> </td>
						<td> <%=dto.getDate() %> </td>
					</tr>
					
				<%
					}
				%>
					
					
				</tbody>
				
			</table>
			<a href="boardwrite.jsp" class="btn btn-primary pull-right" >글작성</a>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>