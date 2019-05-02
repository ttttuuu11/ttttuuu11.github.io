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

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-primary sidebar sidebar-dark accordion "
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="iopenIndex.do">
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
						});
						//드롭다운 목록 폼 전송
					</script>

					<!-- Sidebar Category Add modal -->
					<div class="modal fade" id="addCategory" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">카테고리 추가</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form role="form" id="categoryForm">
										<div class="form-group">
											<label for="mTitle" class="col-form-label">큰 카테고리</label>
											<div class="dropdown">
												<input type="hidden" value="" id="addParentCategoryIdx"
													name="addParentCategoryIdx">
												<button class="btn btn-secondary dropdown-toggle"
													type="button" id="dropdownMenu2" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false">카테고리 선택</button>
												<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
													<button class="dropdown-item categoryBTN" type="button">큰
														카테고리</button>
													<input type="hidden" value="0">

													<c:forEach var="parentCategory"
														items="${sidebarListParentNull }">
														<div class="categoryDropdown">
															<button class="dropdown-item categoryBTN" type="button">${parentCategory.CATEGORY_NAME}</button>
															<input type="hidden"
																value="${parentCategory.CATEGORY_IDX }">
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-3">
												<h6 id="categoryText">선택안함</h6>
											</div>
											<div class="col-sm">
												<h6>에 생성</h6>
											</div>
										</div>
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="카테고리 이름" aria-label="Category"
											aria-describedby="basic-addon2" id="addCategoryName"
											name="addCategoryName">
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary"
										id="addCategoryBTN">추가</button>
								</div>
							</div>
						</div>
					</div>

					<script>
						$(function() {

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
					</script>

					<c:set var="CATEGORY_IDX" value="0"></c:set>

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
								height="25">
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

				<!-- 학습내용 삭제 jquery -->
				<script>
					$(function() {

						// Let the gallery items be draggable
						$(".studyCard").draggable({
							revert : true
						});

						// Let the trash be droppable, accepting the gallery items
						$("#trash")
								.droppable(
										{
											drop : function(event, ui) {
												if (confirm("삭제하시겠습니까?")) {

													var studyCard = ui.draggable;
													var studyCardIdx = studyCard
															.find(".studyIDX")
															.val();
													studyCard.remove()

													$
															.ajax({
																type : 'post', // 요청 method 방식
																url : 'deleteStudy.do',// 요청할 서버의 url
																headers : {
																	"Content-Type" : "application/json",
																	"X-HTTP-Method-Override" : "POST"
																},
																dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
																data : JSON
																		.stringify({ // 서버로 보낼 데이터 명시
																			STUDY_IDX : studyCardIdx
																		}),
																success : function(
																		data) {// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
																	console
																			.log(data);
																	var str = "";
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
																							str += "<div class="+"'col-xl-3 col-md-6 mb-4 studyCard ui-draggable ui-draggable-handle '"+">"
																									+ "<input type="+"'hidden'"+" class="+"'studyIDX'"
																										+"value='"+this.STUDY_IDX+"'>"

																									+ "<div class="+"'card border-info shadow h-100'"+">"
																									+ "<div class="+"'card-header'"+">"
																									+ "<h6 class="+"'h6 mb-0 font-weight-bold text-gray-800 '"+">"
																									+ this.TITLE
																									+ "</h6>"
																									+ "</div>"
																									+ "<div class="+"'card-body'"+">"
																									+ "<div class="+"'row no-gutters align-items-center'"+">"
																									+ "<div class="+"'col mr-2'"+">"
																									+ "<div"+" class="+"'text-xs font-weight-bold text-primary text-uppercase mb-1 '"+">"
																									+ this.CREATE_DATE
																									+ "</div>"
																									+ "<div class="+"'h6 mb-0 font-weight-bold text-gray-800'"+">"
																									+ this.CONTENT
																									+ "</div>"
																									+ "</div>"
																									+ "<div class="+"'col-auto'"+">"
																									+ "<i class="+"'fas fa-calendar fa-2x text-gray-300'"+">"
																									+ "</i>"
																									+ "</div>"
																									+ "</div>"
																									+ "</div>"
																									+ "</div>"
																									+ "</div>"
																						});// each
																		// 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
																		//$(".listToChange").remove();// 셀렉터 태그를 와 태그값 지운다.                       
																		$(
																				".studyCard:last")
																				.after(
																						str);
																		$(".studyCard").draggable({
																			revert : true
																		});
																	}// if : data!=null
																	else { // 9. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..
																		alert("더 불러올 데이터가 없습니다.");
																	}// else

																}// success
															});// ajax
												}
											}
										});

					});
				</script>


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800 ">학습 내용</h1>
						<div id="trash">
							<img src="<c:url value='/resources/img/trashB.png'/>" width="40"
								height="40">
						</div>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm"
							data-toggle="modal" data-target="#studyWrite">&nbsp&nbsp글쓰기&nbsp&nbsp</a>
					</div>
					<hr>

					<script>
						$(function() {
							$("#studyWriteBTN").click(
									function() {
										$("#myform").attr("action",
												"/first/sample/StudyWrite.do");
										$("#myform").attr("method", "post");
										$("#myform").submit();
									});
						});
					</script>


					<!-- modal -->
					<div class="modal fade" id="studyWrite" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">학습내용 추가</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form role="form" id="myform">
										<div class="form-group">
											<label for="mTitle" class="col-form-label">제목</label> <input
												type="text" class="form-control" id="mTitle" name="mTitle"
												placeholder="제목">
										</div>
										<div class="form-group">
											<label for="message-text" class="col-form-label">내용</label>
											<textarea class="form-control" id="mContent" name="mContent"
												rows="5" placeholder="내용"></textarea>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary"
										id="studyWriteBTN">추가</button>
								</div>
							</div>
						</div>
					</div>




					<!-- Content Row -->
					<div class="row" id="gallery">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4 studyCard" id="studyCard">
							<input type="hidden" class="studyIDX"
								value="${studyList[0].STUDY_IDX }">
							<div class="card border-primary shadow h-100">
								<div class="card-header">
									<h6 class="h6 mb-0 font-weight-bold text-gray-800 ">${studyList[0].TITLE }</h6>
								</div>
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1 ">
												${studyList[0].CREATE_DATE }</div>
											<div class="h6 mb-0 font-weight-bold text-gray-800">${studyList[0].CONTENT }</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 mb-4 studyCard ">
							<input type="hidden" class="studyIDX"
								value="${studyList[1].STUDY_IDX }">

							<div class="card border-info shadow h-100">
								<div class="card-header">
									<h6 class="h6 mb-0 font-weight-bold text-gray-800 ">${studyList[1].TITLE }</h6>
								</div>
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1 ">
												${studyList[1].CREATE_DATE }</div>
											<div class="h6 mb-0 font-weight-bold text-gray-800">${studyList[1].CONTENT }</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 mb-4 studyCard">
							<input type="hidden" class="studyIDX"
								value="${studyList[2].STUDY_IDX }">

							<div class="card border-warning shadow h-100 ">
								<div class="card-header">
									<h6 class="h6 mb-0 font-weight-bold text-gray-800 ">${studyList[2].TITLE }</h6>
								</div>
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1 ">
												${studyList[2].CREATE_DATE }</div>
											<div class="h6 mb-0 font-weight-bold text-gray-800">${studyList[2].CONTENT }</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 mb-4 studyCard">
							<input type="hidden" class="studyIDX"
								value="${studyList[3].STUDY_IDX }">
							<div class="card border-secondary shadow h-100 ">
								<div class="card-header">
									<h6 class="h6 mb-0 font-weight-bold text-gray-800 ">${studyList[3].TITLE }</h6>
								</div>
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1 ">
												${studyList[3].CREATE_DATE }</div>
											<div class="h6 mb-0 font-weight-bold text-gray-800">${studyList[3].CONTENT }</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr>

					<!-- Content Row -->

					<div class="row">


						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">후원</h6>

								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="sponsor text-center">
										<img class="mt-1"
											src="<c:url value='/resources/img/money.png'/>" width="150"
											height="150"> <br> <br>
										<h4>후원하기</h4>
										<p>
											<small>개발자를 응원해주세요</small>
										</p>
										<button type="button" class="btn btn-warning">Start
											Kakao Pay</button>
									</div>
									<div class="mt-2 text-center small">
										<span class="mr-2"> <i
											class="fas fa-circle text-primary"></i> Direct
										</span> <span class="mr-2"> <i
											class="fas fa-circle text-success"></i> Social
										</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
											Referral
										</span>
									</div>
								</div>
							</div>
						</div>

						<!-- Area Chart -->
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">제목...</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="myAreaChart"></canvas>
									</div>
								</div>
							</div>
						</div>

					</div>
					<hr>

					<!-- Content Row -->
					<div class="row">

						<!-- Content Column -->
						<div class="col-lg-6 mb-4">

							<!-- Project Card Example -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">학습 기록</h6>
								</div>
								<div class="card-body">
									<h4 class="small font-weight-bold">
										4월 <span class="float-right">20%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-danger" role="progressbar"
											style="width: 20%" aria-valuenow="20" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										3월 <span class="float-right">40%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-warning" role="progressbar"
											style="width: 40%" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										2월 <span class="float-right">60%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar" role="progressbar"
											style="width: 60%" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										1월 <span class="float-right">80%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-info" role="progressbar"
											style="width: 80%" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										12월 <span class="float-right">Complete!</span>
									</h4>
									<div class="progress">
										<div class="progress-bar bg-success" role="progressbar"
											style="width: 100%" aria-valuenow="100" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>

							<!-- Color System -->
							<div class="row">
								<div class="col-lg-6 mb-4">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											Primary
											<div class="text-white-50 small">#4e73df</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-success text-white shadow">
										<div class="card-body">
											Success
											<div class="text-white-50 small">#1cc88a</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-info text-white shadow">
										<div class="card-body">
											Info
											<div class="text-white-50 small">#36b9cc</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-warning text-white shadow">
										<div class="card-body">
											Warning
											<div class="text-white-50 small">#f6c23e</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-danger text-white shadow">
										<div class="card-body">
											Danger
											<div class="text-white-50 small">#e74a3b</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-secondary text-white shadow">
										<div class="card-body">
											Secondary
											<div class="text-white-50 small">#858796</div>
										</div>
									</div>
								</div>
							</div>

						</div>

						<div class="col-lg-6 mb-4">
							<!-- Page Heading -->
							<div
								class="d-sm-flex align-items-center justify-content-between mb-4">
								<h1 class="h3 mb-0 text-gray-800">최신글</h1>
								<a href="#"
									class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm">&nbsp&nbsp더보기&nbsp&nbsp</a>
							</div>

							<c:forEach var="item" items="${list }">
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
										<a target="_blank" rel="nofollow" href="https://undraw.co/">더
											보러가기 &rarr;</a>
									</div>
								</div>
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
