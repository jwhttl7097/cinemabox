package com.cinemabox.service.shop;

import java.util.List;

import com.cinemabox.dto.shop.ShopPurchaseDto;
import com.cinemabox.vo.Gift;
import com.cinemabox.vo.Snack;

public interface ShopService {

	/**
	 * 샵 구매내역 저장 서비스 
	 * @param shopPurchase 구매내역
	 */
	void shopPurchase(ShopPurchaseDto shopPurchase);
	
	/**
	 * 지정된 기프트번호에 해당하는 기프트의 상세정보를 제공하는 서비스
	 * @param giftNo 기프트 번호
	 * @return
	 */
	Gift getGiftByNo(int giftNo);
	
	/**
	 * 지정된 스넥번호에 해당하는 스넥의 상세정보를 제공하는 서비스
	 * @param snackNo 스넥 번호
	 * @return
	 */
	Snack getSnackByNo(int snackNo);
	
	/**
	 * 모든 스넥 정보를 제공하는 서비스
	 * @return 스넥 정보
	 */
	List<Snack> getAllSnackInfo();
	
	/**
	 * 모든 gift 정보를 제공하는 서비스
	 * @return gift 정보
	 */
	List<Gift> getAllGiftInfo();
}
