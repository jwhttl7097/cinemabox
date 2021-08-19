<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style type="text/css">
		
		#btn-1 { 
			border : 1px solid #000; 
		}
		
		#btn-2 { 
			border : 1px solid #000; 
		}
		
</style>

<ul class="dropdown-menu1" aria-labelledby="navbarDropdown1" id="btn-1">
	<li>구매 후 취소에 관한 내용보기 ▽<br>
		<p id="box-1" style="display:none;">
		■ 연장/취소/환불 안내<br>
		- 본 상품은 구매일로부터 10일 이내에 취소 가능합니다.<br>
		- 유효기간은 본 상품의 유효기간 내에서 연장 신청이 가능하며, 1회 연장 시 3개월(92일) 단위로 연장됩니다.<br>
		- 구매일로부터 5년까지 유효기간 연장이 가능합니다.<br>
		- 최초 유효기간 만료 후에는 결제금액의 90%에 대해 환불 요청 가능하며, 환불 처리에 7일 이상의 시간이 소요될 수 있습니다. (접수처: 1544-0070)<br>
		- 구매 취소 및 환불 요청은 미사용 상품에 한해 가능하며, 사용한 상품에 대해서는 불가합니다.<br>
		- 구매한 관람권은 일괄 환불만 가능하며, 부분 환불 불가합니다.<br>
		  (예 : 2매 이상 한번에 구매 시 모든 관람권을 일괄 취소해야 하며, 낱장의 취소는 불가합니다.)<br>
		- 본 상품은 현금으로 환불이 불가합니다.<br>
		<br>
		※ 2020년 2월 4일 이후 구매 상품에 한하여 유효기간 연장 신청이 가능합니다.</p>
	</li>
</ul>
<br>
<br>
<!-- <a class="nav-link dropdown-toggle" id="navbarDropdown2" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">구매 후 취소 내용보기</a> -->
<ul class="dropdown-menu2" aria-labelledby="navbarDropdown2" id="btn-2">
	<li>상품 이용안내 내용보기 ▽ <br>
		<p id="box-2" style="display:none;">
		- 본 권은 구매 시 계정으로 자동 등록되며, 등록된 계정에서만 사용 가능합니다.<br>
		  (단! 선물 받은 PIN번호는 계정 내 스토어 교환권 등록 후 사용 가능합니다.)<br>
		- 본 권의 예매 가능한 유효기간은 구매일로부터 2년입니다.<br>
		- 가격 정책에 따라 티켓금액이 변동 될 수 있으며 이에 대한 차액 환불이 불가합니다. (조조/심야/청소년/어린이/마티네/우대 등)<br>
		- 본 권은 카카오 알림톡을 통해 전송 됩니다. (카카오톡 미설치 또는 미수신 고객은 MMS로 발송)<br>
		- 본 권은 메가박스 홈페이지, 어플에서만&nbsp;예매 가능합니다. (전화예매, 현장 매표소,&nbsp;무인발권기 예매 불가)<br>
		- 어플 및 홈페이지 예매방법: 지점 &gt; 영화명 &gt; 시간 &gt; 인원 &gt; 관람권/모바일상품권&nbsp;&gt; 스토어 관람권으로 전송 받은 PIN번호 16자리 입력 &gt;&nbsp;결제<br>
		- 구매 건당 PIN 번호가 생성됩니다.<br>
		- 메가박스 홈페이지 스토어 구매내역에서 PIN 번호 확인이 가능합니다.<br>
		- 일부 극장 [센트럴점, 일산벨라시타점, 삼천포점, 아트나인점], 특별관 [더 부티크, MX&nbsp;등], 특별석(로얄석, 커플석, 발코니 등) 및 특별콘텐트 예매가 불가합니다. (차액 지불 여부 상관없이 예매 불가)<br>
		- 본 권으로 영화 관람 시 메가박스 규정에 의해 일정의 포인트가 적립됩니다.</p>
	</li>
</ul>
<script type="text/javascript">
$("#btn-1").click(function() {
    $( "#box-1" ).slideToggle( "slow" );
});

$("#btn-2").click(function() {
    $( "#box-2" ).slideToggle( "slow" );
});  
</script>
      

