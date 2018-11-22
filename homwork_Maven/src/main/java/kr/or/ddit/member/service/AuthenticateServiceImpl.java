package kr.or.ddit.member.service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.vo.MemberVO;

public class AuthenticateServiceImpl implements IAuthenticateService{
	IMemberDAO memberDAO = new MemberDaoImpl();

	@Override
	public Object authenticate(MemberVO member) {
		Object result = null;
		MemberVO savedMember = memberDAO.selectMember(member.getMem_id());
		//값이 넘어왔는데
		if(savedMember!=null) {
			//만약에 그 아이디와 비밀번호 가 같다. 그러면 결과로 savedMember를 보내줌
			if(savedMember.getMem_pass().equals(member.getMem_pass())) {
				result = savedMember;
			//그럼 비밀번호가 틀린거지
			}else {
				result = ServiceResult.INVALIDPASSWORD;
			}
			
		}else { //해당하는 아이디가 없는 것
			result =ServiceResult.PKNOTFOUND;
		}
		return result;
	}

}
