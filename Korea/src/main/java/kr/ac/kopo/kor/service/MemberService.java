package kr.ac.kopo.kor.service;

import java.util.List;

import kr.ac.kopo.kor.model.Member;
import kr.ac.kopo.kor.util.Pager;

public interface MemberService {

	List<Member> list(Pager pager);

	Member item(String id);

	void update(Member item);

	void delete(String id);

	boolean checkId(String id);

	void add(Member item);

	Member login(String id);

	Member findId(String name, String email);

	Member findPwd(String id, String email, String name);

}
