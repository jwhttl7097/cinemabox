package com.cinemabox.dao.coupon;

import java.util.List;

import com.cinemabox.vo.Coupon;

public interface CouponDao {
	/**
	 * 쿠폰 마감일이 오늘 이전인 것들 갱신하기
	 * @param coupon 쿠폰번호, 쿠폰사용가능상태
	 */
	void updateCouponByExp(Coupon coupon);
	
	/**
	 * userId를 전달 받아 내 쿠폰정보들을 조회한다.
	 * @param userId 사용자아이디
	 * @return 내 쿠폰목록
	 */
	List<Coupon> getAllMyCoupon(String userId);
	
	/**
	 * 쿠폰 마감일이 오늘 이전인 것들 구하기
	 * @return 마감일이 지난 쿠폰목록
	 */
	List<Coupon> getCouponsByExp();
}
