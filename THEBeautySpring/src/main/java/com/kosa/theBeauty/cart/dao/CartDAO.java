package com.kosa.theBeauty.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosa.theBeauty.cart.domain.CartListVO;
import com.kosa.theBeauty.cart.domain.CartVO;

@Mapper
public interface CartDAO {

	// 상품(CartVO)을 장바구니에 추가 
    void addToCart(CartVO cartvo);
}