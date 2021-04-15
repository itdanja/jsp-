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

	<!-- ��Ʈ��Ʈ�� ���̺�  -->
	<div class="container">
		<div>
			<table class="table table-striped" style="text-align: center; ">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;"> ��ȣ </th>
						<th style="background-color: #eeeeee; text-align: center;"> ���� </th>
						<th style="background-color: #eeeeee; text-align: center;"> �ۼ��� </th>
						<th style="background-color: #eeeeee; text-align: center;"> �ۼ��� </th>
					</tr>	
				</thead>
				
				<tbody> 
				<%
					request.setCharacterEncoding("EUC-KR"); // �ѱ� ���ڵ� 
					String key = request.getParameter("key");
					String keyword = request.getParameter("keyword");
				
					BoardDao dao = BoardDao.getinstance();
					
					ArrayList<BoardDto> list = new ArrayList<>();
					
					// �˻��� ���°��
					if( key == null || keyword ==null  ){	
						list =dao.getboardlist(); // ��� ��ȸ �޼ҵ� 
					}
					else{ // �˻��� �ִ°�� 
						list = dao.getboardsearch( key , keyword); // �˻� ��ȸ �޼ҵ�
					}
					
					// �ݺ��� 
					for( int i=0 ; i<list.size() ; i++ ){
						BoardDto dto =list.get(i);
				%>
					<tr onclick="location.href='boarddetail.jsp?id='+<%=dto.getID() %> "> <!--  for������ �ݺ�  -->
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
			
			<form action="board.jsp" method="post" >
						<!-- �Խ��� ���  -->
				<table style="margin: 0 auto;">
					<tr>
						<td> 
							<select name="key" class="form-control">
								<option value="board_title"> ���� </option> <!-- value="�ʵ��" -->
								<option value="board_contents"> ���� </option>
								<option value="board_userid"> �ۼ��� </option>
							</select>
						</td>
						
						<td>
							<input type="text" name="keyword" value="" size="20" class="form-control" placeholder=" �˻��� �Է� ">
															<!-- �ʵ� ��  -->
						</td>
						
						<td>
							<input type="submit" value="�˻�" class="btn btn-default">
						</td>
						
					</tr>
				</table>
			</form>
			
			<a href="boardwrite.jsp" class="btn btn-primary pull-right" >���ۼ�</a>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>