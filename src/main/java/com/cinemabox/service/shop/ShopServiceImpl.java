package com.cinemabox.service.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cinemabox.dao.shop.ShopDao;
import com.cinemabox.dto.shop.ShopPurchaseDto;
import com.cinemabox.vo.Gift;
import com.cinemabox.vo.Snack;

@Service
@Transactional
public class ShopServiceImpl implements ShopService {
	
	@Autowired ShopDao shopDao;

	@Override
	public void shopPurchase(ShopPurchaseDto shopPurchase) {
		shopDao.insertShopPurchase(shopPurchase);
	}

	@Override
	public Gift getGiftByNo(int giftNo) {
		Gift giftInfo = shopDao.getGiftByNo(giftNo);
		return giftInfo;
	}

	@Override
	public Snack getSnackByNo(int snackNo) {
		Snack snackInfo = shopDao.getSnackByNo(snackNo);
		return snackInfo;
	}

	@Override
	public List<Snack> getAllSnackInfo() {
		return shopDao.getAllSnackInfo();
	}

	@Override
	public List<Gift> getAllGiftInfo() {
		return shopDao.getAllGiftInfo();
	}

	

}
