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
      background-color:#f8f8f8;
      width:90%;
      height: auto;
      margin-top : 60px;
      border-radius: 30px;
   }
</style>
</head>
<body>

<%@include file="../common/header.jsp" %>
   <div class="container-fluid" id="myPageBg">
      <div class="container" id="myPage">
         <div id="myPageInfo" class="mb-5">
            <div class="row mx-2">
               
            </div>
         </div>
         <ul class="nav nav-tabs d-flex justify-content-around" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
               <button class="nav-link active" id="결제내역-tab" data-bs-toggle="tab" data-bs-target="#결제내역" type="button" role="tab" aria-controls="결제내역" aria-selected="true">결제내역</button>
            </li>
            <li class="nav-item" role="presentation">
               <button class="nav-link" id="쿠폰함-tab" data-bs-toggle="tab" data-bs-target="#쿠폰함" type="button" role="tab" aria-controls="쿠폰함" aria-selected="false">쿠폰함</button>
            </li>
            <li class="nav-item" role="presentation">
               <button class="nav-link" id="당첨경품-tab" data-bs-toggle="tab" data-bs-target="#당첨경품" type="button" role="tab" aria-controls="당첨경품" aria-selected="false">당첨경품</button>
            </li>
            <li class="nav-item" role="presentation">
               <button class="nav-link" id="이벤트-tab" data-bs-toggle="tab" data-bs-target="#이벤트" type="button" role="tab" aria-controls="이벤트" aria-selected="false">MY 이벤트</button>
            </li>
            <li class="nav-item" role="presentation">
               <button class="nav-link" id="클럽-tab" data-bs-toggle="tab" data-bs-target="#클럽" type="button" role="tab" aria-controls="클럽" aria-selected="false">MY 클럽</button>
            </li>
            <li class="nav-item" role="presentation">
               <button class="nav-link" id="무비로그-tab" data-bs-toggle="tab" data-bs-target="#무비로그" type="button" role="tab" aria-controls="무비로그" aria-selected="false">MY 무비로그</button>
            </li>
            <li class="nav-item" role="presentation">
               <button class="nav-link" id="문의-tab" data-bs-toggle="tab" data-bs-target="#문의" type="button" role="tab" aria-controls="문의" aria-selected="false">1:1 문의</button>
            </li>
            <li class="nav-item" role="presentation">
               <button class="nav-link" id="정보관리-tab" data-bs-toggle="tab" data-bs-target="#정보관리" type="button" role="tab" aria-controls="정보관리" aria-selected="false">MY 정보관리</button>
            </li>
         </ul>
         <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="결제내역" role="tabpanel" aria-labelledby="결제내역-tab">
               <p>1</p>
               <p>1</p>
               <p>1</p>
               <p>1</p>
               <p>1</p>
               <p>1</p>
               <p>1</p>
               <p>1</p>
               <p>1</p>
               <p>1</p>
               <p>1</p>
               <p>1</p>
            </div>
            <div class="tab-pane fade" id="쿠폰함" role="tabpanel" aria-labelledby="쿠폰함-tab">2</div>
            <div class="tab-pane fade" id="당첨경품" role="tabpanel" aria-labelledby="당첨경품-tab">3</div>
            <div class="tab-pane fade" id="이벤트" role="tabpanel" aria-labelledby="이벤트-tab">4</div>
            <div class="tab-pane fade" id="클럽" role="tabpanel" aria-labelledby="클럽-tab">5</div>
            <div class="tab-pane fade" id="무비로그" role="tabpanel" aria-labelledby="무비로그-tab">6</div>
            <div class="tab-pane fade" id="문의" role="tabpanel" aria-labelledby="문의-tab">7</div>
            <div class="tab-pane fade" id="정보관리" role="tabpanel" aria-labelledby="정보관리-tab">8</div>
        	</div>
    	</div>
    </div>
 <%@include file="../common/footer.jsp" %>  
</body>
</html>