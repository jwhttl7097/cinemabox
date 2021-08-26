<<<<<<< HEAD
package com.cinemabox.service.event;

import java.util.List;

import com.cinemabox.dto.Event.EventDto;
=======
package com.cinemabox.service.event;

import java.util.List;

import com.cinemabox.dto.Event.EventDto;
>>>>>>> b5978ffdf384297585369b44058233eb37aef63b
import com.cinemabox.vo.Product;

public interface ProductService {
	
	String getAllProduct(String email);
	
	List<Product> getProductName();

	List<EventDto> getWinnerList(); // 당첨자 조회

}
<<<<<<< HEAD

