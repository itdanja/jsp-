<%@page import="javax.swing.plaf.basic.BasicToggleButtonUI"%>
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

	<%	// 해당 아이디에 해당하는 dto
				
		int id = Integer.parseInt( request.getParameter("id") );
	
		BoardDao dao = BoardDao.getinstance();
		
		BoardDto dto = dao.getboard(id);
	
	%>

	<!-- 부트스트랩 테이블  -->
	<div class="container">
		<div>
			<table class="table table-striped" style="text-align: center; border: solid gray 1px; ">
			
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align:center;"  > 게시물번호 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="border-right:  dotted gray 1px; width: 200px;"  > 게시물 제목 </td>
						<td colspan="2" style="text-align: left;"> <%=dto.getTitle() %> </td> 
					</tr>
					
					<tr>
						<td style="border-right: dotted gray 1px; "> 게시물 작성자 </td>
						<td colspan="2"  style="text-align: left;"> <%=dto.getUserID() %>  </td> 
					</tr>
					
					<tr>
						<td style="border-right: dotted gray 1px; "> 게시물 첨부파일 </td>
						<td colspan="2"  style="text-align: left;"> <%=dto.getFile() %>  </td>
					</tr>
					
					<tr>
						<td style="border-right: dotted gray 1px; "> 게시물 내용 </td>
						<td colspan="2" style="height: 300px; text-align: left;">
								 <%=dto.getContents() %> 
					  </td> 
					</tr>
					
				</tbody>
			</table>
			<a href="boardmodify.jsp?id=<%=dto.getID() %>" class="btn btn-primary pull-right" style="margin-left: 10px;" >글수정</a>
			<a href="boarddeletecontroller.jsp?id=<%=dto.getID() %>" class="btn btn-primary pull-right" >글삭제</a>
			<a href="board.jsp" class="btn btn-primary pull-left" >목록보기</a>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>