package member.dao;

import java.util.List;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public interface MemberDAO {
	//save
	public void join(MemberDTO memberDto);
	//update
	public void updatePwd(MemberDTO member);
	public void memberUpdate(MemberDTO member);
	//delete
	public void deleteMember(MemberDTO member);
	//get
	public MemberDTO get(MemberDTO member);
	//list
	public List<ZipcodeDTO> getZipcodeList(String dong);
	public List<MemberDTO> getAllUserList(MemberDTO member);
	public int getUserCount();
	
}
