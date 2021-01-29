<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<!-- 우리 페이지 로고 -->
    <div class="left-sidebar-pro">
        <nav id="sidebar" class="">
            <div class="sidebar-header">
                <a href="/admin/index"><img class="main-logo" src="/resources/assets/admin/img/logo/logo_3.png" alt="" /></a>
                
            </div>
			<div class="nalika-profile">
				<div class="profile-dtl">
                    <!-- gravatar 연동? -->
					<a href="#"><img src="/resources/assets/admin/img/notification/4.jpg" alt="" /></a>
					<h2>${session_id}</h2>
				</div>
			</div>
            <div class="left-custom-menu-adp-wrap comment-scrollbar">
                <nav class="sidebar-nav left-sidebar-menu-pro">
                    <ul class="metismenu" id="menu1">
                        <li class="" onclick="">
                            <a class="has-arrow" href="index.jsp">
								   <i class="icon nalika-home icon-wrap"></i>
								   <span class="mini-click-non">데이터 관리</span>
								</a>
							<ul class="submenu-angle" aria-expanded="true">
                                <li><a title="Product List" href="/admin/studioList?page=1"><span class="mini-sub-pro">공방주 승인</span></a></li>
                            </ul>
                            <ul class="submenu-angle" aria-expanded="true">
                                <li><a title="Product List" href="/admin/classList?page=1"><span class="mini-sub-pro">클래스 목록</span></a></li>
                            </ul>
                            <ul class="submenu-angle" aria-expanded="true">
                                <li><a title="Product List" href="/admin/userList?page=1"><span class="mini-sub-pro">유저 목록</span></a></li>
                            </ul>
                            <ul class="submenu-angle" aria-expanded="true">
                                <li><a title="Product List" href="/admin/boardList?category=2&page=1"><span class="mini-sub-pro">건의사항 게시판</span></a></li>
                            </ul>
                            <ul class="submenu-angle" aria-expanded="true">
                                <li><a title="Product List" href="/admin/boardList?category=3&page=1"><span class="mini-sub-pro">내 작품 자랑 게시판</span></a></li>
                            </ul>
                            <ul class="submenu-angle" aria-expanded="true">
                                <li><a title="Product List" href="/admin/boardList?category=4&page=1"><span class="mini-sub-pro">중고 거래 게시판</span></a></li>
                            </ul>
                            <ul class="submenu-angle" aria-expanded="true">
                                <li><a title="Product List" href="/admin/boardList?category=1&page=1"><span class="mini-sub-pro">공지사항</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="mailbox.html" aria-expanded="false"><i class="icon nalika-mail icon-wrap"></i> <span class="mini-click-non">쪽지함</span></a>
                            <ul class="submenu-angle" aria-expanded="false">
                                <li><a title="Inbox" href="/admin/mailList?page=1"><span class="mini-sub-pro">쪽지함</span></a></li>
                                <li><a title="Compose Mail" href="/admin/sendMail"><span class="mini-sub-pro">쪽지 보내기</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="#" aria-expanded="false"><i class="icon nalika-bar-chart icon-wrap"></i> <span class="mini-click-non">차트</span></a>
                            <ul class="submenu-angle" aria-expanded="false">
                                <li><a title="Bar Charts" href="/admin/viewChart.jsp"><span class="mini-sub-pro">방문 차트</span></a></li>
                                <li><a title="Line Charts" href="/admin/classChart.jsp"><span class="mini-sub-pro">예약 차트</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </nav>
    </div>
    <!-- Start Welcome area -->
    <div class="all-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="logo-pro">
                        <!-- 우리 로고 -->
                        <a href="index.jsp"><img class="main-logo" src="/resources/assets/admin/img/logo/logo_3.png" alt="" /></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-advance-area">
            <div class="header-top-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="header-top-wraper">
                                <div class="row">
                                    <div class="col-lg-1 col-md-0 col-sm-1 col-xs-12">
                                        <div class="menu-switcher-pro">
                                            
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-7 col-sm-6 col-xs-12">
                                        
                                    </div>
                                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                        <div class="header-right-info">
                                            <ul class="nav navbar-nav mai-top-nav header-right-menu">
                                                <li class="nav-item dropdown">
                                                    <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><i class="icon nalika-mail" aria-hidden="true"></i><span class="indicator-ms"></span></a>
                                                    <div role="menu" class="author-message-top dropdown-menu animated zoomIn">
                                                        <div class="message-single-top">
                                                            <h1>쪽지</h1>
                                                        </div>
                                                        <ul class="message-menu">
                                                            <!-- 관리자에게 온 쪽지 (최대 4개)-->
                                                        </ul>
                                                        <div class="message-view">
                                                            <!-- 메일함이 완성돠면 링크 추가 -->
                                                            <a href="#">모든 쪽지 보기</a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="nav-item"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><i class="icon nalika-alarm" aria-hidden="true"></i><span class="indicator-nt"></span></a>
                                                    <div role="menu" class="notification-author dropdown-menu animated zoomIn">
                                                        <div class="notification-single-top">
                                                            <h1>알림</h1>
                                                        </div>
                                                        <ul class="notification-menu">
                                                            <!-- 관리자에게 오는 알림판 (최대 4개)-->
                                                        </ul>
                                                        <div class="notification-view">
                                                            <a href="#">모든 알림 보기</a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
															<i class="icon nalika-user"></i>
															<span class="admin-name">${session_id}</span>
															<i class="icon nalika-down-arrow nalika-angle-dw"></i>
														</a>
                                                    <ul role="menu" class="dropdown-header-top author-log dropdown-menu animated zoomIn">
                                                        <!-- 내 정보 보기로 가는 링크-->
                                                        <li><a href="${pageContext.request.contextPath}/app/main/index.jsp"><span class="icon nalika-settings author-log-ic"></span>메인 페이지</a>
                                                        </li>
                                                        <li><a href="${pageContext.request.contextPath}/user/UserLogout.use"><span class="icon nalika-unlocked author-log-ic"></span>로그 아웃</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="nav-item nav-setting-open"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><i class="icon nalika-menu-task"></i></a>
                                                    <div role="menu" class="admintab-wrap menu-setting-wrap menu-setting-wrap-bg dropdown-menu animated zoomIn">
                                                        <ul class="nav nav-tabs custon-set-tab">
                                                            <li class="active"><a data-toggle="tab" href="#Notes">News</a>
                                                            </li>
                                                            <li><a data-toggle="tab" href="#Projects">Activity</a>
                                                            </li>
                                                            <li><a data-toggle="tab" href="#Settings">Settings</a>
                                                            </li>
                                                        </ul>

                                                        <div class="tab-content custom-bdr-nt">
                                                            <div id="Notes" class="tab-pane fade in active">
                                                                <div class="notes-area-wrap">
                                                                    <div class="note-heading-indicate">
                                                                        <h2><i class="icon nalika-chat"></i> Latest News</h2>
                                                                        <p>You have 10 New News.</p>
                                                                    </div>
                                                                    <div class="notes-list-area notes-menu-scrollbar">
                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="Projects" class="tab-pane fade">
                                                                <div class="projects-settings-wrap">
                                                                    <div class="note-heading-indicate">
                                                                        <h2><i class="icon nalika-happiness"></i> Recent Activity</h2>
                                                                        <p> You have 20 Recent Activity.</p>
                                                                    </div>
                                                                    <div class="project-st-list-area project-st-menu-scrollbar">
                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu start -->
            <div class="mobile-menu-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="mobile-menu">
                                <nav id="dropdown">
                                    <ul class="mobile-menu-nav">
                                        <li><a data-toggle="collapse" data-target="#Charts" href="#">데이터 목록<span class="admin-project-icon nalika-icon nalika-down-arrow"></span></a>
                                            <ul class="collapse dropdown-header-top">
                                                <li><a href="classList.jsp">클래스 목록</a></li>
                                                <li><a href="userList.jsp">유저 목록</a></li>
                                                <li><a href="noticeList.jsp">공지사항 목록</a></li>
                                                <li><a href="suggestBoard.jsp">건의 사항 게시판</a></li>
                                                <li><a href="introduceBoard.jsp">내 작품 자랑 게시판</a></li>
                                                <li><a href="tradeBoard.jsp">중고 거래 게시판</a></li>

                                            </ul>
                                        </li>
                                        <li><a data-toggle="collapse" data-target="#demo" href="#">메일함<span class="admin-project-icon nalika-icon nalika-down-arrow"></span></a>
                                            <ul id="demo" class="collapse dropdown-header-top">
                                                <li><a href="mailbox.html">Inbox</a>
                                                </li>
                                                <li><a href="mailbox-view.html">View Mail</a>
                                                </li>
                                                <li><a href="mailbox-compose.html">Compose Mail</a>
                                                </li>
                                            </ul>
                                        </li>
                                        
                                        <li><a data-toggle="collapse" data-target="#Chartsmob" href="#">차트<span class="admin-project-icon nalika-icon nalika-down-arrow"></span></a>
                                            <ul id="Chartsmob" class="collapse dropdown-header-top">
                                                <li><a href="viewChart.jsp">방문 차트</a>
                                                </li>
                                                <li><a href="classChart.jsp">예약 차트</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu end -->
            <div class="breadcome-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="breadcome-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="breadcomb-wp">
											<div class="breadcomb-icon">
												
											</div>
											<div class="breadcomb-ctn">
												<h2>[${session_id}] 님 안녕하세요</h2>
												
											</div>
										</div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                      
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

        <!-- 메인 컨텐츠 표시구간 -->
</body>
</html>
