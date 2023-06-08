package com.kosa.theBeauty.cart.service;

import java.util.List;

import com.kosa.theBeauty.cart.domain.CartListVO;
import com.kosa.theBeauty.cart.domain.CartVO;

public interface CartService {
	
	List<CartListVO>selectCartList(int userSeq);
	void insertProduct(CartVO cartvo);
	void deleteProduct(int userSeq, int productSeq);
	void updateProductCount(int userSeq, int productSeq, int productCount);
}
