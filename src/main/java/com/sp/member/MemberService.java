package com.sp.member;

public interface MemberService {
	public void insertMember(Member dto, String pathname) throws Exception;
	
	public Member loginMember(String id);
	public Member readMember(String id);
}
