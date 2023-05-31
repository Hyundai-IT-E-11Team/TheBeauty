package com.kosa.theBeauty.cart.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.cart.dao.CartDAO;
import com.kosa.theBeauty.cart.domain.CartListVO;
import com.kosa.theBeauty.cart.domain.CartVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartService {
	
    private final CartDAO dao;

    // 상품(CartVO)을 장바구니에 추가 
    public void addToCart(CartVO cartvo) {
        dao.addToCart(cartvo);
    }
    
    // 사용자 시퀀스(userSeq)에 대한 장바구니 목록 반환
    public List<CartListVO> getCartList(int userSeq) {
        return dao.getCartList(userSeq);
    }
}