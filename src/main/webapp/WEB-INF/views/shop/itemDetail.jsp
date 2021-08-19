<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>   

<title>TITLE</title>
	<style type="text/css">
		.form-check-input:checked {
			background-color: #198754 !important;
			border-color: #198754 !important;
		}
		
			#detailInfo .line1 { 
			position: absolute; 
				top : 490px; 
			} 
		#detailInfo .line2 {  
			position: absolute;  
				top : 575px;  
		}  
		#detailInfo .line3 { 
				position: absolute; 
				top : 645px; 
			} 
			#detailInfo .input-group {  
				top: 200px;
			position: relative;
				}  
		
		#number .btn-outline-success {
			color: #ffc107 !important;
			border-color: #ffc107 !important;
		}
		
		#number .btn-outline-success:hover {
			color: #fff !important;
			border-color: #ffc107 !important;
			background-color: #ffc107 !important;
		}
		
		#buy .btn-outline-success {
			color: #ffc107 !important;
			border-color: #ffc107 !important;
		}
		
		#buy .btn-outline-success:hover {
			color: #fff !important;
			border-color: #ffc107 !important;
			background-color: #ffc107 !important;
		}
	</style>
</head>
<body>
<div class="container">
	<%@include file="../common/header.jsp" %>
	<%@include file="../common/shopHeader.jsp" %>
	<div class="row">
		<div class="col-12" id="detail" >
			<div class="d-flex justify-content-between">
				<div id="img" class="col-5">
				<br>
					<img alt="상품 대표이미지" src="" class="img-thumbnail">
				</div>
				<div class="col-7 ps-5">
					<div class="pt-2 pb-3" id="name">
						<p class="fs-3"><strong>[<c:out value="브랜드명"/>] <c:out value="이름"/></strong></p>
						<p class="fs-6"><c:out value="서브타이틀"/></p>
					</div>
					<div class="pb-4">
						<strong><span style="color: black; font-size: 20px" class="fs-3">
							<fmt:formatNumber type="number" maxFractionDigits="0" value=""/>원
						</span></strong>
						<span style="color: red;" class="fs-3">
							<fmt:formatNumber type="percent" value="" />
						</span>
						<br>
						<span style="text-decoration-line: line-through; color: gray" class="fs-5">
						</span> 
					</div>
					<div class="row mb-4 border-top border-bottom">
						<div class="col-2">
							<p class="py-3">사용극장</p>
							<p class="py-3">유효기간</p>
							<p class="py-3">판매수량</p>
							<p class="py-3">구매 후 취소</p>
							<p class="py-3">구매수량</p>
						</div>
						<div class="col-10" id="detailInfo">
							<div>
								<a href="">사용가능극장</a>
								<p style="color:red;">※ 일부 특별관 및 특별석(발코니, 커플석, 로얄석 등)은 차액지불과 상관없이 사용 불가능합니다.</p>
							</div>
							<div class="line1">
                                <a>구매일로부터 2년 이내 사용 가능</a>
                                <p class="txt min" style="color:gray;">예매 가능 유효기간은 구매일로부터 2년입니다.</p>
                            </div>
                            <div class="line2">
                                <p>1회 8개 구매가능</p>                
                            </div>
                             <div class="line3">
                                <p> 구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.</p>
	                        </div>
							<div class="py-3 input-group" id="number">
								<button type="button" class="btn btn-outline-success btn-sm fa fa-minus"  id="decrease"></button>
									<button type="button" class="btn btn-outline btn-sm" id="number" disabled>1</button>
								<button type="button" class="btn btn-outline-success btn-sm fa fa-plus"  id="increase" ></button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="d-flex justify-content-between pb-5">
				<div class="col-6"></div>
				<div class="col-6">
					<div class="d-flex flex-row-reverse bd-highlight">
						<div class="p-2 bd-highlight">
							<font size="2">총 상품금액 : </font>
							<input type="button" class="btn btn-outline fs-3" id="productSum" readonly>원
						</div>
					</div>
					<div class="d-grid gap-2 ps-5" id="buy">
						<button class="btn btn-outline-success btn-lg" type="button">구매하기</button>
					</div>
				</div>
			</div>	
		</div>
	</div>
	<br>
	<%@include file="../common/shopFooter.jsp" %>
	<%@include file="../common/footer.jsp" %>
</div>
</body>
</html>