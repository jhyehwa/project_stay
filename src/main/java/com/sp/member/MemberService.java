package com.sp.member;

public interface MemberService {
	public void insertMember(Member dto) throws Exception;
	
	public Member loginMember(String id);
}
