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
		request.setCharacterEncoding("EUC-KR"); // 요청할때 데이터를 한글로 인코딩
	
		String title = request.getParameter("title"); // input name 
		String contents = request.getParameter("contents"); // input name 
		// String file = request.getParameter("file"); // input name 
		
		BoardDto boardDto = new BoardDto();
	
		// id 생략
		boardDto.setTitle(title);
		boardDto.setContents(contents);
		boardDto.setUserID("유재석");
		//date 생략
		boardDto.setAvailable(1);
		boardDto.setFile("파일명");
		
		
		BoardDao dao = BoardDao.getinstance();
		
		int result =  dao.write( boardDto );
		
		if( result == 1 ){  
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('글 등록이 되었습니다 .');");
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		else{
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('글 등록 오류 [ 관리자에게 문의 ] .');");
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		
	
	%>



	


</body>
</html>