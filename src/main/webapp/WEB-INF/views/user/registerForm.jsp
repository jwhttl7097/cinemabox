<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>회원가입</title>
<style type="text/css">
	#nav-tab{
		background-color : #ffc107;
	}
	
	.nav-link {
		color : white;
	}
	
	.nav-link:active{
		color : black;
	}
	
	.input-text{
		width: 350px;
		height:35px;
	}

</style>
</head>
<body>
<div class="row mt-4 mb-4">
	<div class="col-12 text-center">
		<a class="navbar-brand" href="/cinemabox/home" style="font-size:25px; color:black; font-weight: bolder;"><i class="fas fa-film mx-2"></i>CINEMA BOX</a>
	</div>
</div>
<div class="row">
	<div class="col-6 offset-3">
		<nav>
  			<div class="nav nav-tabs d-flex justify-content-around" id="nav-tab" role="tablist">
   	 			<button class="nav-link active" id="nav-agreement-tab" data-bs-toggle="tab" data-bs-target="#nav-agreement" type="button" role="tab" aria-controls="nav-agreement" aria-selected="true">STEP1. 약관동의</button>
    			<button class="nav-link" id="nav-userInfo-tab" data-bs-toggle="tab" data-bs-target="#nav-userInfo" type="button" role="tab" aria-controls="nav-userInfo" aria-selected="false">STEP2. 정보입력</button>
    			<button class="nav-link" id="nav-registerSuccess-tab" data-bs-toggle="tab" data-bs-target="#nav-registerSuccess" type="button" role="tab" aria-controls="nav-registerSuccess" aria-selected="false">STEP3. 가입완료 </button>
  			</div>
		</nav>
		<div class="tab-content d-flex justify-content-center" id="nav-tabContent">
  			<div class="tab-pane fade show active" id="nav-agreement" role="tabpanel" aria-labelledby="nav-agreement-tab">
  				<div class="row mt-4">
  					<div class="col-12">
  						<strong style="font-size : 20px">약관동의 및 정보활용 동의</strong>
  						<p class="mt-4 mb-2">시네마박스 서비스 이용을 위한 약관에 동의해주세요.</p>
  					</div>
  				</div>
  				<div class="row mt-4">
  					<div class="col-12 mb-2">
  						<input type="checkbox" id="allCheck"><strong>필수항목 전체동의</strong> 
  					</div>
  				</div>
  				<div class="row mb-4">
  					<div class="col-12" style="border-top: solid black 1px">
  					</div>
  				</div>
  				<div class="row mb-4">
  					<div class="col-12">
  						<input type="checkbox" id="serviceCheck">서비스 이용 약관 동의 (필수)
  						<p class="mt-4" id="serviceP"><%@include file="./conditions/registerCondition1.jsp" %> </p>
  					</div>
  				</div>
  				<div class="row mb-4">
  					<div class="col-12">
  						<input type="checkbox" id="userInfoCheck">개인정보 수집 및 이용 동의 (필수)
  						<p class="mt-4"><%@include file="./conditions/registerCondition2.jsp" %> </p>
  					</div>
  				</div>
  				<div class="row mb-4">
  					<div class="col-12">
  						<input type="checkbox" id="marketingCheck">마케팅 활용을 위한 개인 정보 수집 이용 안내(선택)
  						<p class="mt-4"><%@include file="./conditions/registerCondition3.jsp" %> </p>
  					</div>
  				</div>
  				<div class="text-center  d-grid gap-2 col-4 mx-auto mb-4">
					<button type="button" class="btn btn-warning" id="agreeButton" style="font-size:15px"><strong>다음</strong></button>
				</div>
  			</div>
  			<div class="tab-pane fade" id="nav-userInfo" role="tabpanel" aria-labelledby="nav-userInfo-tab">
  				<div class="row mt-4">
  					<div class="col-12 text-center">
  						<strong style="font-size : 20px">CINEMABOX에 오신 것을 환영합니다!</strong>
  					</div>
  				</div>
  				<p class="mt-4">회원정보를 입력해주세요.</p>
					<div class="row mt-3 mb-3">
							<div class="col-12">
								<div class="register-wrap border-top border-bottom p-2" style="solid black 1px">
									<form id="form-register" method="post" action="register" novalidate="novalidate">
										<table class="table">
									<colgroup>
										<col style="width:120px; background-color : #f0f0f0;">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">
												<label for="cinemaboxUserLoginId">아이디</label>
											</th>
											<td>
												<input maxlength="12" id="cinemaboxUserLoginId" type="text" placeholder="영문,숫자 조합(8~12자)" class="input-text" name="id">
												<button id="btnUserLoginIdDupCnfm" type="button" class="btn btn-secondary btn-sm">중복 확인</button>
											</td>
										</tr>
										<tr>
											<th scope="row">
												<label for="cinemaboxUserName">이름</label>
											</th>
											<td>
												<input maxlength="10" id="cinemaboxUserName" type="text" class="input-text" name="name">
											</td>
										</tr>
										<tr>
											<th scope="row">
												<label for="cinemaboxUserPwd">비밀번호</label>
											</th>
											<td>
												<input type="password" id="cinemaboxUserPwd" placeholder="영문, 숫자, 특수기호 중 2가지 이상 조합" class="input-text w260px" name="password">
											</td>
										</tr>
										<tr>
											<th scope="row">
												<label for="cinemaboxUserPwdCnfm">비밀번호 확인</label>
											</th>
											<td>
												<input  type="password" id="cinemaboxUserPwdCnfm" placeholder="영문, 숫자, 특수기호 중 2가지 이상 조합" class="input-text w260px" name="passwordConfirm">
											</td>
										</tr>
										<tr>
											<th scope="row">
												<label for="cinemaboxUserPhone">전화번호</label>
											</th>
											<td>
												<input maxlength="50" id="cinemaboxUserPhone" placeholder="-를 제외한 번호를 입력해주세요" type="text" class="input-text w260px" name="phone">
											</td>
										</tr>
										<tr>
											<th scope="row">
												<label for="cinemaboxUserEmail">이메일</label>
											</th>
											<td>
												<input maxlength="50" id="cinemaboxUserEmail" placeholder="이메일 주소를 입력해주세요" type="text" class="input-text w260px" name="email">
											</td>
										</tr>
										<tr>
											<th scope="row">
												<label for="cinemaboxUserAddress">주소 (선택)</label>
											</th>
											<td>
												<input maxlength="50" id="cinemaboxUserAddress" placeholder="주소를 입력해주세요" type="text" class="input-text w260px" name="address">
											</td>
										</tr>
										<tr>
											<th scope="row">
												<label for="cinemaboxUserBirth">생년월일(선택)</label>
											</th>
											<td>
												<input type="date" id="cinemaboxUserBirth" name="birth">
											</td>
										</tr>
									</tbody>
								</table>
								<div class="text-center  d-grid gap-2 col-4 mx-auto mb-4">	
									<button type="submit" class="btn btn-warning" id="registerSuccessButton" style="font-size:15px"><strong>회원가입하기</strong></button>
								</div>
								<div class="text-center  d-grid gap-2 col-4 mx-auto mb-4">	
									<button type="button" class="btn btn-secondary" id="previousButton" style="font-size:15px">뒤로가기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="nav-registerSuccess" role="tabpanel" aria-labelledby="nav-registerSuccess-tab">
  			가입축!
  			</div>
  		</div>
	</div>
</div>
<%@include file="../common/footer.jsp" %>
<script type="text/javascript">
$(function(){
	   
	   // 각각의 탭이 화면에 표시될 때 show.bs.tab 이벤트가 발생함.
	   // 각각의 탭이 화면에 표시될 때 브라우져 쿠키에 사용자정의 쿠키값을 저장함
	   $("#nav-agreement-tab").on("show.bs.tab", function() {
	      // 브라우저 쿠키에 step=level1 값을 저장하고, 만료시간을 1시간 후로 설정한다.
	      setCookie("step", "level1", 1)      
	   })
	   $("#nav-userInfo-tab").on("show.bs.tab", function() {
	      // 브라우저 쿠키에 step=level2 값을 저장하고, 만료시간을 1시간 후로 설정한다.
	      setCookie("step", "level2", 1)      
	   })
	   $("#nav-registerSuccess-tab").on("show.bs.tab", function() {
	      // 브라우저 쿠키에 step=level3 값을 저장하고, 만료시간을 1시간 후로 설정한다.
	      setCookie("step", "", 1)      
	   })
	   
	 
	    //체크항목 다 확인했는지 체크
		//전체 동의하기
		
		/*한번에 전체 체크/해제
		$("#allCheck").change(function(){
			$(this).find("checkbox:not(:disabled)").prop("checked", $(this).prop("checked"));
		})
		*/
		
		$("#allCheck").click(function(){
			$('#userInfoCheck, #serviceCheck, #marketingCheck').prop("checked", $(this).prop("checked"));
		});
		
	   $('#agreeButton').click(function(){
	     	console.log("#####################################step", getCookie("step")); 
			var $checkedCheckboxes = $("#nav-agreement :checkbox:checked");
		
			//필수 항목을 체크 검사 - 하나도 체크하지 않았을 때
			if($checkedCheckboxes.length == 0){
	
			  alert("동의 항목이 존재하지 않습니다.");
			  return false;
			}
			 
			//전체 체크 했을 때
			if($checkedCheckboxes.length == 4){
				$('#nav-agreement-tab').addClass("disabled");
      			$('#nav-userInfo-tab').removeClass("disabled").trigger("click");
      			$('#nav-registerSuccess-tab').addClass("disabled");
			}
			
			//필수항목 1 체크하지 않았을 때
			if($("#serviceCheck").is(" :checked") == false){
				alert("서비스 이용 약관 동의 (필수)가 필요합니다.");
				//$("#serviceP").focus(); --> focus 하게
				return false;
			};
				
				
			//필수항목 2 체크하지 않았을 때
			if($("#userInfoCheck").is(" :checked") == false){
				alert("개인정보 수집 및 이용 동의(필수)가 필요합니다.");
				return false;
			};
			
			//필수 항목만 체크를 했을 때 
			if($("#marketingCheck").is(" :checked") == false){
				var result = confirm("마케팅 활용을 위한 개인 정보 수집 이용에 체크하지 않으셨습니다. 계속 진행하시겠습니까?");
				
				if(result){
	      			$('#nav-agreement-tab').addClass("disabled");
	      			$('#nav-userInfo-tab').removeClass("disabled").trigger("click");
	      			$('#nav-registerSuccess-tab').addClass("disabled");
				}else {
					return false;
				}
			};
		
			//세 개 항목 다 체크했을 때(따로따로)
			if($("#serviceCheck, #userInfoCheck, #marketingCheck").is(" :checked") == true){
				$('#nav-agreement-tab').addClass("disabled");
      			$('#nav-userInfo-tab').removeClass("disabled").trigger("click");
      			$('#nav-registerSuccess-tab').addClass("disabled");
      			$("#allCheck").prop("checked", $(this).prop("checked"));
			}
		});
	   
	   $('#registerSuccessButton').click(function(){
		  
	      $('#nav-registerSuccess-tab').removeClass("disabled").trigger("click");
	      $('#nav-agreement-tab').addClass("disabled");
	      $('#nav-userInfo-tab').addClass("disabled");
	      $('#userInfoCheck, #serviceCheck, #marketingCheck').prop("checked", $(this).prop("checked"));
	      
	   });
	   
	   $('#previousButton').click(function(){
		   $('#nav-agreement-tab').removeClass("disabled").trigger("click");
		   $('#nav-registerSuccess-tab').removeClass("disabled")
		   $('#nav-registerSuccess-tab').addClass("disabled");
	   });
	   
<%-----------------------------------------쿠키 값 저장하기-----------------------------------------------------%>
	// 브라우져 쿠키에 값을 저장한다.
	// name은 쿠키명, value는 쿠키값, days는 만료일까지의 일 수
	function setCookie(name, value, days) {
	   
	   var d = new Date();
	   d.setTime(d.getTime() + (days*24*60*60*1000));
	   var expires = "expires=" + d.toUTCString();
	   // 쿠키는 name=value; expires=Thu, 18 Dec 2021 12:00:00 UTC; path=/
	   document.cookie = name + "=" + value + ";" + expires + ";path=/";
	};

	// 브라우져 쿠키저장소에 지정된 이름의 쿠키값을 찾아서 반환한다.
	function getCookie(name) {
	   name = name + "=";
	   var decodedCookie = decodeURIComponent(document.cookie);
	   var items = decodedCookie.split(";");
	   for (var i=0; i<items.length; i++) {
	      var item = items[i];
	      while (item.charAt(0) == ' ') {
	         item = item.substring(1);
	      }
	      if (item.indexOf(name) == 0) {
	         return item.substring(name.length, item.length);
	      }
	   }
	   return "";
	};
	   
	   // 웹 페이지 로딩시 쿠키값을 조회해서 적절한 작업을 수행하는 함수다.
	   (function () {
	      $("#nav-userInfo-tab, #nav-registerSuccess-tab").addClass("disabled");
	      // 브라우져 쿠키에서 step이라는 이름으로 저장된 쿠키값을 조회한다.
	      var step = getCookie("step");
	      
	      // 웹페이지가 로딩될 때 쿠키값을 사용해서 구현할 내용을 코딩한다.
	      if (step == "" || step == "level1") {
	         $("#nav-agreement-tab").removeClass("disabled").trigger('click');
	      } else if (step == "level2") {
	         $("#nav-userInfo-tab").removeClass("disabled").trigger('click');
	      } 
	   });
});


</script>  
</body>
</html>