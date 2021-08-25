package com.cinemabox.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinemabox.dto.shop.ShopPurchaseDto;
import com.cinemabox.service.shop.ShopService;
import com.cinemabox.vo.Gift;
import com.cinemabox.vo.Snack;

@Controller
public class ShopController {

	@Autowired ShopService shopService;
	
	@GetMapping("/gift")
	public String giftShop(Model model) {
		// 전체 gift정보 조회하기
		List<Gift> giftList = shopService.getAllGiftInfo();
		
		// 뷰 페이지에 gift 목록 전달하기
		model.addAttribute("gifts", giftList);
		return "shop/giftShop";	
	}
	
	@GetMapping("/snack")
	public String snackShop(Model model) {
		// 전체 snack정보 조회하기
		List<Snack> snackList = shopService.getAllSnackInfo();
		
		// 뷰 페이지에 snack 목록 전달하기
		model.addAttribute("snacks", snackList);
		return "shop/snackShop";	
	}
	
	@GetMapping(path = {"giftDetail"})
	public String giftDetail(Model model, @RequestParam("giftNo") int giftNo) {
		Gift giftInfo = shopService.getGiftByNo(giftNo);
		model.addAttribute("giftInfo", giftInfo);
		return "shop/giftDetail";	
	}
	
	@GetMapping(path = {"snackDetail"})
	public String itemDetail(Model model, @RequestParam("snackNo") int snackNo) {
		Snack snackInfo = shopService.getSnackByNo(snackNo);
		model.addAttribute("snackInfo", snackInfo);
		return "shop/snackDetail";	
	}
	
	
//	@PostMapping("/purchase")
//	public String purchase(ShopPurchaseDto shopPurchase) {
//		
//		shopService.shopPurchase(shopPurchase);
//		return "redirect:gift";
//	}
	
	@RequestMapping("/purchase")
	public @ResponseBody ResponseEntity<ShopPurchaseDto> purchase(ShopPurchaseDto shopPurchase) {
		
		shopService.shopPurchase(shopPurchase);
		return new ResponseEntity<ShopPurchaseDto>(HttpStatus.OK);
	}
}
