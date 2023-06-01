package com.kosa.theBeauty.cart.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.cart.domain.CartListVO;
import com.kosa.theBeauty.cart.domain.CartVO;
import com.kosa.theBeauty.cart.service.CartService;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("cart")
@RequiredArgsConstructor
public class CartController {
	
	private final CartService service;

	// 상품을 장바구니에 추가
	@DebugLog
	@PostMapping("addToCart")
	public String addToCart(@SessionAttribute UserVO currUser, @RequestParam(value="productSeq") int productSeq,@RequestParam(value="productCount") int productCount, Model model) {

		CartVO cartvo = new CartVO();
		System.out.println(currUser);
		cartvo.setUserSeq(currUser.getUserSeq());
		cartvo.setProductSeq(productSeq);
		cartvo.setProductCount(productCount);
		service.addToCart(cartvo);
		
		return "redirect:cartPage";
	}
	
	// 장바구니 페이지로 이동
	@DebugLog
	@GetMapping("cartPage")
	public String getCartPage(@SessionAttribute UserVO currUser, Model model) {
		
		List<CartListVO> list = service.getCartList(currUser.getUserSeq());
		model.addAttribute("cartList", list);
		return "cart/cartPage";
	}
	
}