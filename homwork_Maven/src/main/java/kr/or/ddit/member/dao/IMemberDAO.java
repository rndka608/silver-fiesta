package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.vo.MemberVO;

/**
 * 
 * @author KJH
 * @since 2018. 11. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2018. 11. 21.      작성자명       회원관리를 위한 Persistence Layer
 * Copyright (c) 2018 by DDIT All right reserved
 * </pre>
 */
public interface IMemberDAO {
	/**
	 * 회원 신규 등록
	 * @param member 등록할 회원의 정보를 가진 VO
	 * @return 성공(>0) 실패
	 */
	public int insertMember(MemberVO member);
	
	/**
	 * 회원 목록 조회
	 * @return 존재하지 안흔ㄴ다면, SIZE()==0
	 */
	public List<MemberVO> selectMemberList();
	
	/**
	 * 회워정보 상세 조회
	 * @param mem_id 조회할 회원의 아이디
	 * @return 존재하지 않는다면, null 반환
	 */
	public MemberVO selectMember(String mem_id);
	
	/**
	 * 회원 정보 수정
	 * @param member 수정할 정보를 가진 vo
	 * @return 성공(>0) 실패
	 */
	public int updateMember(MemberVO member);
	
	/**
	 * 회원 정보 삭제
	 * @param mem_id 삭제할 회원의 아이디
	 * @return 성공(>0) 실패
	 */
	public int deleteMember(String mem_id);
}
