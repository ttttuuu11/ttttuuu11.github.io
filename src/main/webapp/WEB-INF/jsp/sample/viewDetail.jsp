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

textarea[readonly] {
	background-color: white !important;
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
				href="openIndex.do">
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
						//드롭다운 목록 폼 전송
					</script>

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
						<h1 class="h3 mb-0 text-gray-800">상세보기</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm">&nbsp&nbsp취소&nbsp&nbsp</a>
					</div>
					<hr>
					<!-- Content Row -->


					<script>
						$(function() {
							$("#addCategoryBTN")
									.click(
											function() {
												$("#writeForm")
														.attr("action",
																"/first/sample/insertBoard.do");
												$("#writeForm").attr("method",
														"post");
												$("#writeForm").submit();
											});
							$("#deleteBtn").click(
									function() {
										//각 폼의 null 체크
										if (confirm("삭제하시겠습니까?")) {
											$("#writeForm").attr("action",
													"deleteBoard.do");
											$("#writeForm").attr("method",
													"post");
											$("#writeForm").submit();
										}

									});
						});
						//드롭다운 목록 폼 전송
					</script>

					<form role="form" id="writeForm">
						<div class="form-group">
							<label for="mTitle" class="col-form-label">제목</label>
							<h4>${boardDetail.TITLE }</h4>
						</div>
						<input type="hidden" value="${boardDetail.CATEGORY_IDX }"
							id="CATEGORY_IDX" name="CATEGORY_IDX"> <input
							type="hidden" value="${boardDetail.IDX }" id="IDX" name="IDX">
						<div class="form-group">
							<textarea class="form-control" id="CONTENTS" name="CONTENTS"
								rows="5" readonly="readonly">${boardDetail.CONTENTS }</textarea>
							<script>
								$(function() {

									CKEDITOR.replace('CONTENTS', {//해당 이름으로 된 textarea에 에디터를 적용
										width : '100%',
										height : '400px',
										toolbar : 'Custom', //makes all editors use this toolbar
										toolbarStartupExpanded : false,
										toolbarCanCollapse : false,
										toolbar_Custom : []
									//define an empty array or whatever buttons you want.

									});

									CKEDITOR
											.on(
													'dialogDefinition',
													function(ev) {
														var dialogName = ev.data.name;
														var dialogDefinition = ev.data.definition;

														switch (dialogName) {
														case 'image': //Image Properties dialog
															//dialogDefinition.removeContents('info');
															dialogDefinition
																	.removeContents('Link');
															dialogDefinition
																	.removeContents('advanced');
															break;
														}
													});
								});
							</script>

							<script>
								$(function() {
									$("#commentBTN")
											.click(
													function() {
														var msg = "댓글을 다시 확인해주세요";
														var state = true;
														var IDX = $(
																"#BOARD_IDX")
																.val();

														if (!$("#PW").val()) {
															msg = "비밀번호를 입력해주세요";
															state = false;
														}
														if (!$("#NAME").val()) {
															msg = "아이디를 입력해주세요";
															state = false;
														}
														if (!$("#COMMENT")
																.val()) {
															msg = "내용을 입력해주세요";
															state = false;
														}

														if (state) {
															$("#commentForm")
																	.attr(
																			"action",
																			"/first/sample/AddComment.do?IDX="
																					+ IDX);
															$("#commentForm")
																	.attr(
																			"method",
																			"post");
															$("#commentForm")
																	.submit();
														} else {
															alert(msg);
														}
													});
									$(".reply")
											.each(
													function(i) {
														$(this)
																.click(
																		function() {
																			// .....

																			var table = $(
																					this)
																					.parent();

																			var boardId = table
																					.children(
																							":eq(1)")
																					.html();
																			var depth = table
																					.children(
																							":eq(2)")
																					.html();
																			var orderNo = table
																					.children(
																							":eq(4)")
																					.html();
																			var replyId = table
																					.children(
																							":eq(3)")
																					.html();

																			var commentForm = $(
																					"#commentForm")
																					.detach();
																			var replyF = $(
																					this)
																					.parent()
																					.parent()
																					.parent();
																			replyF
																					.after(commentForm);

																			$(
																					"#depth")
																					.val(
																							parseInt(depth) + 1);
																			$(
																					"#parentReplyId")
																					.val(
																							replyId); //부모의 replyId 값
																			$(
																					"#boardId")
																					.val(
																							boardId);
																			$(
																					"#orderNo")
																					.val(
																							orderNo);
																		});
													});

								});
							</script>
						</div>
						<div class="form-group text-center">
							<button type="button" class="btn btn-primary" id="deleteBtn">삭제하기</button>
							<button type="button" class="btn btn-info"
								onclick="history.back(1)">돌아가기</button>
						</div>
					</form>

					<hr>

					<c:forEach var="item" items="${commentList }">
						<div class="container mt-2">
							<div class="commentF">
								<div class="row">
									<h6>
										&ensp;&ensp;ID:&nbsp;${item.NAME }&ensp;<small
											style="color: #808080">${item.CREA_DTM }</small>
									</h6>
								</div>
								<div class="row">
									<div class="col-lg-12 col-md-12 mb-1 mt-1">
										<textarea class="form-control no-gray" id="COMMENT"
											name="COMMENT" rows="5" readonly="readonly">${item.CONTENTS }</textarea>
									</div>
								</div>
								<div class="row flex-row-reverse">
									<div class="col-lg-1 col-md-2">
										<a id="commentReplyBTN" class="reply">답글</a> <input
											type="hidden" id="BOARD_IDX" name="BORAD_IDX"
											value="${boardDetail.IDX }" /> <input type="hidden"
											id="DEPTH" name="DEPTH" value="0" /> <input type="hidden"
											id="PARENT_IDX" name="PARENT_IDX" value="0" /> <input
											type="hidden" id="ORDER_IDX" name="ORDER_IDX" value="-1" />

									</div>
									<div class="col-lg-1 col-md-2">
										<a id="commentUpdateBTN">수정</a>
									</div>
									<div class="col-lg-1 col-md-2">
										<a id="commentDeleteBTN">삭제</a>
									</div>
								</div>
							</div>
							<hr>
						</div>
					</c:forEach>
					<!-- Content Row -->
					<div class="container mt-2">
						<form role="form" id="commentForm">
							<div class="row">
								<div class="col-lg-4 col-md-4">
									<input type="text" class="form-control" id="NAME" name="NAME"
										placeholder="아이디">
								</div>
								<div class="col-lg-4 col-md-4">
									<input type="password" class="form-control" " id="PW" name="PW"
										placeholder="비밀번호">
								</div>
							</div>
							<div class="row">
								<div class="col-lg-11 col-md-11 mb-1 mt-1">
									<textarea class="form-control" id="COMMENT" name="COMMENT"
										rows="5" placeholder="댓글을 작성하세요"></textarea>
								</div>
								<button class="col-md-1 mb-2 btn btn-primary" id="commentBTN"
									name="commentBTN">등록</button>
							</div>
						</form>
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
