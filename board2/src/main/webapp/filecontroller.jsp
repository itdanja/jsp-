<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
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
		// 1. �����̸� �������� 
		String filename = request.getParameter("file");
	
		// 3. �ش����� �ڹٷ� �������� 
		File file = new File( "C:/Users/User/git/jsp/board2/src/main/webapp/upload/"+filename);
		
		// 4. ÷������ �������� ���� [ ������ ���� �ٸ� ]
		response.setHeader("Content-Disposition", "attachment;filename="+filename+";");
						   //  ���� ,  ÷������ �̸�
						   
		// 5. ����� ��Ʈ�� [ ����Ʈ ���� ]
		byte[] b = new byte[ (int)file.length() ];
							// ������ũ�⸸ŭ ����Ʈ�迭 ����
		// 6. ��� ��Ʈ������ �������� 
		if( file.isFile() ){
			
			// �Է½�Ʈ�� 
			BufferedInputStream fin = new BufferedInputStream( new FileInputStream(file));
			// ��½�Ʈ�� 
			BufferedOutputStream fout = new BufferedOutputStream( response.getOutputStream() );
			
			int count ; 
			while(  (count=fin.read(b)) != -1 ){   // �Է½�Ʈ���� ����Ʈ�� ������ ���� �о���� 
				fout.write( b , 0 , count );
			}
		
			fout.close();	// ��� ��Ʈ�� ���� 
			fin.close();	// �Է� ��Ʈ�� ���� 
			
			
			
			
			
			
			
				
			
		}
		
		
					
		
		
	%>



</body>
</html>