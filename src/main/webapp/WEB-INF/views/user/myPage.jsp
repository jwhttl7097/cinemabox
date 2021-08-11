<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>마이페이지</title>
<style type="text/css">
   header .navbar-brand,
   #top-nav>li>a,
   #mainnav-02>li>a{z-index:100000;}

   .mainnav>a{z-index:100000;}

   #myPageBg{
      background: linear-gradient(to bottom, #ffc107 80%, #f8f8f8 20%);
      display: flex;
      justify-content: center;
      vertical-align: middle;
      width:auto;
      height:auto;
   }
   
   #myPage{
      background-color:	#ffffff;
      width:90%;
      height: auto;
      margin-top : 60px;
      border-radius: 30px;
   }
   
   td{
   	 border : none;
   }
   
   .bg-warning{
   	
   }
   
   .level-img{
   	  width: 50px;
   	  height: 30px;
   }
   
   .infoTabBack{
   	  background-color : #ffc107;
  
   }
   
   .infoTab{
   	color : white;
   }
   
   #MembershipBadge{
   
   }
   
   #ryan{
   	width:150px;
   	height:150px;
   }
</style>
</head>
<body>

<%@include file="../common/header.jsp" %>
   <div class="container-fluid" id="myPageBg">
      <div class="container" id="myPage">
         <div id="myPageInfo" class="mb-2">
            <div class="row mx-2 mt-4">
				<div class="col text-end">
					<div class="row mt-3">
						<div class="col">
							<div class="text-center" id="levelIcon">
								<span class="badge rounded-pill bg-success">Green</span>
							</div>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col text-center">
							<strong>홍길동</strong>님 반가워요!
						</div>
					</div>
				</div>
				<div class="col-6"></div>
				<div class="col"></div>
            </div>
            <div class="row mx-2 mb-3">
            	<div class="col-6 offset-3 text-center" style="font-size : 20px">
            		2021년 VIP까지 <strong>20,000원 남았어요!</strong>
            	</div>
            </div>
            <div class="row mt-4 mb-1">
            	<div class="col-6 offset-3 text-center">
            		<a href="#"><span class="badge rounded-pill bg-dark text-white text-center" id="MembershipBadge">Membership Zone</span></a>
            	</div>
            </div>
            <div class="row mx-2 mb-4 justify-content-center">
            	<div class="col-8 mt-3 mb-2">
            		<table class="table">
 						<thead>
 							<tr class="text-center">
 								<th>Green</th>
 								<th>Silver</th>
 								<th>Gold</th>
 								<th>VIP</th>
 								<th></th>
 							</tr>
 						</thead>
 						<tbody>
 							<tr>
 								<td class="align-middle text-center">0</td>
 								<td class="align-middle text-center">2만원</td>
 								<td class="align-middle text-center">3만원</td>
 								<td class="align-middle text-center">4만원</td>
 							</tr>
 						</tbody>
 					</table>
            	</div>
            </div>
            <div class="row mx-2 mt-4 mb-4 border-top border-bottom">
            	<div class="col text-center" style="padding:20px 20px">
					<span><strong>POINT</strong></span>
					<span>100p</span>
            	</div>
            	<div class="3tabs col text-center" style="padding:20px 20px">
					<span><strong>쿠폰함</strong></span>
					<span><ins style="color:#DC143C">0</ins>개</span>
            	</div>
            	<div class="3tabs col text-center" style="padding:20px 20px">
					<span><strong>찜한 영화</strong></span>
					<span>22개</span>
            	</div>
            </div>
         </div>
         <ul class="nav nav-tabs  d-flex justify-content-around" style="padding-top : 15px"id="myTab" role="tablist">
            <li class="nav-item infoTabBack rounded" role="presentation">
               <button class="infoTab nav-link active" id="payment-tab" data-bs-toggle="tab" data-bs-target="#payment" type="button" role="tab" aria-controls="payment" aria-selected="true"><strong>결제내역</strong></button>
            </li>
            <li class="nav-item infoTabBack rounded" role="presentation">
               <button class="infoTab nav-link" id="coupon-tab" data-bs-toggle="tab" data-bs-target="#coupon" type="button" role="tab" aria-controls="coupon" aria-selected="false"><strong>쿠폰함</strong></button>
            </li>
            <li class="nav-item infoTabBack rounded" role="presentation">
               <button class="infoTab nav-link" id="event-tab" data-bs-toggle="tab" data-bs-target="#event" type="button" role="tab" aria-controls="event" aria-selected="false"><strong>MY 이벤트</strong></button>
            </li>
            <li class="nav-item infoTabBack rounded" role="presentation">
               <button class="infoTab nav-link" id="movieNote-tab" data-bs-toggle="tab" data-bs-target="#movieNote" type="button" role="tab" aria-controls="movieNote" aria-selected="false"><strong>MY 무비노트</strong></button>
            </li>
            <li class="nav-item infoTabBack rounded" role="presentation">
               <button class="infoTab nav-link" id="qna-tab" data-bs-toggle="tab" data-bs-target="#qna" type="button" role="tab" aria-controls="qna" aria-selected="false"><strong>1:1 문의</strong></button>
            </li>
            <li class="nav-item infoTabBack rounded" role="presentation">
               <button class="infoTab nav-link" id="info-tab" data-bs-toggle="tab" data-bs-target="#info" type="button" role="tab" aria-controls="info" aria-selected="false"><Strong>MY 정보관리</Strong></button>
            </li>
         </ul>
         <div class="tab-content" id="myTabContent">
         	<div class="tab-pane fade show active mt-4 mb-4" id="payment" role="tabpanel" aria-labelledby="payment-tab">
               <p class="text-center" style="padding:20px">
               		<img alt="ryan" src="./resources/images/user/myPage/ryan.gif" id="ryan" style="padding: 20px"></br>
               		최근 결제하신 내역이 없습니다.
               </p>
            </div>
            <div class="tab-pane fade mt-4 mb-4" id="coupon" role="tabpanel" aria-labelledby="coupon-tab">
            	<p class="text-center" style="padding:20px">
               		<img alt="ryan" src="./resources/images/user/myPage/ryan.gif" id="ryan" style="padding: 20px"></br>
               		소유하신 쿠폰이 없습니다.
               </p>
            </div>
            <div class="tab-pane fade mt-4 mb-4" id="event" role="tabpanel" aria-labelledby="event-tab">
            	<p class="text-center" style="padding:20px">
               		<img alt="ryan" src="./resources/images/user/myPage/ryan.gif" id="ryan" style="padding: 20px"></br>
               		응모하신 이벤트가 없습니다.
               </p>
            </div>
            <div class="tab-pane fade mt-4 mb-4" id="movieNote" role="tabpanel" aria-labelledby="movieNote-tab">
            	<p class="text-center" style="padding:20px">
               		<img alt="ryan" src="./resources/images/user/myPage/ryan.gif" id="ryan" style="padding: 20px"></br>
               		작성하신 무비노트가 없습니다.
               </p>
            </div>
            <div class="tab-pane fade mt-4 mb-4" id="qna" role="tabpanel" aria-labelledby="qna-tab">
            	<p class="text-center" style="padding:20px">
               		<img alt="ryan" src="./resources/images/user/myPage/ryan.gif" id="ryan" style="padding: 20px"></br>
               		작성하신 QnA가 없습니다.
               </p>
            </div>
            <div class="tab-pane fade mt-4 mb-4" id="info" role="tabpanel" aria-labelledby="info-tab">
            
            </div>
        </div>
     </div>
  </div>
 <%@include file="../common/footer.jsp" %>
 <script type="text/javascript">
 
 </script>
</body>
</html>