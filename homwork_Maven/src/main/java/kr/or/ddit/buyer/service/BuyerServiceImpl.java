package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.buyer.dao.BuyerDAOImpl;
import kr.or.ddit.buyer.dao.IBuyerDAO;
import kr.or.ddit.vo.BuyerVO;

public class BuyerServiceImpl implements IBuyerService{
	IBuyerDAO buyerDAO = new BuyerDAOImpl();

	@Override
	public List<BuyerVO> retrieveBuyerList() {
		List<BuyerVO> buyerList = buyerDAO.selectBuyerList();
		return buyerList;
	}
	@Override
	public BuyerVO retrieveBuyer(String buyer_id) {
		BuyerVO buyer = buyerDAO.selectBuyer(buyer_id);
		return buyer;
	}
	@Override
	public ServiceResult registBuyer(BuyerVO buyer) {
		ServiceResult result = null;
		if(buyerDAO.selectBuyer(buyer.getBuyer_id())==null) {
			int rowCnt = buyerDAO.insertBuyer(buyer);
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
	

}
