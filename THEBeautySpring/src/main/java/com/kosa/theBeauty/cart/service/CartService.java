package com.kosa.theBeauty.cart.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
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
        
        // 이미 장바구니에 있는 상품인지 확인
        CartVO checkCartvo = dao.checkProductIncart(cartvo);//why list
        if (checkCartvo!=null) {
            // 이미 장바구니에 있는 상품이라면, 수량 업데이트
        	
            cartvo.setProductCount(checkCartvo.getProductCount());
            dao.updateCartProductQuantity(cartvo);
            
        } else {
            // 그렇지 않으면, 장바구니에 상품을 새로 추가
        	
            cartvo.setProductCount(1);
            dao.addToCart(cartvo);
        }     
    }


    // 사용자 시퀀스(userSeq)에 대한 장바구니 목록 반환
    public List<CartListVO> getCartList(int userSeq) {
        return dao.getCartList(userSeq);
    }    
}