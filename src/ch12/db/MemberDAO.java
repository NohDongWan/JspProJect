/*
 	DAO(Data Access Object) Ŭ����
 	- ������ ���̽��� �����Ͽ� ���ڵ��� �߰�, ����, ���� �۾���
 		�̷������ Ŭ���� �Դϴ�.
 	- � Action Ŭ������ ȣ��Ǵ��� �׿� �ش��ϴ�
 		�����ͺ��̽� ����ó���� DAO Ŭ�������� �̷������ �˴ϴ�.
 		
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
 */

package ch12.db;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class MemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;
	// �����ڿ��� JNDI ���ҽ��� �����Ͽ� Connection ��ü�� ���ɴϴ�.

	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB ���� ���� : " + ex);
			return;
		}
	}

	public int isId(String id,String pass) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			String sql = 
					"select id,password from member where id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(2).equals(pass)) {				//getString rs �� ���� �ִ�. ����� �ҷ����⶧����.
					result = 1;		//���̵�� ��й�ȣ�� ��ġ�ϴ� ���
				}else {
					result = 0;			//��й�ȣ�� ��ġ���� �ʴ� ���
			}
			}else {
				result = -1;			//���̵� �������� �ʴ� ���
				}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
				if(rs !=null) {
					try {
						rs.close();
					}catch(SQLException sq) {sq.printStackTrace();}
				}
				if(pstmt != null) {
					try {
						pstmt.close();
					}catch(SQLException sq) {sq.printStackTrace();}
				}
				if(con != null) {
					try {
						con.close();
					}catch(SQLException sq) {sq.printStackTrace();}
				}
		}
				return result;
				
				}//isID end
	}

