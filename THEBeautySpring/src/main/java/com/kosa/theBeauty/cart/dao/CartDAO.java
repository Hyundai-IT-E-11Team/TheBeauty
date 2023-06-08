package com.kosa.theBeauty.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kosa.theBeauty.cart.domain.CartListVO;
import com.kosa.theBeauty.cart.domain.CartVO;

@Mapper
public interface CartDAO {
	
	List<CartListVO>selectCartListByUserSeq(int userSeq);
    void insertProductByCart(CartVO cartvo);
    void deleteProductByUserSeqAndProductSeq(@Param("userSeq") int userSeq, @Param("productSeq") int productSeq);
    void updateProductCountByUserSeqAndProductSeqAndProductCount(@Param("userSeq") int userSeq, @Param("productSeq") int productSeq, @Param("productCount") int productCount);
}
