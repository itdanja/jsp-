<%@page import="java.io.PrintWriter"%>
<%@page import="DAO.BoardDao"%>
<%@page import="DTO.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	
	<%
		request.setCharacterEncoding("EUC-KR"); // ��û�Ҷ� �����͸� �ѱ۷� ���ڵ�
	
		String title = request.getParameter("title"); // input name 
		String contents = request.getParameter("contents"); // input name 
		// String file = request.getParameter("file"); // input name 
		
		BoardDto boardDto = new BoardDto();
	
		// id ����
		boardDto.setTitle(title);
		boardDto.setContents(contents);
		boardDto.setUserID("���缮");
		//date ����
		boardDto.setAvailable(1);
		boardDto.setFile("���ϸ�");
		
		
		BoardDao dao = BoardDao.getinstance();
		
		int result =  dao.write( boardDto );
		
		if( result == 1 ){  
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('�� ����� �Ǿ����ϴ� .');");
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		else{
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('�� ��� ���� [ �����ڿ��� ���� ] .');");
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		
	
	%>



	


</body>
</html>