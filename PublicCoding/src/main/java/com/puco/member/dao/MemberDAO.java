package com.puco.member.dao;

import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.SqlSession;

public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
			System.out.println("MemberDAO WORKING~~~~");
		} catch (Exception ex) {
			System.out.println("MemberDAO ERROR " + ex.getMessage());
		}
	}
	public static String memberLogin(String id, String pwd) {
		String result="";
		System.out.println("MemberDAO 1");
		SqlSession session = ssf.openSession();
		System.out.println("MemberDAO 2");
		System.out.println("MemberDAO "+id);
		System.out.println("MemberDAO "+pwd);
		int count = session.selectOne("memberIdCount", id);
		System.out.println("MemberDAO 3");
		System.out.println(count);
		// �׷� ���̵� �ֳ�? ���ٸ�, ���̵� ���� ��� �۵�
		if(count==0) {
			result="NOID";
		}
		// ���̵� �����ϸ� ��й�ȣ ���� Ȯ���ϰ�, email���� �޾ƿ�
		else {
			System.out.println("memberGetpwd " + id);
			MemberDTO d = session.selectOne("memberGetpwd", id);
			System.out.println("memberGetpwd " + d.getMpwd());
			if(pwd.equals(d.getMpwd())) {
				System.out.println("memberGetpwd Work1");
				result = d.getMemail()+"|"+d.getMno();
				System.out.println(result);
			}
			else {
				System.out.println("memberGetpwd Wrong PWD");
				result="NOPWD";
			}
		}
		session.close();
		System.out.println("MemberDAO 4");
		return result;
	}
}
