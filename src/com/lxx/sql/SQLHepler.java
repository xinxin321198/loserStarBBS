package com.lxx.sql;

import java.sql.*;
/**
 * ��Ҫ�õ��ĸ��ַ���
 * @author lsy
 *
 */
public class SQLHepler {
	/**
	 * �ҵ���id�ĺ��ӽڵ�ɾ������Ȼ��ɾ���Լ�
	 * @param conn һ��java.sql.Connection����
	 * @param id ��Ҫɾ���Ľڵ�id
	 */
	public static void delete(Connection conn, int id)// �ҵ���id�ĺ���ɾ������Ȼ��ɾ���Լ�
	{

		Statement st = null;
		ResultSet rs = null;
		String sql = "select * from article where pid =" + id;// �ҵ��˽ڵ�������ӽڵ�
		try {
			conn.setAutoCommit(false);
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				delete(conn, rs.getInt("id"));// ���������ӽڵ㣬��ɾ�����ǵĺ��ӣ�Ȼ��ɾ���Լ�
			}

			st.addBatch("delete from article where id=" + id);// ɾ���Լ�(ɾ��֮ǰ��Ҫɾ�����������ӽڵ�)
			st.executeBatch();
			conn.setAutoCommit(true);
		} catch (SQLException exception) {
			exception.printStackTrace();
		} finally {
			try {
				if (null != rs) {
					rs.close();
					rs = null;
				}
			} catch (SQLException exception) {
				exception.printStackTrace();
			} finally {
				try {
					if (null != st) {
						st.close();
						st = null;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (null != conn) {
						try {
							conn.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
		}
	}

	/**
	 * ����һ������
	 * @param conn һ��java.sql.Connection����
	 * @param title ���ӵı���
	 * @param cont ���ӵ�����
	 */
	public static void add(Connection conn, String title, String cont) {
		String sql = "insert into article(pid,title,cont,pdate,isleaf) values(0,?,?,now(),0)";
		PreparedStatement pst = null;
		try {
			conn.setAutoCommit(false);
			pst = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, title);
			pst.setString(2, cont);
			pst.execute();
			ResultSet rskey = pst.getGeneratedKeys();
			rskey.next();
			int key = rskey.getInt(1);
			pst
					.addBatch("update article set rootid=" + key + "where id="
							+ key);
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (null != conn) {
						try {
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}

	/**
	 * �ظ�һ������
	 * @param conn һ��java.sql.Connection����
	 * @param pid ��Ҫ�ظ��Ľڵ�id
	 * @param rootid ��������id
	 * @param title ���ӱ���
	 * @param cont ��������
	 */
	public static void restore(Connection conn, int pid, int rootid,
			String title, String cont) {
		PreparedStatement pstm = null;
		String sql = "insert into article(pid,rootid,title,cont,pdate,isleaf) values(?,?,?,?,now(),0)";
		try {
			conn.setAutoCommit(false);
			pstm = conn.prepareStatement(sql);

			pstm.setInt(1, pid);
			pstm.setInt(2, rootid);
			pstm.setString(3, title);
			pstm.setString(4, cont);
			pstm.execute();

			pstm.addBatch("update article set isleaf=1 where id=" + pid);
			pstm.executeBatch();
			conn.commit();

			conn.setAutoCommit(true);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (null != pstm) {
				try {
					pstm.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					if (null != conn) {
						try {
							conn.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}

				}
			}

		}

	}

	/**
	 * ����ID�������ڴ�ID�������ӽڵ�
	 * @param conn һ��java.sql.Connection����
	 * @param id ��Ҫ���ҵ�id
	 * @param level �㼶
	 * @param login �Ƿ��¼
	 * @return ���ҵĽ����String����
	 */
	public static String tree(Connection conn,int id,int level,boolean login)
	{
		Statement st = null;
		ResultSet rs = null;
		String s = "";
		String sql = "select * from article where pid ="+id;
		String nbsp = "";
		for(int i = 0 ;i<level;i++)
		{
			nbsp+="&nbsp&nbsp&nbsp";
		}
		try
		{
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			String delString = "";
			while(rs.next())//�����������ڴ�ID���ӽڵ�
			{
				if(login)
				{
					delString="<td><a href='delete.jsp?id="+rs.getInt("id")+"'>ɾ��</a></td>";
				}
				s+="<tr><td>"+nbsp+rs.getString("title")+"</td><td>"+rs.getString("cont")+"</td><td><a href='restore.jsp?id="+rs.getInt("id")+"'>�ظ�</a></td>"+delString+"<tr>";
				if(1==rs.getInt("isleaf"))//�жϴ˽ڵ��Ƿ����ӽڵ�
				{
					s+=tree(conn,rs.getInt("id"),level+1,login);	//����ID���������ӽڵ�
				}
			}
		}
		catch(SQLException exception)
		{
			exception.printStackTrace();
		}
		finally
		{
			try
			{
				if(null!=rs)
				{
					rs.close();
					rs = null;	
				}	
			}catch(SQLException exception)
			{
				exception.printStackTrace();
			}
			finally
			{
				try
				{
					if(null!=st)
					{
						st.close();
						st = null;
					}	
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
			}
		}
		return s;
	}
}
