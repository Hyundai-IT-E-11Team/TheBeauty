package com.kosa.theBeauty.cart.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.cart.dao.CartDAO;
import com.kosa.theBeauty.cart.domain.CartListVO;
import com.kosa.theBeauty.cart.domain.CartVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {
	
	private final CartDAO cartDAO;

	public List<CartListVO>selectCartList(int userSeq) {
		
		return cartDAO.selectCartListByUserSeq(userSeq);
	}

	public void insertProduct(CartVO cartvo) {

		cartDAO.insertProductByCart(cartvo);
	}
	
	public void deleteProduct(int userSeq, int productSeq) {
		
		cartDAO.deleteProductByUserSeqAndProductSeq(userSeq, productSeq);
	}
	
	public void updateProductCount(int userSeq, int productSeq, int productCount) {
		
		cartDAO.updateProductCountByUserSeqAndProductSeqAndProductCount(userSeq, productSeq, productCount);
	}
}
