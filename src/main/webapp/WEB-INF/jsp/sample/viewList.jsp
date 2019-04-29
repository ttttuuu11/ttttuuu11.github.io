<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<link rel="stylesheet" href="<c:url value='/css/sb-admin-2.min.css'/>">
<%@ include file="/WEB-INF/include/include-link.jspf"%>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<!-- <link href="css/sb-admin-2.min.css" rel="stylesheet"> -->
<style>
#upBTN {
	position: fixed;
	bottom: 70px;
	right: 70px;
}

#accordionSidebar {
	
}

.btn-circle.btn-xl {
	width: 70px;
	height: 70px;
	padding: 10px 16px;
	border-radius: 35px;
	font-size: 24px;
	line-height: 1.33;
}

.btn-circle {
	width: 30px;
	height: 30px;
	padding: 6px 0px;
	border-radius: 15px;
	text-align: center;
	font-size: 12px;
	line-height: 1.42857;
}

.dropdown_list {
	left-margin: 10px;
}
</style>

</head>

<script>
	$(function() {
		var delay = 1000;

		$("#upBTN").click(function() {
			$('html, body').stop().animate({
				scrollTop : 0
			}, delay);
		});

	});
</script>

<input type="hidden" id="CATEGORY_IDX" value="${CATEGORY_IDX }">

<script>
	/*var result = '${msg}';
	 
	 if(result="success"){
	    alert(result);
	    console.log(result);
	} */

	var lastScrollTop = 0;
	var easeEffect = 'easeInQuint';

	// 1. 스크롤 이벤트 발생
	$(window)
			.scroll(
					function() { // ① 스크롤 이벤트 최초 발생

						var currentScrollTop = $(window).scrollTop();

						/* 
						    =================   다운 스크롤인 상태  ================
						 */
						if (currentScrollTop - lastScrollTop > 0) {
							// down-scroll : 현재 게시글 다음의 글을 불러온다.
							console.log("down-scroll");

							// 2. 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
							if ($(window).scrollTop() >= ($(document).height() - $(
									window).height())) { //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면

								// 3. class가 scrolling인 것의 요소 중 마지막인 요소를 선택한 다음 그것의 data-bno속성 값을 받아온다.
								//      즉, 현재 뿌려진 게시글의 마지막 bno값을 읽어오는 것이다.( 이 다음의 게시글들을 가져오기 위해 필요한 데이터이다.)
								var lastbno = $(".scrolling:last").attr(
										"data-bno");
								console.log("lastbno:" + lastbno);
								var cIdx = $("#CATEGORY_IDX").val()

								// 4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 bno를 서버로 보내어 그 다음 20개의 게시물 데이터를 받아온다.
								$.ajax({
											type : 'post', // 요청 method 방식
											url : 'infiniteScrollDown.do',// 요청할 서버의 url
											headers : {
												"Content-Type" : "application/json",
												"X-HTTP-Method-Override" : "POST"
											},
											dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
											data : JSON.stringify({ // 서버로 보낼 데이터 명시
												bno : lastbno,
												CATEGORY_IDX : cIdx
											}),
											success : function(data) {// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
												console.log(data);
												var str = "";
												console.log("data1" + this);
												// 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
												if (data != "") {
													//6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
													$(data)
															.each(
																	// 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
																	function() {
																		console
																				.log("data2"
																						+ this);
																		str += "<div class="+"'col-lg-6 mb-4'"+">"
																				+ "<div class="+"'card shadow mb-4'"+">"
																				+ "<div class="+"'card-header py-3'"+">"
																				+ "<h6 class="+"'m-0 font-weight-bold text-primary'"+">"
																				+ this.TITLE
																				+ "<span"
																							+"class="+"'text-danger'"+">["
																				+ this.HIT_CNT
																				+ "]</span>"
																				+ "</h6>"
																				+ "<input type="+"'hidden'"+" id="+"'IDX'"+" value="+this.IDX+">"
																				+ "</div>"
																				+ "<div class="+"'card-body'"+">"
																				+ "<div class="+"'text-center'"+">"
																				
																				+ "</div>"
																				+ "<p>"
																				+ this.CONTENTS
																				+ "</p>"
																				+ "<a target="+"'_blank'"+"rel="+"'nofollow'"+"href="+"'viewDetail?IDX="+this.IDX+"'>더"
																				+ "보러가기 &rarr;</a>"
																				+ "<div class="+"'mt-4 text-center small'"+">"
																				+ "<span class="+"'mr-2'"+"> <i"
																							+"class="+"'fas fa-circle text-primary'"+"></i> Direct"
																				+ "</span> <span class="+"'mr-2'"+"> <i"
																							+"class="+"'fas fa-circle text-success'"+"></i> Social"
																				+ "</span> <span class="+"'mr-2'"+"> <i"
																							+"class="+"'fas fa-circle text-info'"+"></i> Referral"
																				+ "</span>"
																				+ "</div>"
																				+ "</div>"
																				+ "</div>"
																				+ "</div>"
																				+"<input type="+"'hidden'"+" class="+"'scrolling'"+" data-bno="+this.IDX+">";

																	});// each
													// 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
													//$(".listToChange").remove();// 셀렉터 태그를 와 태그값 지운다.                       
													$(".scrollLocation").after(
															"<div class="+"'row listToChange'"+">"
																	+ str 
																	+ "</div>");
												}// if : data!=null
												else { // 9. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..
													alert("더 불러올 데이터가 없습니다.");
												}// else

											}// success
										});// ajax

								// 여기서 class가 listToChange인 것중 가장 처음인 것을 찾아서 그 위치로 이동하자.
								var position = $(".listToChange:first")
										.offset();// 위치 값

								// 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.
								$('html,body').stop().animate({
									scrollTop : position.top
								}, 600, easeEffect);

							}//if : 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간

							// lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
							lastScrollTop = currentScrollTop;
						}// 다운스크롤인 상태

						/* 
						    =================   업 스크롤인 상태   ================
						 */
						else {
							// up- scroll : 현재 게시글 이전의 글을 불러온다.
							console.log("up-scroll");

							// 2. 현재 스크롤의 top 좌표가  <= 0 되는 순간
							if ($(window).scrollTop() <= 0) { //

								// 3. class가 scrolling인 것의 요소 중 첫 번째 요소를 선택한 다음 그것의 data-bno속성 값을 받아온다.
								//      즉, 현재 뿌려진 게시글의 첫 번째 bno값을 읽어오는 것이다.( 이 전의 게시글들을 가져오기 위해 필요한 데이터이다.)
								var cIdx = $("#CATEGORY_IDX").val()

								var firstbno = $(".scrolling:first").attr(
										"data-bno");

								// 4. ajax를 이용하여 현재 뿌려진 게시글의 첫 번째 bno를 서버로 보내어 그 이전의 20개의 게시물 데이터를 받아온다.
								$
										.ajax({
											type : 'post', // 요청 method 방식
											url : 'infiniteScrollUp.do',// 요청할 서버의 url
											headers : {
												"Content-Type" : "application/json",
												"X-HTTP-Method-Override" : "POST"
											},
											dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
											data : JSON.stringify({ // 서버로 보낼 데이터 명시
												bno : firstbno,
												CATEGORY_IDX : cIdx
											}),
											success : function(data) {// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.

												var str = "";
												console.log("data1" + this);
												// 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
												// 이때 서버에서 값이 없으면 null을 던질줄 알았는데 ""를 던진다. 따라서 (data != null) 이라는 체크를 해주면 안되고, (data != "") 만 해주어야한다.
												// 이건아마 컨트롤러의 리턴타입이 @ResponseBody로 json형태로 던져지는데 이때 아마 아무것도 없는게 ""로 명시되어 날아오는것 같다.
												if (data != "") {

													//6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
													var lef
													$(data)
															.each(
																	// 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
																	function() {
																		console
																				.log("data2"
																						+ this);

																		str += "<div class="+"'col-lg-6 mb-4'"+">"
																				+ "<div class="+"'card shadow mb-4'"+">"
																				+ "<div class="+"'card-header py-3'"+">"
																				+ "<h6 class="+"'m-0 font-weight-bold text-primary'"+">"
																				+ this.TITLE
																				+ "<span"
																					+"class="+"'text-danger'"+">["
																				+ this.HIT_CNT
																				+ "]</span>"
																				+ "</h6>"
																				+ "<input type="+"'hidden'"+" id="+"'IDX'"+" value="+this.IDX+">"
																				+ "</div>"
																				+ "<div class="+"'card-body'"+">"
																				+ "<div class="+"'text-center'"+">"
																		
																				+ "</div>"
																				+ "<p>"
																				+ this.CONTENTS
																				+ "</p>"
																				+ "<a target="+"'_blank'"+"rel="+"'nofollow'"+"href="+"'viewDetail?IDX="+this.IDX+"'>더"
																				+ "보러가기 &rarr;</a>"
																				+ "<div class="+"'mt-4 text-center small'"+">"
																				+ "<span class="+"'mr-2'"+"> <i"
																					+"class="+"'fas fa-circle text-primary'"+"></i> Direct"
																				+ "</span> <span class="+"'mr-2'"+"> <i"
																					+"class="+"'fas fa-circle text-success'"+"></i> Social"
																				+ "</span> <span class="+"'mr-2'"+"> <i"
																					+"class="+"'fas fa-circle text-info'"+"></i> Referral"
																				+ "</span>"
																				+ "</div>"
																				+ "</div>"
																				+ "</div>"
																				+ "</div>"
																				+"<input type="+"'hidden'"+" class="+"'scrolling'"+" data-bno="+this.IDX+">";
																	});// each
													// 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
													//$(".listToChange").remove();// 셀렉터 태그를 와 태그값 지운다.                       
													$(".scrollLocation").after(
															"<div class="+"'row listToChange'"+">"
																	+ str
																	+ "</div>");

												}//if : data != ""
												else { // 9. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..??

													alert("더 불러올 데이터가 없습니다.");
												}// else

											}// success
										});// ajax

								// 스크롤 다운이벤트 때  ajax통신이 발생하지 않을때 까지의 좌표까지 스크롤을 내려가주기.
								var position = ($(document).height() - $(window)
										.height()) - 10;

								// 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.
								$('html,body').stop().animate({
									scrollTop : position
								}, 600, easeEffect);

							}//if : 현재 스크롤의 top 좌표가  <= 0 되는 순간

							// lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
							lastScrollTop = currentScrollTop;
						}// else : 업 스크롤인 상태

					});// scroll event
</script>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-primary sidebar sidebar-dark accordion "
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					Sumin's Blog <sup>2.1</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="index.html"> <span>학습 내용</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>Components</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Components:</h6>
						<a class="collapse-item" href="buttons.html">Buttons</a> <a
							class="collapse-item" href="cards.html">Cards</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>Utilities</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Utilities:</h6>
						<a class="collapse-item" href="utilities-color.html">Colors</a> <a
							class="collapse-item" href="utilities-border.html">Borders</a> <a
							class="collapse-item" href="utilities-animation.html">Animations</a>
						<a class="collapse-item" href="utilities-other.html">Other</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">CATEGORY</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<c:forEach var="parentItem" items="${sidebarListParentNull }"
				varStatus="status">
				<li class="nav-item"><a class="nav-link collapsed" href="#"
					data-toggle="collapse" data-target="#collapsePages${status.index }"
					aria-expanded="true" aria-controls="collapsePages"> <span>${parentItem.CATEGORY_NAME }</span>
				</a>
					<div id="collapsePages${status.index }" class="collapse"
						aria-labelledby="headingPages" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded bg-primary">
							<h6 class="collapse-header">List:</h6>
							<c:set var="sidebarListChild"
								value="sidebarListChild${status.index}" />
							<c:forEach var="item" items="${requestScope[sidebarListChild]}">
								<c:if test="${!empty item.CATEGORY_NAME }">
									<a class="collapse-item"
										href="viewList.do?c=${item.CATEGORY_IDX }">${item.CATEGORY_NAME }
									</a>
								</c:if>
							</c:forEach>
						</div>
					</div></li>
			</c:forEach>
			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="charts.html">
					<span>Charts</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<span>Tables</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<a href="#" data-toggle="modal" data-target="#addCategory"> <img
					src="<c:url value='/resources/img/plus.png'/>" width="30"
					height="30"></a>
			</div>
		</ul>
		<!-- End of Sidebar -->



		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3"></button>


					<script>
						$(function() {
							$(".categoryBTN").click(
									function() {
										var parentCategoryIdx = $(this)
												.parent().children(":eq(1)")
												.val();
										var parentCategoryName = $(this)
												.parent().children(":eq(0)");
										$("#addParentCategoryIdx").val(
												parentCategoryIdx);
										$("#categoryText").html(
												parentCategoryName.html());
									});
							$("#addCategoryBTN")
									.click(
											function() {
												$("#categoryForm")
														.attr("action",
																"/first/sample/AddCategory.do");
												$("#categoryForm").attr(
														"method", "post");
												$("#categoryForm").submit();
											});

							//검색 폼 전송
							$("#searchBTN")
									.click(
											function() {
												$("#searchForm")
														.attr("action",
																"/first/sample/viewListSearch.do");
												$("#searchForm").attr("method",
														"get");
												$("#searchForm").submit();
											});

						});
						//드롭다운 목록 폼 전송
					</script>



					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
						id="searchForm">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="검색하기" aria-label="Search"
								aria-describedby="basic-addon2" name="s" id="s"> <input
								type="hidden" value="${CATEGORY_IDX }" name="c" id="c">
							<div class="input-group-append">
								<button class="btn btn-primary" id="searchBTN"></button>
							</div>
						</div>
					</form>


					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <img src="/img/bell.png" width="25"
								height="25"><i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button"></button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle " href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <img
								src="<c:url value='/resources/img/bell.png'/>" width="25"
								height="25"></i> <!-- Counter - Alerts --> <span
								class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
							<ul class="dropdown-menu">
								<li class="dropdown_list"><a href="#">3-1번 메뉴</a></li>
								<li class="divider"></li>
								<li class="dropdown-header">네비게이션 헤더</li>
								<li class="dropdown_list"><a href="#">3-4번 메뉴</a></li>
							</ul></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"> <img
									src="<c:url value='/resources/img/mail.png'/>" width="25"
									height="25"></i> <!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages --></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">Choe
									Sumin</span> <img class="img-profile rounded-circle"
								src="<c:url value='/resources/img/user.png'/>" width="25"
								height="25">
						</a> <!-- Dropdown - User Information --></li>

					</ul>

				</nav>
				<!-- End of Topbar -->


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">NAME</h1>
						<a href="viewWrite.do?c=${CATEGORY_IDX }"
							class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm">&nbsp&nbsp글쓰기&nbsp&nbsp</a>
					</div>

					<hr>

					<!-- Content Row -->
					<div class="container-fuild">
						<input type="hidden" class="scrollLocation">
						<div class="row listToChange">
							<!-- listToStart 에서 안에 값 비우고 listTostart를 새로 만듦. -->
							<c:forEach var="item" items="${listAll }">
								<div class="col-lg-6 mb-4">
									<!-- Page Heading -->
									<div
										class="d-sm-flex align-items-center justify-content-between mb-4">
									</div>

									<div class="card shadow mb-4">
										<div class="card-header py-3">
											<h6 class="m-0 font-weight-bold text-primary">${item.TITLE }<span
													class="text-danger">&nbsp[${item.HIT_CNT }]</span>
											</h6>
											<input type="hidden" id="IDX" value="${item.IDX }">
										</div>
										<div class="card-body">
											<div class="text-center">
												<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
													style="width: 25rem;" src="img/undraw_posting_photo.svg"
													alt="">
											</div>
											<p>${item.CONTENTS }</p>
											<a href="viewDetail.do?IDX=${item.IDX }">더
												보러가기 &rarr;</a>
											<div class="mt-4 text-center small">
												<span class="mr-2"> <i
													class="fas fa-circle text-primary"></i> Direct
												</span> <span class="mr-2"> <i
													class="fas fa-circle text-success"></i> Social
												</span> <span class="mr-2"> <i
													class="fas fa-circle text-info"></i> Referral
												</span>
											</div>
										</div>
									</div>
								</div>

								<input type="hidden" class="scrolling" data-bno="${item.IDX }">
							</c:forEach>
						</div>
					</div>
				</div>


				<button type="button" class="btn btn-warning btn-circle btn-lg"
					id="upBTN">UP</button>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2019</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>
