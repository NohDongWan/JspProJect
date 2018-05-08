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
import java.util.ArrayList;
import java.util.List;

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

	public int isId(String id, String pass) {
		try {
			con = ds.getConnection();					//���� �Ϸ�
			System.out.println("getConnection");
			String sql = "select id,password from member where id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {			//����� �ִٸ�.
				if (rs.getString(2).equals(pass)) { // ��� rs �ȿ��ִ� �ι�° Į�������Ͱ� �α��������� �Է��� �н������ ���� ����..
					result = 1; // ���̵�� ��й�ȣ�� ��ġ�ϴ� ���
				} else {
					result = 0; // ��й�ȣ�� ��ġ���� �ʴ� ���
				}
			} else {
				result = -1; // ���̵� �������� �ʴ� ���
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
		}
		return result;

	}

	public List<Member> getList() {
		List<Member> list = new ArrayList<Member>();	//����Ʈ�� �� ���ֱ����ؼ� ����Ʈ���� �����Ѵ�.
		try {
			con = ds.getConnection();

			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Member m = new Member();
				m.setId(rs.getString("id"));
				m.setPassword(rs.getString(2));
				m.setName(rs.getString(3));
				m.setAge(rs.getInt(4));
				m.setGender(rs.getString(5));
				m.setEmail(rs.getString(6));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
		}

		return list;
	}

	public Member member_info(String id) {
		Member m = new Member();
		try {
			con = ds.getConnection();

			String sql = "select * from member where id= ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m.setId(rs.getString(1));
				m.setPassword(rs.getString(2));
				m.setName(rs.getString(3));
				m.setAge(rs.getInt(4));
				m.setGender(rs.getString(5));
				m.setEmail(rs.getString(6));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
		}
		return m;
	}

	public void delete(String id) {

		try {
			con = ds.getConnection();
			String sql = "delete from member where id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
		}
	}

	public int update(Member m) {

		try {
			con = ds.getConnection();
			String sql = "update member set name = ?, age = ?, gender = ? , email = ? where id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setInt(2, m.getAge());
			pstmt.setString(3, m.getGender());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException sq) {
					sq.printStackTrace();
				}
			}
		}
		return result;
	}

}
