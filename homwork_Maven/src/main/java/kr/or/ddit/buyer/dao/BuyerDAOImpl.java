package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.db.ibatis.CustomSqlMapClientBuilder;
import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.BuyerVO;

public class BuyerDAOImpl implements IBuyerDAO {

	SqlMapClient sqlMapclient = CustomSqlMapClientBuilder.getSqlMapClient();
	@Override
	public int insertBuyer(BuyerVO buyer) {
		try {
			return sqlMapclient.update("Buyer.insertBuyer", buyer);
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<BuyerVO> selectBuyerList() {
		try {
			List<BuyerVO> buyerList = sqlMapclient.queryForList("Buyer.selectBuyerList");
			return buyerList;
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public BuyerVO selectBuyer(String buyer_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBuyer(BuyerVO buyer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBuyer(String buyer_id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
