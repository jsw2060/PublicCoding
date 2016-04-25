package com.puco.board.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.io.*;
import java.util.*;

public class FreeBoardDAO {
	private static SqlSessionFactory ssf;
	static
	{
		try
		{
			Reader reader=Resources.getResourceAsReader("Config.xml");
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	//��ü ������ �б�
	public static List<FreeBoardVO> FreeboardAllData(Map map)
	{
		
		System.out.println(123);
		SqlSession session=ssf.openSession();
		System.out.println(456);
		List<FreeBoardVO> list=session.selectList("FreeboardAllData",map);
		
		session.close();
		return list;
	}
	//������
	public static int freeboardTotalpage()
	{
		SqlSession session=ssf.openSession();
		int count=session.selectOne("freeboardRowCount");
		session.close();
		return (int)(Math.ceil(count/10.0));
	}
	//���뺸��
	public static FreeBoardVO freeboardContentData(int no) 
	{
		SqlSession session=ssf.openSession(true);
		session.update("freeboardHitIncrement",no);
		session.close();
		session=ssf.openSession();
		FreeBoardVO vo=session.selectOne("freeboardContentData",no);
		return vo;
	}
	//�۾���
	public static void freeboardInsert(FreeBoardVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("freeboardInsert",vo);
		session.close();
		
	}
	//�����ϱ�
	public static FreeBoardVO freeboardUpdate(int no)
	{
		SqlSession session=ssf.openSession();
		FreeBoardVO vo=session.selectOne("freeboardUpdate",no);
		session.close();
		return vo;
	}
	//�����ϱ�_ok
	public static boolean boardUpdateOk(FreeBoardVO vo)
	{
		boolean bCheck=false;
		SqlSession session=ssf.openSession();
		String pwd=session.selectOne("freeboardGetPwd",vo.getBno());
		session.close();
		if(pwd.equals(vo.getMpwd()))
		{
			bCheck=true;
			session=ssf.openSession(true);
			session.update("freeboardUpdate",vo);
			session.close();
		}
		else
		{
			bCheck=false;
		}
		return bCheck;
	}
	public static int FBreplyCount(int bno)
	{
		SqlSession session=ssf.openSession();
		int count=session.selectOne("FBreplyCount",bno);
		session.close();
		return count;
	}
}
