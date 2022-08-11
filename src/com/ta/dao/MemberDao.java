package com.ta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ta.dto.MemberDto;

public class MemberDao {
	public String getCheck(String id, String pw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int c=0;
		String check="";
		try {
			String sql = "SELECT COUNT(*) FROM member WHERE id=? AND pw=?";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				c = rs.getInt("COUNT(*)"); 
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		if(id.equals("admin")) {
			return check="admit";
		} else if(!(id.equals("admin")) && c==1) {
			return check="user";
		} else if(!(id.equals("admin")) && c==0) {
			return check="re";
		}
		return check;
	}
	public void insertMember(String id, String pw, String name) {
		PreparedStatement pstmt = null;
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "INSERT INTO member VALUE(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(1,id);
			pstmt.setString(1,pw);
			pstmt.executeQuery();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public String getName(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String name="";
		try {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT name FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("name");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	public int getPoint(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int point = 0;
		try {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT point FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				point = rs.getInt("point");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return point;
	}
	public void UpdatePoint(int point, String id) {
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET point = ? where id = ?";
		try {
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, id);
			pstmt.executeQuery();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<MemberDto> getMember() {
		ArrayList<MemberDto> member = new ArrayList<MemberDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Connection conn = DBConnection.getConnection();
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int point = rs.getInt("point");
				member.add(new MemberDto(name, point, id, pw));
			}
			rs.close();
			pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	public void DeleteMember(String id) {
		PreparedStatement pstmt = null;
		try {
			Connection conn = DBConnection.getConnection();
			String sql = "DELETE FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void getModify(String id, String pw, String name, int point) {
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET pw = ?,name = ?,point = ? where id = ?";
		try {
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setInt(3, point);
			pstmt.setString(4, id);
			pstmt.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
