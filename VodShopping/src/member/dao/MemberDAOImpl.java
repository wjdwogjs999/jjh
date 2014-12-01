package member.dao;


import java.util.List;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

@Service
public class MemberDAOImpl extends HibernateDaoSupport implements MemberDAO {
	
	@Override
	public void join(MemberDTO memberDto){
		try{
			getHibernateTemplate().save(memberDto);
		}catch(DataAccessException e){
			throw e;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ZipcodeDTO> getZipcodeList(String dong) {
		return 	(List<ZipcodeDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(ZipcodeDTO.class).add(Restrictions.like("dong", "%"+dong+"%")));
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public MemberDTO get(MemberDTO member) {
		List<MemberDTO> list=null;
		if(member.getEmail()!=null && member.getName()!=null && member.getId()!=null){
			list = (List<MemberDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(MemberDTO.class).add(Restrictions.and(Restrictions.eq("id", member.getId()), Restrictions.and(Restrictions.eq("name", member.getName()), Restrictions.eq("email", member.getEmail())))));
		}else if(member.getEmail()!=null && member.getName()!=null){
			list = (List<MemberDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(MemberDTO.class).add(Restrictions.and(Restrictions.eq("name", member.getName()), Restrictions.eq("email", member.getEmail()))));
					
		}else{
			list = (List<MemberDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(MemberDTO.class).add(Restrictions.eq("id", member.getId())));
		}		
		if(list.size()==0){
			return null;
		}
		MemberDTO dto=(MemberDTO)list.get(0);
		return dto;
	}

	@Override
	public void updatePwd(MemberDTO member){
		try{
			MemberDTO oldMember = (MemberDTO)getHibernateTemplate().get(MemberDTO.class, member.getId());
			oldMember.setPwd(member.getPwd());
		}catch(DataAccessException e){
			throw e;
		}
	}

	@Override
	public void memberUpdate(MemberDTO member){
		try{
			getHibernateTemplate().update(member);
		}catch(DataAccessException e){
			throw e;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberDTO> getAllUserList(MemberDTO member) {
		return (List<MemberDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(MemberDTO.class).addOrder(Order.asc("id")), member.getStartIndex(), member.getEndIndex());
	}

	@Override
	public int getUserCount() {
		Long count=(long)getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(MemberDTO.class).setProjection(Projections.rowCount()).uniqueResult();
		return count.intValue();
	}

	@Override
	public void deleteMember(MemberDTO member){
		try{
			getHibernateTemplate().delete(member);
		}catch(DataAccessException e){
			throw e;
		}
	}

}
