package com.kosa.theBeauty.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kosa.theBeauty.cart.domain.CartListVO;
import com.kosa.theBeauty.cart.domain.CartVO;

@Mapper
public interface CartDAO {

	// 상품(CartVO)을 장바구니에 추가 
    void addToCart(CartVO cartvo);
    
    // 사용자 시퀀스(userSeq)에 대한 장바구니 목록 반환
    List<CartListVO> getCartList(int userSeq);
    
    // 상품 삭제
    void deleteProduct(@Param("userSeq") int userSeq, @Param("productSeq") int productSeq);
    
	// 장바구니에서 상품의 개수 변경 시 db업데이트
    void updateProductCount(@Param("userSeq") int userSeq, @Param("productSeq") int productSeq, @Param("productCount") int productCount);
}