package member.service;

import java.util.HashMap;
import java.util.List;
import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public interface MemberService {

	MemberDTO memberGet(MemberDTO member);
	void memberJoin(MemberDTO memberDto);
	List<ZipcodeDTO> zipcodeListGet(String dong);
	void memberUpdate(MemberDTO member);
	void memberPwdUpdate(MemberDTO member);
	void memeberDelete(MemberDTO member);
	HashMap memberPagingGet(int pg);
}
