package com.puco.board.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.test.context.jdbc.Sql;

import java.io.*;
import java.util.*;

public class FreeBoardDAO {
	private static SqlSessionFactory ssf;
	static
	{
		try
		{
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	//��ü ������ �б�
	public static List<FreeBoardVO> FreeboardAllData(Map map)
	{
		
		//System.out.println(123);
		SqlSession session=ssf.openSession();
		//System.out.println(456);
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
	public static FreeBoardVO freeboardUpdate(int bno)
	{
		SqlSession session=ssf.openSession();
		FreeBoardVO vo=session.selectOne("freeboardContentData",bno);
		session.close();
		return vo;
	}
	//�����ϱ�_ok
	public static void freeboardUpdateOk(FreeBoardVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.update("freeboardUpdateOk",vo);
		session.close();
	}
	
	public static int FBreplyCount(int Rno)
	{
		SqlSession session=ssf.openSession();
		int count=session.selectOne("FBreplyCount",Rno);
		session.close();
		return count;
	}
	public static List<ReplyVO> FBreplyAllData(Map map)
	{
		SqlSession session=ssf.openSession();
		System.out.println("���� ������ : "+map);
		List<ReplyVO> list=session.selectList("FBreplyAllData",map);
		System.out.println("list in DAO"+list);
		session.close();
		return list;
	}
	public static void FBreplyInsert(ReplyVO vo)
	{
		System.out.println("����Ȯ��");
		SqlSession session=ssf.openSession(true);
		System.out.println("trueȮ��");
		session.insert("FBreplyInsert",vo);
		System.out.println("voȮ��");
		session.close();
	}
	public static void FBreplyUpdate(ReplyVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.update("FBreplyUpdate",vo);
		session.close();
	}
	public static ReplyVO FBreplyParentData(int bno)
	{
		SqlSession session=ssf.openSession();
		ReplyVO vo=session.selectOne("FBreplyParentData",bno);
		session.close();
		return vo;
	}
	//�Խñ� ����
	public static void freeboardDelete(int no)
	{
		SqlSession session=ssf.openSession(true);
		session.delete("freeboardDelete",no);
		session.close();
	}
	//����� ���
	public static void FBreplyStepIncrement(ReplyVO vo) 
	{
		SqlSession session = ssf.openSession(true);
		session.update("FBreplyStepIncrement", vo);
		session.close();
	}
}
