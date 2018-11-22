package kr.or.ddit.buyer.dao;

import java.util.List;

import kr.or.ddit.vo.BuyerVO;

public interface IBuyerDAO {
	public int insertBuyer(BuyerVO buyer);
	
	public List<BuyerVO> selectBuyerList();
	
	public BuyerVO selectBuyer(String buyer_id);
	
	public int updateBuyer(BuyerVO buyer);
	
	public int deleteBuyer(String buyer_id);
	
}
