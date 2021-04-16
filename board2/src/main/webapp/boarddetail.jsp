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
						<th colspan="3" style="background-color: #eeeeee; text-align:center;"  > 게시물 <br> 조회수 : <%=dto.getCount() %> </th>
					</tr>
				</thead>
				<tbody>
				
					<tr>
						<td style="border-right:  dotted gray 1px; width: 200px;"  > 게시물 이미지 </td>
						<td colspan="2" style="text-align: left;"> <img alt="" src="upload/<%=dto.getFile()%>" width="100%"> </td> 
					</tr>
				
					<tr>
						<td style="border-right:  dotted gray 1px; width: 200px;"  > 게시물 제목 </td>
						<td colspan="2" style="text-align: left;"> <%=dto.getTitle() %> </td> 
					</tr>
					
					
					
					<tr>
						<td style="border-right: dotted gray 1px; "> 게시물 작성자 </td>
						<td colspan="2"  style="text-align: left;"> <%=dto.getUserID() %>  </td> 
					</tr>
					
					<% if( dto.getFile() == null ){
					%>
					<tr>
						<td style="border-right: dotted gray 1px; "> 게시물 첨부파일 </td>
						<td colspan="2"  style="text-align: left;"> </td>
					</tr>
					<% 
					}else{
					%>
					<tr>
						<td style="border-right: dotted gray 1px; "> 게시물 첨부파일 </td>
						<td colspan="2"  style="text-align: left;"> <a href="filecontroller.jsp?file=<%=dto.getFile()%>"><%=dto.getFile() %></a>  </td>
					</tr>
					<%	
					}
					%>
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
	
	
	<br>
	<br>
	<br>
	<br>
	
	<!-- ///////////////////////////////////////////////// 댓글 작성 코드 //////////////////////////////////////////////////////////////////// -->
	
	<!-- 부트스트랩 테이블  -->
	<div class="container">
		<div>
			<form action="replycontroller.jsp" method="post" enctype="multipart/form-data" >
			
				<table class="table table-striped" style="text-align: center; border: 1px">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;"> 댓글 </th>
						</tr>	
					</thead>
					
					<tbody> 
			
						<tr>
							<td> <textarea name="contents" placeholder="글 내용" class="form-control" maxlength="3000" 
									style="height: 50px;"> </textarea> </td>
						</tr>
					</tbody>
					
				</table>
					<input type="submit" value="댓글 등록" class="btn btn-primary pull-right">
			</form>
		</div>
	</div>
	<!-- ///////////////////////////////////////////////////댓글 작성 목록 ///////////////////////////////////////////////////////////////// -->
	<br>
	<br>
	<br>
	<div class="container">
		<div>
			<table class="table table-striped" style="text-align: center; ">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;" width="100px;"> 작성자 </th>
						<th style="background-color: #eeeeee; text-align: center;"> 내용 </th>
					</tr>	
				</thead>
					<tr>
						<td> 유재석 </td>
						<td> 댓글내용 </td>
					</tr>
				<tbody> 
				</tbody>
			</table>
		</div>
	</div>
	
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>