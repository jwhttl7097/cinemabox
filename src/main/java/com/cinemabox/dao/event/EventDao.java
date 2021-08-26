package com.cinemabox.dao.event;

import java.util.List;

import com.cinemabox.vo.Discount;
import com.cinemabox.vo.Event;
=======
package com.cinemabox.dao.event;
>>>>>>> b5978ffdf384297585369b44058233eb37aef63b


public interface EventDao {
	
	List<Event> getAllEvent();
	
	Event detailEvent(int no);

	Discount detailDiscount(int no);
}
<<<<<<< HEAD

=======
>>>>>>> b5978ffdf384297585369b44058233eb37aef63b
