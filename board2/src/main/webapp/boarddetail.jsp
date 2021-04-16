<%@page import="javax.swing.plaf.basic.BasicToggleButtonUI"%>
<%@page import="DTO.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="content-Type" content="text/html; charset = UTF-8">	<%// html ������ �Ӽ�  %>
	<meta name="viewport" content ="width=device-width  initial-scale = 1 "> <%// ������ �� ����� %>
	<link rel="stylesheet" href="css/bootstrap.css">	<%// ��ũ ��Ÿ�� %>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%	// �ش� ���̵� �ش��ϴ� dto
				
		int id = Integer.parseInt( request.getParameter("id") );
		BoardDao dao = BoardDao.getinstance();
		BoardDto dto = dao.getboard(id);
	
	%>

	<!-- ��Ʈ��Ʈ�� ���̺�  -->
	<div class="container">
		<div>
			<table class="table table-striped" style="text-align: center; border: solid gray 1px; ">
			
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align:center;"  > �Խù� <br> ��ȸ�� : <%=dto.getCount() %> </th>
					</tr>
				</thead>
				<tbody>
				
					<tr>
						<td style="border-right:  dotted gray 1px; width: 200px;"  > �Խù� �̹��� </td>
						<td colspan="2" style="text-align: left;"> <img alt="" src="upload/<%=dto.getFile()%>" width="100%"> </td> 
					</tr>
				
					<tr>
						<td style="border-right:  dotted gray 1px; width: 200px;"  > �Խù� ���� </td>
						<td colspan="2" style="text-align: left;"> <%=dto.getTitle() %> </td> 
					</tr>
					
					
					
					<tr>
						<td style="border-right: dotted gray 1px; "> �Խù� �ۼ��� </td>
						<td colspan="2"  style="text-align: left;"> <%=dto.getUserID() %>  </td> 
					</tr>
					
					<% if( dto.getFile() == null ){
					%>
					<tr>
						<td style="border-right: dotted gray 1px; "> �Խù� ÷������ </td>
						<td colspan="2"  style="text-align: left;"> </td>
					</tr>
					<% 
					}else{
					%>
					<tr>
						<td style="border-right: dotted gray 1px; "> �Խù� ÷������ </td>
						<td colspan="2"  style="text-align: left;"> <a href="filecontroller.jsp?file=<%=dto.getFile()%>"><%=dto.getFile() %></a>  </td>
					</tr>
					<%	
					}
					%>
					<tr>
						<td style="border-right: dotted gray 1px; "> �Խù� ���� </td>
						<td colspan="2" style="height: 300px; text-align: left;">
								 <%=dto.getContents() %> 
					  </td> 
					</tr>
					
				</tbody>
			</table>
			<a href="boardmodify.jsp?id=<%=dto.getID() %>" class="btn btn-primary pull-right" style="margin-left: 10px;" >�ۼ���</a>
			<a href="boarddeletecontroller.jsp?id=<%=dto.getID() %>" class="btn btn-primary pull-right" >�ۻ���</a>
			<a href="board.jsp" class="btn btn-primary pull-left" >��Ϻ���</a>
		</div>
	</div>
	
	
	<br>
	<br>
	<br>
	<br>
	
	<!-- ///////////////////////////////////////////////// ��� �ۼ� �ڵ� //////////////////////////////////////////////////////////////////// -->
	
	<!-- ��Ʈ��Ʈ�� ���̺�  -->
	<div class="container">
		<div>
			<form action="replycontroller.jsp" method="post" enctype="multipart/form-data" >
			
				<table class="table table-striped" style="text-align: center; border: 1px">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;"> ��� </th>
						</tr>	
					</thead>
					
					<tbody> 
			
						<tr>
							<td> <textarea name="contents" placeholder="�� ����" class="form-control" maxlength="3000" 
									style="height: 50px;"> </textarea> </td>
						</tr>
					</tbody>
					
				</table>
					<input type="submit" value="��� ���" class="btn btn-primary pull-right">
			</form>
		</div>
	</div>
	<!-- ///////////////////////////////////////////////////��� �ۼ� ��� ///////////////////////////////////////////////////////////////// -->
	<br>
	<br>
	<br>
	<div class="container">
		<div>
			<table class="table table-striped" style="text-align: center; ">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;" width="100px;"> �ۼ��� </th>
						<th style="background-color: #eeeeee; text-align: center;"> ���� </th>
					</tr>	
				</thead>
					<tr>
						<td> ���缮 </td>
						<td> ��۳��� </td>
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