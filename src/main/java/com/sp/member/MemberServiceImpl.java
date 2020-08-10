package com.sp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	@Override
	public void insertMember(Member dto, String pathname) throws Exception {

		try {

			if(dto.getUpload() != null && ! dto.getUpload().isEmpty()) {
				String newFileName = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setImageFileName(newFileName);				
				dao.insertData("member.insertMember", dto);				
			}
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

	@Override
	public Member readMember(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
