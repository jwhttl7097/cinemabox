package com.cinemabox.service.theater;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.theater.TheaterDao;
import com.cinemabox.vo.Theater;

@Service
public class TheaterServiceImpl implements TheaterService{
	
	int theaterNumber = 0;

	@Autowired
	TheaterDao theaterDao;
	
	@Override
	public List<Theater> getAllLocation(String location) {
		return theaterDao.getAllLocation(location);
	}
	
	@Override
	public Theater getLocationByNo(int no, String number) {
		theaterNumber = Integer.parseInt(number);
		return theaterDao.getLocationByNo(no);
	}
	
	// 각 극장별 기본정보 크롤링
	@Override
	public void detailTheaterInfoByJsoup(String number) {
		theaterNumber = Integer.parseInt(number);
		try {
			Document doc = Jsoup.connect("https://www.megabox.co.kr/on/oh/ohc/Brch/infoPage.do?brchNo=" + theaterNumber).get();
			System.out.println(doc);
			Elements theaterAddress;
			theaterAddress = doc.select(".big");
//			String theaterAddressJ = theaterAddress.text();
			System.out.println("==================="+ theaterAddress.text());
//			Elements theaterFacility;
//			Elements theaterLatitude;
//			Elements theaterLongitude;
//			Elements contentFirst;
//			Elements contentSecond;
//			Elements contentMerit;
//			Elements floor;
//			Elements floorInfo;
//			Elements parkingInfo;
//			Elements parkingConfirm;
//			Elements parkingPrice;
//			Elements publicTransportName;
//			Elements publicTransportInfo;
	//		String[] lottoNums = lottoNo.split(" ");
	//		for (int i = 1; i <= lottoNums.length-1; i++) {
	//			String lottoNum = lottoNums[i-1];
	//			System.out.println(i + "번 : " + lottoNum);
	//		}
	//		int lastIndex = lottoNums.length-1;
	//		System.out.println("보너스 번호 : " + lottoNums[lastIndex]);
			
		} catch (Exception e) {
			System.out.println("Error!");
		}
	}
	
}
