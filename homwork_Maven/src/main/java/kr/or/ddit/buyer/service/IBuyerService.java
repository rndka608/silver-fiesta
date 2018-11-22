package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.BuyerVO;

public interface IBuyerService {
	
	public List<BuyerVO> retrieveBuyerList();
	
	public BuyerVO retrieveBuyer(String buyer_id);
	
	public ServiceResult registBuyer(BuyerVO buyer);
}
