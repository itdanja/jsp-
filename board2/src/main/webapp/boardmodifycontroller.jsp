<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	
		// 1. ���ε� ������ ������ ���� 
		String realFolder = "C:/Users/User/git/jsp/board2/src/main/webapp/upload";
		
		// MultipartRequest : cos ���̺귯������ ���� 
		MultipartRequest multi = new MultipartRequest( request , realFolder , 1024*1024*10 , "UTF-8" , new DefaultFileRenamePolicy() );
													// ��û��� ,   , ������ġ , "�����ִ�뷮" , "���ڵ�" , "���� : "
																									// DefaultFileRenamePolicy() : ���ε�� �ߺ��� ���ϸ� ���� 
		request.setCharacterEncoding("EUC-KR"); // ��û�Ҷ� �����͸� �ѱ۷� ���ڵ�
	
		// ÷������ ���� enctype : Ÿ������ ���� 
		int id = Integer.parseInt( multi.getParameter("id") );
		String title =  multi.getParameter("title") ;
		String contents =  multi.getParameter("contents") ;
		String file =  multi.getFilesystemName("file");
		
		if( file == null ){
			file = multi.getParameter("file2"); // ���� ���Ϸ� �ٽ� �־��ֱ�
		}
	
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