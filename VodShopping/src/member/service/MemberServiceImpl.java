package member.service;

import java.util.HashMap;
import java.util.List;

import member.bean.MemberDTO;
import member.bean.MemberPaging;
import member.bean.ZipcodeDTO;
import member.controller.MemberController;
import member.dao.MemberDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private MemberPaging memberPaging;

	@Override
	@Transactional
	public MemberDTO memberGet(MemberDTO member) {
		return memberDao.get(member);
	}

	@Override
	@Transactional
	public void memberJoin(MemberDTO memberDto){
		try{
			memberDao.join(memberDto);
		}catch(DataAccessException e){
			e.printStackTrace();
			MemberController.setErrorCodeNumber(MemberController.DATAACCESS_ERROR);
		}
	}

	@Override
	@Transactional
	public List<ZipcodeDTO> zipcodeListGet(String dong) {
		return memberDao.getZipcodeList(dong);
	}

	@Override
	@Transactional
	public void memberUpdate(MemberDTO member){
		try{
			memberDao.memberUpdate(member);
		}catch(DataAccessException e){
			e.printStackTrace();
			MemberController.setErrorCodeNumber(MemberController.DATAACCESS_ERROR);
		}
	}

	@Override
	@Transactional
	public void memberPwdUpdate(MemberDTO member){
		try{
			memberDao.updatePwd(member);
		}catch(DataAccessException e){
			e.printStackTrace();
			MemberController.setErrorCodeNumber(MemberController.DATAACCESS_ERROR);
		}
	}

	@Override
	@Transactional
	public void memeberDelete(MemberDTO member){
		try{
			memberDao.deleteMember(member);
		}catch(DataAccessException e){
			e.printStackTrace();
			MemberController.setErrorCodeNumber(MemberController.DATAACCESS_ERROR);
		}
	}

	@Override
	@Transactional
	public HashMap memberPagingGet(int pg) {
		HashMap map = new HashMap();
		String paging = memberPaging.makePagingHTML(pg, 5, 10, memberDao.getUserCount());
		map.put("paging", paging);
		MemberDTO member = new MemberDTO();
		member.setStartIndex((pg*10-9)-1);
		member.setEndIndex(10);
		List<MemberDTO> list = memberDao.getAllUserList(member);
		map.put("memberList", list);
		return map;
	}
}
