package com.puco.board.dao;
import java.sql.*;
import java.util.*;


public class BoardDAO {
    private Connection conn;
    private PreparedStatement ps;
    private final String URL="jdbc:oracle:thin:@211.238.142.87:1521:ORCL";
    // 1. ����̹� ��� 
    public BoardDAO()
    {
    	try
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    }
    // 2. ���ᰴü ���
    public void getConnection()
    {
    	try
    	{
    		conn=DriverManager.getConnection(URL,"scott","tiger");
    	}catch(Exception ex){}
    }
    // 3. ��������
    public void disConnection()
    {
    	try
    	{
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close();
    	}catch(Exception ex){}
    }
    // 4. ���
    // 1) ���  ==> SELECT
    public List<BoardDTO> boardListData(int page)
    {
    	List<BoardDTO> list=
    			new ArrayList<BoardDTO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT no,subject,name,regdate,hit,group_tab "
    				  +"FROM board ORDER BY group_id DESC,group_step ASC";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		int i=0;
    		int j=0;
    		int pagecnt=(page*10)-10;
    		while(rs.next())
    		{
    			if(i<10 && j>=pagecnt)
    			{
    				BoardDTO d=new BoardDTO();
    				d.setNo(rs.getInt(1));
    				d.setSubject(rs.getString(2));
    				d.setName(rs.getString(3));
    				d.setRegdate(rs.getDate(4));
    				d.setHit(rs.getInt(5));
    				d.setGroup_tab(rs.getInt(6));
    				list.add(d);
    				i++;
    			}
    			j++;
    		}
    		
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		disConnection();
    	}
    	return list;
    }
    

    // 2) ���뺸�� ==> SELECT ~ WHERE 
    public BoardDTO boardContentData(int no){
    	
    	BoardDTO d = new BoardDTO();
    	try {
			
    		getConnection();
    		String sql="UPDATE board SET hit=hit+1 WHERE no=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1,no);
    		ps.executeUpdate();
    		ps.close();
    		
    		//�������б�
    		sql="SELECT no,name,subject,content,regdate,hit "+
    				"FROM board WHERE no=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		ResultSet rs =ps.executeQuery();
    		rs.next();
    		d.setNo(rs.getInt(1));
    		d.setName(rs.getString(2));
    		d.setSubject(rs.getString(3));
    		d.setContent(rs.getString(4));
    		d.setRegdate(rs.getDate(5));
    		d.setHit(rs.getInt(6));
    		rs.close();
    		
    		
    		
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("content>>"+e.getMessage());
		}finally{
			disConnection();
		}
    	
    	return d;
    }
    
    // 3) �߰�  ==> INSERT
    // 4) ����  ==> UPDATE
    public void boardModify(int no,BoardDTO d){
    	try {
			getConnection();
			//no,name,subject,content,regdate,hit
			String sql="UPDATE board SET "
					+"name=?, subject=?,content=?,pwd=?,hit=0 "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, d.getName());
			ps.setString(2, d.getSubject());
			ps.setString(3, d.getContent());
			ps.setString(4, d.getPwd());
			ps.setInt(5, d.getNo());
			
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("mod>>"+e.getMessage());
		}finally{
			disConnection();
		}
    	
    }
    
    // 5) �亯  ==> INSERT
    public void boardReply(int root, BoardDTO d){
    	//=> root gi gs gt root --> gi, gs+1,gt+1,root
    	//=> insert
    	/*
    	 					gi 	gs	gt	
    	 	AAAAA			2	0	0				
    	 	  =>BBBB		2	1	1
    	 	    =>CCCC		2	2	2
    	 	  =>DDDD		2	1	1		-> �޸��� ������ ��Ų�� �׷��� �̹� �ִ� gs�� 0�̻��� �͵��� ���� gs�� +1�� ���ش�.
    	 	  								====>�ֻ����� depth_total,(gi ���� gs�� 0�ΰ��� depth�÷�����) ����� 
    	 	  									gs+depth_total�� �ϸ� ����������?
    	 	  
    	 	
    	  
    	 */
    	//=> root==>depth����
    	try{
    		getConnection();
    		String sql="SELECT group_id, group_step, group_tab "
    				+"FROM board WHERE no=?"; 
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, root);
    		ResultSet rs = ps.executeQuery();
    		rs.next();
    		int gi=rs.getInt(1);
    		int gs=rs.getInt(2);
    		int gt = rs.getInt(3);
    		rs.close();
    		ps.close();
    		
    		sql="UPDATE board SET "
    				+"group_step=group_step+1 "
    				+"WHERE group_id=? AND group_step>?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, gi);
    		ps.setInt(2, gs);
    		ps.executeUpdate();
    		ps.close();
    		
    		sql="UPDATE board SET "
    				+"depth=depth+1 WHERE no=?";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, root);
    		ps.executeUpdate();
    		
    		ps.close();
    		
    		sql="INSERT INTO board(no,name,subject,content,pwd,group_id,group_step,group_tab,root) "
					+"VALUES((SELECT NVL(MAX(no)+1,1) FROM board),"
					+"?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,d.getName());
			ps.setString(2,d.getSubject());
			ps.setString(3,d.getContent());
			ps.setString(4,d.getPwd());
			ps.setInt(5, gi);
			ps.setInt(6, gs+1);
			ps.setInt(7, gt+1);
			ps.setInt(8, root);
			
			
			ps.executeUpdate();//����Ŀ��
    		
    		
    		
    		
    	}catch(Exception e){
    		System.out.println("reply>>"+e.getMessage());
    				
    		
    	}finally{
    		disConnection();
    	}
    	
    	
    	
    	
    }
    
    // 6) ���� ==> DELETE
    public boolean boardDelete(int no, String pwd){
    	boolean bCheck=false;
    	try {
			getConnection();
			// Passwprd üũ 
    		String sql="SELECT pwd FROM board "
    				  +"WHERE no=?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs= ps.executeQuery();
			rs.next();
			String dp_pwd=rs.getString(1);
			rs.close();
			ps.close();
			if(dp_pwd.equals(pwd)){
				bCheck=true;
				sql="SELECT root,depth FROM board "+
				"WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				rs=ps.executeQuery();
				rs.next();
				int root=rs.getInt(1);
				int depth=rs.getInt(2);
				rs.close();
				ps.close();
				if(depth==0){
					//DELETE
					sql="DELETE FROM board "
							+"WHERE no=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, no);
					ps.executeUpdate();
					ps.close();
					
				}else{
					//UPDATE
					sql="UPDATE board SET "
						+"subject=?,content=? "
						+"WHERE no=?";
					String msg="�����ڰ� ������ �Խù��Դϴ�";
					ps=conn.prepareStatement(sql);
					ps.setString(1, msg);
					ps.setString(2, msg);
					ps.setInt(3, no);
					ps.executeUpdate();
					ps.close();
				}
				//depth����
						
				sql="UPDATE board SET "
						+"depth=depth-1 "
						+"WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, root);
				ps.executeUpdate();
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("DELETE>>"+e.getMessage());
		}finally{
			disConnection();
		}
    	
    	return bCheck;
    }
    // 7) ã�� ==> LIKE
    // 8) �������� ���ϱ�  ==> CEIL(COUNT(*)/10)
    
    public int boardTotal()
    {
    	int total=0;
    	try
    	{
    		getConnection();
    		String sql="SELECT CEIL(COUNT(*)/10) FROM board";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		total=rs.getInt(1);
    		rs.close();
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		disConnection();
    	}
    	return total;
    }
    
   /* INSERT INTO board(no,name,subject,content,pwd,group_id)
    VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'ȫ�浿','�亯���Խ��� ����','������ �����...','1234',(SELECT NVL(MAX(group_id)+1,1) FROM board));
    */
    
    public void boardInsert(BoardDTO d){
    	try {
			getConnection();
			String sql="INSERT INTO board(no,name,subject,content,pwd,group_id) "
					+"VALUES((SELECT NVL(MAX(no)+1,1) FROM board),"
					+"?,?,?,?,(SELECT NVL(MAX(group_id)+1,1) FROM board))";
			ps=conn.prepareStatement(sql);
			ps.setString(1,d.getName());
			ps.setString(2,d.getSubject());
			ps.setString(3,d.getContent());
			ps.setString(4,d.getPwd());
			
			ps.executeUpdate();//����Ŀ��
			
			
		} catch (Exception e) {
			System.out.println("INSERT>>"+e.getMessage());
		}finally{
			disConnection();
		}
    }
    
    public int boardCount()
    {
    	int total=0;
    	try
    	{
    		getConnection();
    		String sql="SELECT COUNT(*) FROM board";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		total=rs.getInt(1);
    		rs.close();
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		disConnection();
    	}
    	return total;
    }
}
