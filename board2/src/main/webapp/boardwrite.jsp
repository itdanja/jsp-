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
			<form action="boardwritecontroller.jsp" method="post">
			
				<table class="table table-striped" style="text-align: center; border: 1px">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;"> �Խù� �ۼ� </th>
						</tr>	
					</thead>
					
					<tbody> 
					
						<tr>
							<td> <input type="text" name="title" placeholder="�� ����" class="form-control" maxlength="40"> </td>
						</tr>
							
						<tr>
							<td> <textarea name="contents" placeholder="�� ����" class="form-control" maxlength="3000" 
									style="height: 400px;"> </textarea> </td>
						</tr>
						
					</tbody>
					
				</table>
					<input type="file" name="file">
					<input type="submit" value="�� ���" class="btn btn-primary pull-right">
					
			</form>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>