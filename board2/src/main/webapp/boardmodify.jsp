<%@page import="DTO.BoardDto"%>
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

	<%	// 해당 아이디에 해당하는 dto
		int id = Integer.parseInt( request.getParameter("id") );
		BoardDao dao = BoardDao.getinstance();
		BoardDto dto = dao.getboard(id);
	%>

	<!-- 부트스트랩 테이블  -->
	<div class="container">
		<div>
			<form action="boardmodifycontroller.jsp?id=<%=id %>" method="post">
			
				<table class="table table-striped" style="text-align: center; border: 1px">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;"> 게시물 수정 </th>
						</tr>	
					</thead>
					
					<tbody> 
						<tr>
							<td> <input type="text" name="title" placeholder="글 제목" class="form-control" maxlength="40" value="<%=dto.getTitle()%>"></td>
						</tr>
							
						<tr>
							<td> <textarea name="contents" placeholder="글 내용" class="form-control" maxlength="3000" 
									style="height: 400px;"><%=dto.getContents() %></textarea> </td>
						</tr>
					</tbody>
					
				</table>
					<input type="file" name="file">
					<input type="submit" value="글 수정" class="btn btn-primary pull-right">
					
			</form>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>