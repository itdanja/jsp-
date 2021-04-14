package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.BoardDto;

public class BoardDao {
	
	private Connection conn;
	private ResultSet rs; 
	
	public BoardDao() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/web?serverTimezone=UTC", "root" , "1234" );
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//  dao 객체 생성 
	private static BoardDao instance = new BoardDao();
	
	// dao 객체 반환 메소드 
	public static BoardDao getinstance() {
		return instance;
	}
	
	// 게시물 등록날짜 메소드
	public String getDate() {
		String SQL = "SELECT NOW()"; // DB함수 = NOW() : 현재날짜 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(); // select 결과 
			
			// 결과물 <------------------> PreparedStatement ---> SQL -> conn 인터페이스 -----> DriverManager 클래스 ----> 드라이버 ------>   SQL DB
			//	ResultSet 인터페이스		    SQL 조작 인터페이스 				연결 인터페이스
	
			if( rs.next() ) {
				return rs.getString(1); // 성공하면 날짜 반환 
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
			return ""; // db 오류
	}
	
	// 게시물 번호 메소드 ?????  오토키 X  => 수동 넣기 
		// 마지막 게시물 번호 가져오기 +1
			// 삭제시 : 삭제 게시물 번호 뒤로 한칸씩 -1
	public int getnext() {
		String SQL = "SELECT MAX(board_id) from Board"; // DB함수 = MAX(필드명) : 해당 필드의 최대값
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				return rs.getInt(1) + 1 ;		// 마지막 게시물 번호 + 1 
			}
			return 1; // 첫 게시물
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1; // db 오류 
	}
	
	// 게시물 등록 메소드
	public int write( BoardDto dto ) {
		
		String SQL = "insert into Board values(?,?,?,?,?,?,?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt( 1 , getnext() ); // 게시물번호 메소드 호출
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContents() );
			pstmt.setString(4, dto.getUserID() );
			pstmt.setString(5, getDate() );	// 게시물 등록 메소드 호출 
			pstmt.setInt(6, dto.getAvailable() ) ;
			pstmt.setString(7, dto.getFile() );

			pstmt.executeUpdate();
			return 1 ;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
	
	// 게시물 모든 조회 메소드 
	public ArrayList<BoardDto> getboardlist() {
		
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();

		try {
			
			String SQL = "select * from board where board_available = 1";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) { // 결과 갯수만큼 반복
			
				BoardDto dto = new BoardDto();
				
				dto.setID( rs.getInt(1));
				dto.setTitle( rs.getString(2));
				dto.setContents( rs.getString(3));
				dto.setUserID( rs.getString(4));
				dto.setDate( rs.getString(5));
				dto.setAvailable( rs.getInt(6));
				dto.setFile( rs.getString(7));
				
				list.add(dto);
			}
			return list;
		}
		catch (Exception e) {
			// TODO: handle exception
		}	
		return null;
	}
	
	// 게시물 개별 조회 메소드 
	public BoardDto getboard( int id) {
		
		try {
			String SQL = "select * from board where board_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			BoardDto dto = new BoardDto();
			
			if( rs.next() ) { // 결과 갯수만큼 반복
		
				dto.setID( rs.getInt(1));
				dto.setTitle( rs.getString(2));
				dto.setContents( rs.getString(3));
				dto.setUserID( rs.getString(4));
				dto.setDate( rs.getString(5));
				dto.setAvailable( rs.getInt(6));
				dto.setFile( rs.getString(7));
			
				return dto;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}	
		return null;
	}
	
	
	
	// 게시물 삭제 메소드 ?? 일반사용자 -> 삭제[ 비활성화 = 0  ] 
	public int deleteboard( int id) { 
		
		try {
			String SQL = "update board set board_available = 0 where board_id = ? ";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			
			pstmt.executeUpdate();
		
			return 1;
		}
		catch (Exception e) {
			// TODO: handle exception
		}	
		return -1;
	}

	//게시물 수정 메소드 
	public int updateboard( String title , String contents , String file ,  int id) { 
		
		try {
			String SQL = "update board set board_title = ? , board_contents=? , board_file=? where board_id = ? ";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title );
			pstmt.setString(2, contents);
			pstmt.setString(3, file);
			pstmt.setInt(4, id);
			
			pstmt.executeUpdate();
		
			return 1;
		}
		catch (Exception e) {
			// TODO: handle exception
		}	
		return -1;
	}


	
	
	




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
