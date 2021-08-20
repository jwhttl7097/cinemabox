<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>   
<title>샵</title>
</head>
<body>
<div class="container">
<%@include file="../common/header.jsp" %>
<%@include file="shopHeader.jsp" %>
<!-- Header-->
    <header class="bg-warning py-2">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">CINEMA BOX</h1>
                <p class="lead fw-normal text-white-50 mb-0">CINEMA BOX Shop</p>
            </div>
        </div>
    </header>
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
<%--         	<c:choose> --%>
<%-- 				<c:when test="${empty items}"> --%>
<!-- 					<div class="d-flex justify-content-center"> -->
<!-- 						<p class="fs-3">상품 리스트가 없습니다.</p> -->
<!-- 					</div> -->
<%-- 				</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				<c:forEach var="item" items="${items}"> --%>
		            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		                <div class="col mb-5">
		                    <div class="card h-100">
		                        <!-- Product image-->
		                        <img class="card-img-top" src="/cinemabox/resources/images/shop/03.jpg" alt="골드클래스 관람권 상세보기" />
		                        <!-- Product details-->
		                        <div class="card-body p-4">
		                            <div class="text-center">
		                                <h5 class="fw-bolder">골드클래스 관람권  </h5>
		                                <br><strong>35,000 원</strong>
		                            </div>
		                        </div>
		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                            <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="#">구매하기</a></div>
		                        </div>
		                    </div>
		                </div>
		                <div class="col mb-5">
		                    <div class="card h-100">
		                        <!-- Sale badge-->
		                        <div class="badge bg-warning text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
		                        <!-- Product image-->
		                         <img class="card-img-top" src="/cinemabox/resources/images/shop/02.jpg" alt="일반관람권 상세보기" />
		                        <!-- Product details-->
		                        <div class="card-body p-4">
		                            <div class="text-center">
		                                <!-- Product name-->
		                                <h5 class="fw-bolder">일반 관람권</h5>
		                                <!-- Product reviews-->
		                                <div class="d-flex justify-content-center small text-warning mb-2">
		                                    <div class="bi-star-fill"></div>
		                                    <div class="bi-star-fill"></div>
		                                    <div class="bi-star-fill"></div>
		                                    <div class="bi-star-fill"></div>
		                                    <div class="bi-star-fill"></div>
		                                </div>
		                                <span class="text-muted text-decoration-line-through">12,000 원</span><br><strong>11,000 원</strong>
		                            </div>
		                        </div>
		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                            <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="#">구매하기</a></div>
		                        </div>
		                    </div>
		                </div>
		                <div class="col mb-5">
		                    <div class="card h-100">
		                        <!-- Sale badge-->
		                        <div class="badge bg-warning text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
		                        <!-- Product image-->
		                        <img class="card-img-top" src="/cinemabox/resources/images/shop/04.jpg" alt="4DX관람권 상세보기" />
		                        <!-- Product details-->
		                        <div class="card-body p-4">
		                            <div class="text-center">
		                                <h5 class="fw-bolder">4DX 관람권</h5>
		                                <span class="text-muted text-decoration-line-through">20,000 원</span><br><strong>19,000 원</strong>
		                            </div>
		                        </div>
		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                            <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="#">구매하기</a></div>
		                        </div>
		                    </div>
		                </div>
		                <div class="col mb-5">
		                    <div class="card h-100">
		                    	<div class="badge bg-warning text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
		                        <!-- Product image-->
		                        <img class="card-img-top" src="/cinemabox/resources/images/shop/05.jpg" alt="IMAX관람권 상세보기" />
		                        <!-- Product details-->
		                        <div class="card-body p-4">
		                            <div class="text-center">
		                                <h5 class="fw-bolder">IMAX 관람권</h5>
		                                 <span class="text-muted text-decoration-line-through">18,000 원</span><br><strong>16,000 원</strong>
		                            </div>
		                        </div>
		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                            <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="#">구매하기</a></div>
		                        </div>
		                    </div>
		                </div>
<!-- 		                <div class="col mb-5"> -->
<!-- 		                    <div class="card h-100"> -->
<!-- 		                        Product image -->
<!-- 		                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="Movie Ticket" /> -->
<!-- 		                        Product details -->
<!-- 		                        <div class="card-body p-4"> -->
<!-- 		                            <div class="text-center"> -->
<!-- 		                                Product name -->
<!-- 		                                <h5 class="fw-bolder">Fancy Product</h5> -->
<!-- 		                                Product price -->
<!-- 		                                $120.00 - $280.00 -->
<!-- 		                            </div> -->
<!-- 		                        </div> -->
<!-- 		                        Product actions -->
<!-- 		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent"> -->
<!-- 		                            <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="#">View options</a></div> -->
<!-- 		                        </div> -->
<!-- 		                    </div> -->
<!-- 		                </div> -->
<!-- 		                <div class="col mb-5"> -->
<!-- 		                    <div class="card h-100"> -->
<!-- 		                        Sale badge -->
<!-- 		                        <div class="badge bg-warning text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div> -->
<!-- 		                        Product image -->
<!-- 		                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->
<!-- 		                        Product details -->
<!-- 		                        <div class="card-body p-4"> -->
<!-- 		                            <div class="text-center"> -->
<!-- 		                                Product name -->
<!-- 		                                <h5 class="fw-bolder">Special Item</h5> -->
<!-- 		                                Product reviews -->
<!-- 		                                <div class="d-flex justify-content-center small text-warning mb-2"> -->
<!-- 		                                    <div class="bi-star-fill"></div> -->
<!-- 		                                    <div class="bi-star-fill"></div> -->
<!-- 		                                    <div class="bi-star-fill"></div> -->
<!-- 		                                    <div class="bi-star-fill"></div> -->
<!-- 		                                    <div class="bi-star-fill"></div> -->
<!-- 		                                </div> -->
<!-- 		                                Product price -->
<!-- 		                                <span class="text-muted text-decoration-line-through">$20.00</span> -->
<!-- 		                                $18.00 -->
<!-- 		                            </div> -->
<!-- 		                        </div> -->
<!-- 		                        Product actions -->
<!-- 		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent"> -->
<!-- 		                            <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="#">구매하기</a></div> -->
<!-- 		                        </div> -->
<!-- 		                    </div> -->
<!-- 		                </div> -->
<!-- 		                <div class="col mb-5"> -->
<!-- 		                    <div class="card h-100"> -->
<!-- 		                        Product image -->
<!-- 		                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->
<!-- 		                        Product details -->
<!-- 		                        <div class="card-body p-4"> -->
<!-- 		                            <div class="text-center"> -->
<!-- 		                                Product name -->
<!-- 		                                <h5 class="fw-bolder">Popular Item</h5> -->
<!-- 		                                Product reviews -->
<!-- 		                                <div class="d-flex justify-content-center small text-warning mb-2"> -->
<!-- 		                                    <div class="bi-star-fill"></div> -->
<!-- 		                                    <div class="bi-star-fill"></div> -->
<!-- 		                                    <div class="bi-star-fill"></div> -->
<!-- 		                                    <div class="bi-star-fill"></div> -->
<!-- 		                                    <div class="bi-star-fill"></div> -->
<!-- 		                                </div> -->
<!-- 		                                Product price -->
<!-- 		                                $40.00 -->
<!-- 		                            </div> -->
<!-- 		                        </div> -->
<!-- 		                        Product actions -->
<!-- 		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent"> -->
<!-- 		                            <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="#">구매하기</a></div> -->
<!-- 		                        </div> -->
<!-- 		                    </div> -->
<!-- 		                </div> -->
		            </div>
<%-- 		    	</c:forEach> --%>
<%-- 			</c:otherwise> --%>
<%-- 			</c:choose> --%>
		</div>
    </section>
    <!-- Footer-->
    <footer class="py-5 bg-warning">
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; CINEMA BOX</p></div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="../common/footer.jsp" %>
</div>
</body>
</html>