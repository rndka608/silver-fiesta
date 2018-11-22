package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.CommonException;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	// 의존 객체를 직접 생성하는 방식 : 결합력 최상
	IMemberDAO memberDAO = new MemberDaoImpl();
	
	@Override
	public ServiceResult registMember(MemberVO member) {
		ServiceResult result = null;
		if(memberDAO.selectMember(member.getMem_id())==null) {
			int rowCnt = memberDAO.insertMember(member);
			if(rowCnt > 0 ) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILE;
			}
		}else {
			result = ServiceResult.PKDUPLICATED;
		}
		return result;
	}

	@Override
	public List<MemberVO> retrieveMemberList() {
		List<MemberVO> memberList = memberDAO.selectMemberList();
		return memberList;
	}

	@Override
	public MemberVO retrieveMember(String mem_id) {
		MemberVO member = memberDAO.selectMember(mem_id);
		if(member==null) {
			throw new CommonException(mem_id+"에 해당하는 회원이 없음.");
		}
		return member;
	}

	@Override
	public ServiceResult modifyMember(MemberVO member) {
		ServiceResult result = null;
		MemberVO membervo = retrieveMember(member.getMem_id());	
			if(membervo.getMem_pass().equals(member.getMem_pass())) {
				int rowCnt = memberDAO.updateMember(member);
				if(rowCnt > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILE;
				}
			}else {
				result = ServiceResult.INVALIDPASSWORD;	
			}
		
		return result;
	}

	@Override
	public ServiceResult removeMember(MemberVO member) {
		ServiceResult result = null;
		MemberVO membervo = retrieveMember(member.getMem_id());
		if(membervo.getMem_pass().equals(member.getMem_pass())) {
			int rowCnt = memberDAO.deleteMember(member.getMem_id());
			if(rowCnt > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILE;
			}
		}else {
			result = ServiceResult.INVALIDPASSWORD;	
		}
	
	return result;
	}

}
