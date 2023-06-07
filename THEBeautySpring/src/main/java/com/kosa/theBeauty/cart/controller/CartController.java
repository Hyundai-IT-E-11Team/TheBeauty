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
	
	private final CartService cartService;

	@DebugLog
	@GetMapping("cartPage")
	public String getCartPage(HttpSession session, Model model) {

		UserVO currUser = (UserVO) session.getAttribute("currUser");
		List<CartListVO> list = cartService.selectCartList(currUser.getUserSeq());
		model.addAttribute("cartList", list);
		return "cart/cartPage";
	}
	
	@DebugLog
	@PostMapping("addToCart")
	public String addToCart(@SessionAttribute UserVO currUser, @RequestParam(value="productSeq") int productSeq,@RequestParam(value="productCount") int productCount, Model model) {

		CartVO cartvo = new CartVO();
		System.out.println(currUser);
		cartvo.setUserSeq(currUser.getUserSeq());
		cartvo.setProductSeq(productSeq);
		System.out.println(productCount);
		cartvo.setProductCount(productCount);
		cartService.insertProduct(cartvo);
		return "redirect:cartPage";
	}
	
	@DebugLog
	@PostMapping("deleteProduct")
	public ResponseEntity<String> deleteProduct(@SessionAttribute UserVO currUser, @RequestParam(value="productSeq") int productSeq) {
		
		cartService.deleteProduct(currUser.getUserSeq(), productSeq);
	    return new ResponseEntity<String>("sucess", HttpStatus.OK);
	}
	
	@DebugLog
	@PostMapping("updateProductCount")
	public ResponseEntity<String> updateProductCount(@SessionAttribute UserVO currUser, @RequestParam(value="productSeq") int productSeq, @RequestParam(value="productCount") int productCount) {
		
		cartService.updateProductCount(currUser.getUserSeq(), productSeq, productCount);
	    return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
