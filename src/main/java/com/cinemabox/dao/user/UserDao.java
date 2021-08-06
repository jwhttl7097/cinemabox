package com.cinemabox.dao.user;

import com.cinemabox.vo.User;

public interface UserDao {

	/**
	 * 지정된 사용자정보를 데이터베이스에 저장한다.
	 * @param user 신규 사용자정보
	 */
	void insertUser(User user);
	
	/**
	 * 지정된 사용자아이디로 데이터베이스에서 사용자정보를 조회해서 반환한다.
	 * @param userId 사용자 아이디
	 * @return 사용자정보, null일 수 있음
	 */
	User getUserById(String userId);
	
	/**
	 * 지정된 사용자이메일로 데이터베이스에서 사용자정보를 조회해서 반환한다.
	 * @param userId 사용자 이메일
	 * @return 사용자정보, null일 수 있음
	 */
	User getUserByEmail(String userEmail);
}
