package com.kosa.theBeauty.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
		System.out.println(productCount);
		cartvo.setProductCount(productCount);
		service.addToCart(cartvo);
		
		return "redirect:cartPage";
	}
	
	// 장바구니 페이지로 이동
	@DebugLog
	@GetMapping("cartPage")
	public String getCartPage(HttpSession session, Model model) {
		// 세션에서 currUser을 가져와 UserVO객체를 얻기
		UserVO currUser = (UserVO) session.getAttribute("currUser");
		// 사용자의 장바구니에 담긴 항목 목록을 가져오기
		List<CartListVO> list = service.getCartList(currUser.getUserSeq());
		model.addAttribute("cartList", list);
		return "cart/cartPage";
	}
	
	// 상품 삭제
	@DebugLog
	@PostMapping("deleteProduct")
	public ResponseEntity<String> deleteProduct(@SessionAttribute UserVO currUser, @RequestParam(value="productSeq") int productSeq) {
	    service.deleteProduct(currUser.getUserSeq(), productSeq);
	    return new ResponseEntity<String>("sucess", HttpStatus.OK);
	}
	
	// 장바구니에서 상품의 개수 변경 시 db업데이트
	@DebugLog
	@PostMapping("updateProductCount")
	public ResponseEntity<String> updateProductCount(@SessionAttribute UserVO currUser, @RequestParam(value="productSeq") int productSeq, @RequestParam(value="productCount") int productCount) {
	    service.updateProductCount(currUser.getUserSeq(), productSeq, productCount);
	    return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}