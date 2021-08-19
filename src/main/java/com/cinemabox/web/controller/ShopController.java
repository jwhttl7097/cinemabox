package com.cinemabox.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShopController {

	@GetMapping(path = {"shop"})
	public String giftShop() {
		return "shop/giftShop";	
	}
	
	@GetMapping(path = {"itemDetail"})
	public String itemDetail() {
		return "shop/itemDetail";	
	}
}
