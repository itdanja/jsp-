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
		request.getParameter("EUC-KR");
		
		int id = Integer.parseInt( request.getParameter("id") );
		String title =  request.getParameter("title") ;
		String contents =  request.getParameter("contents") ;
		String file =  request.getParameter("file") ;
	
		BoardDao dao = BoardDao.getinstance();
		
		int result =  dao.updateboard(title, contents, file, id);
		
		if( result == 1 ){  
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('�� ���� �Ǿ����ϴ� .');");
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		else{	
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('�� ���� ���� [ �����ڿ��� ���� ] .');");
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
	%>



	


</body>
</html>