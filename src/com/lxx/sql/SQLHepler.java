package com.lxx.sql;

import java.sql.*;
/**
 * 需要用到的各种方法
 * @author lsy
 *
 */
public class SQLHepler {
	/**
	 * 找到此id的孩子节点删除掉，然后删除自己
	 * @param conn 一个java.sql.Connection对象
	 * @param id 需要删除的节点id
	 */
	public static void delete(Connection conn, int id)// 找到此id的孩子删除掉，然后删除自己
	{

		Statement st = null;
		ResultSet rs = null;
		String sql = "select * from article where pid =" + id;// 找到此节点的所有子节点
		try {
			conn.setAutoCommit(false);
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				delete(conn, rs.getInt("id"));// 遍历所有子节点，并删除它们的孩子，然后删除自己
			}

			st.addBatch("delete from article where id=" + id);// 删除自己(删除之前需要删除它的所有子节点)
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
	 * 发表一个新帖
	 * @param conn 一个java.sql.Connection对象
	 * @param title 帖子的标题
	 * @param cont 帖子的内容
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
	 * 回复一个帖子
	 * @param conn 一个java.sql.Connection对象
	 * @param pid 需要回复的节点id
	 * @param rootid 主题帖的id
	 * @param title 帖子标题
	 * @param cont 帖子内容
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
	 * 接收ID，找属于此ID的所有子节点
	 * @param conn 一个java.sql.Connection对象
	 * @param id 需要查找的id
	 * @param level 层级
	 * @param login 是否登录
	 * @return 查找的结果，String对象
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
			while(rs.next())//遍历所有属于此ID的子节点
			{
				if(login)
				{
					delString="<td><a href='delete.jsp?id="+rs.getInt("id")+"'>删除</a></td>";
				}
				s+="<tr><td>"+nbsp+rs.getString("title")+"</td><td>"+rs.getString("cont")+"</td><td><a href='restore.jsp?id="+rs.getInt("id")+"'>回复</a></td>"+delString+"<tr>";
				if(1==rs.getInt("isleaf"))//判断此节点是否还有子节点
				{
					s+=tree(conn,rs.getInt("id"),level+1,login);	//传入ID，继续找子节点
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
