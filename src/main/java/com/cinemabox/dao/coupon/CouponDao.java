package com.cinemabox.dao.coupon;

import java.util.List;

import com.cinemabox.vo.Coupon;

public interface CouponDao {
	/**
	 * userId를 전달 받아 내 쿠폰정보들을 조회한다.
	 * @param userId 사용자아이디
	 * @return 내 쿠폰목록
	 */
	List<Coupon> getAllMyCoupon(String userId);
}
