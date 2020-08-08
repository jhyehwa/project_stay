package com.sp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private CommonDAO dao;

	@Override
	public void insertMember(Member dto) throws Exception {

		try {
			dao.insertData("member.insertMember", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public Member loginMember(String id) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.loginMember", id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

}
