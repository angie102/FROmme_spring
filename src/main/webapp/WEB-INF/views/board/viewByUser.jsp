<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko-KR">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>FROmme - 내 손으로 만드는 특별한 순간</title>
		<%@ include file="../main/src_forInclude.jsp" %>
		<link rel="stylesheet" href="/resources/assets/css/board-style.css">
	</head>
	<body class="size-1140">
		<!-- HEADER -->
		<header role="banner" class="position-absolute">
			<!-- Top Navigation -->
			<%@ include file="../main/header.jsp" %>
		</header>
		<!-- slide banner -->
		<!-- MAIN -->
		<main role="main">
			<!-- Main Header -->
			<header>
				<%@ include file="../main/banner.jsp" %>
			</header>
		</main>
		<div class="line"></div>
		<!-- MAIN -->
		<main role="main">
			<!-- Content -->
			<article>
 				<div class="board_wrapper">
					<%@ include file="./board_template/boardNav.jsp" %>
					<!-- 게시판 -->
					<div class="board">
						<%@ include file="./board_template/boardQuickMenu.jsp" %>
						<ul class="bbsview_list">
							<!-- 각 항목을 li로 만들어주기 -->
							<li class="bbs_title">${board.post_title}</li>
							<li class="bbs_id">작성자 : <span>${board.users_id}</span></li>
							<li class="bbs_date">작성일 : <span>${board_post_date}</span></li>
							<li class="bbs_hit">조회수 : <span>${board.post_views}</span></li>
							<li class="bbs_content">
								<div class="editer_content">${board.post_content}</div>
							</li>
							<li class="bbs_file">
								<h4>첨부 파일</h4>
								<c:if test="${files != null}">
									<c:forEach var="file" items="${files}">
										<a class="file" href="${file.image_path}">
										<c:set var="fileName" value="${fn:split(file.image_path, '_')}" />
											${fileName[fn:length(fileName)-1]}
										</a>
									</c:forEach>
								</c:if>
							</li>
						</ul>
												
						<p class="btn_line txt_right">
							<c:if test="${(cri.field eq 'board') || (cri.field eq 'reply')}">
								<a href="/board/listByUser${cri.getListLink()}&users_id=${users_id}" class="btn_bbs">목록</a>
								<c:if test="${board.users_id eq session_id}">
									<a href="javascript:deleteBoard()" class="btn_bbs">삭제</a>
									<a href="/board/modify${cri.getListLink()}&post_no=${board.post_no}&users_id=${users_id}" class="btn_bbs">수정</a>						
								</c:if>
							</c:if>
						</p>
						
						<form action="/board/delete" method="post" name="boardform">
							<input type="hidden" name="post_no" value="${board.post_no}" />
							<input type="hidden" name="category_no" value="${cri.category_no}" />
							<input type="hidden" name="pageNum" value="${cri.pageNum}" />
							<input type="hidden" name="amount" value="${cri.amount}" />
							<input type="hidden" name="sort" value="${cri.sort}" />
							<input type="hidden" name="list_type" value="${cri.list_type}" />
							<input type="hidden" name="field" value="${cri.field}" />
							<input type="hidden" name="keyword" value="${cri.keyword}" />
							<input type="hidden" name="category_name" value="${cri.category_name}" />
						</form>
						
						<form action="/file/fileDownload" method="get" name="fileform" id="fileform">
							<input type="hidden" name="image_path" value="" />
						</form>

						<div class="reply_wrapper">
							<div><h4 style="text-align:left;">댓글</h4></div>
							<textarea class="reply_contents" name="reply_contents"></textarea>
							<a href="#" class="btn_bbs finish">등록</a>
						</div>
						<c:set var="i" value="${0}"/>
						<div class="reply_area">
							<ul>
							</ul>
						</div>
						<div class="pagination" id="small">
						
						</div>
						<div class="pagination" id="big">
						
						</div>
						<ul class="near_list mt20">
			                <li><h4 class="prev">다음글</h4>
			                	<c:if test="${!empty nextBoard}">
				                	<a href="${pageContext.request.contextPath}/board/BoardViewByUser.bo?seq=${nextBoard.getPost_no()}&cat=${boardBean.getCategory_no()}&users_id=${param.users_id}&filter=${param.filter}">${nextBoard.getPost_title()}</a>
			                	</c:if>
			                	<c:if test="${empty nextBoard}">
				                	<span style="line-height: 27px;font-weight: bold;">게시글이 없습니다.</span>
			                	</c:if>
			                </li>			
			                <li><h4 class="next">이전글</h4>
			               		<c:if test="${!empty prevBoard}">
			               			<a href="/board/viewByUser${cri.getListLink()}&post_no=${prevBoard.post_no}"></a>
			               		</c:if>
			               		<c:if test="${empty prevBoard}">
				                	<span style="line-height: 27px;font-weight: bold;">게시글이 없습니다.</span>
			                	</c:if>
			                </li>							
            			</ul>
					</div>
				</div>
			</article>
		</main>
	    <div class="line"></div>
	    <!-- FOOTER -->
	    <footer>
	      <%@ include file="../main/footer.jsp" %>
	    </footer>
	</body>
	<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
	<script>autosize($("textarea.replys"));</script>
	<script src="/resourcesassets/js/board.js"></script>
	<script type="text/javascript" src="/resources/assets/js/reply.js"></script>
	<script>
		$('.file').on("click", function(e){
			e.preventDefault();
			$('#fileform').find("input[name='image_path']").val($(this).attr("href"));
			$('#fileform').submit();
		});
	</script>
		<script>
	
		$('.finish').on("click", function(e){
			e.preventDefault();
			
			var post_no = "${board.post_no}";
			var replys_id = "${session_id}";
			var replys_content = $("textarea[name='reply_contents']").val();
			replyService.add({
				replys_id : replys_id,
				replys_content : replys_content,
				post_no : post_no
			},
			function(result){
				alert(result + "등록 완료");
				location.reload();
			});
		});
		
		$(document).ready(function(){
			console.log("실행");
			var post_no = "${board.post_no}";
			var reply_area = $('.reply_area');
			var replyPageFooter = $('#big');
			//현재 페이지 기본 값 1 설정
			var pageNum = 1;
			
			//화면 크기 지정
			var mql = window.matchMedia("(max-width: 918px)");
			//listener 설정
			mql.addListener(showReplyPage);
			//페이지번호 출력
			function showReplyPage(replyCnt){
				var str = "";
				var endNum = Math.ceil(pageNum / 10.0) * 10;
				var startNum = endNum - 9;
				var prev = startNum != 1;
				var next = false;
				var realEnd = Math.ceil(replyCnt / 10.0);

				if(endNum * 10 >= replyCnt)
					endNum = realEnd;
				else 
					next = true;
				
				if(mql.matches){
	
					if(pageNum > 1)
						str += "<a href='" + (pageNum - 1) + "' class='changePage pbtn prevpage'><img src='/resources/assets/img/board_images/btn_prevpage.png' alt='이전 페이지로 이동'></a>";
						
					str += "<span class='pageNum'>" + pageNum + "</span>"; 
					
					if(pageNum < realEnd)
						str += "<a href='" + (pageNum + 1) + "' class='changePage pbtn nextpage'><img src='/resources/assets/img/board_images/btn_nextpage.png' alt='다음 페이지로 이동'></a>";
				}else {
	
					if(prev)
						str += "<a href='" + (startNum - 1) + "' class='changePage'><img src='/resources/assets/img/board_images/btn_prevpage.png' alt='이전 페이지로 이동'></a>";

					for(var i=startNum;i<=endNum;i++){
						if(i == pageNum)
							str += "<a href='#'><span class='pagenum currentpage'>" + i + "</span></a>"; 
						else
							str += "<a href='" + i + "' class='changePage'><span class='pagenum'>" + i + "</span></a>";
					}
					if(next)
						str += "<a href='" + (endNum + 1) + "' class='changePage'><img src='/resources/assets/img/board_images/btn_nextpage.png' alt='다음 페이지로 이동'></a>";
				}
				//태그 추가
				replyPageFooter.html(str);
				
				$(".changePage").on("click", function(e){
					e.preventDefault();
					
					pageNum = parseInt($(this).attr('href'));
	
					showList(pageNum);
				});
			}
	
			showList();
			
			function showList(page){
				var post_no = "${board.post_no}";
				
				replyService.getList({
					post_no : post_no,
					page : page || 1
					
				}, function(replyCnt, list){

					if(list == null || list.length == 0){
						reply_area.html("<li>댓글이 없습니다.</li>");
						return;
					}

					var str = "";
					var i = 0;
					$(list).each(function(){
						str += "<div class='reply_area_box'>";
						str += "<li class='reply_id'>" + this.replys_id +"</li>";
						str += "<li><textarea id='" + this.replys_no + "' class='" + this.replys_no + " replys reply_contents' name='replys_content' rows='2' readonly>" + this.replys_content + "</textarea></li>";
						str += "<li class='reply_info'>" + this.replys_date;
						str += "<a href='"+ this.replys_no + "' class='remove reply_btn'>삭제</a>";
						str += "<a href='" + this.replys_no + "' class='modify reply_btn'>수정</a>";
						str += "<a href='" + list[i].replys_no + "' class='finish reply_btn' style='display:none;'>수정 완료</a></li>";
						str += "</div>";
						i++;
					});  
					
					reply_area.html(str);
					showReplyPage(replyCnt);
	
					$('.modify').on("click",function(e){
						e.preventDefault();
						
						//댓글 번호 가져오기
						var replys_no = $(this).attr("href");
						console.log('replys_no : ' + replys_no);
						//댓글 내용 readonly 삭제
						$('textarea.' + replys_no).removeAttr('readonly');
						
						$(this).hide();
						
						$(this).next().show();
						$('textarea.' + replys_no).focus();
						
					});
					
					//수정 완료 버튼
					$('.finish').on("click", function(e){
						e.preventDefault();
						
						var replys_no = $(this).attr("href");
						var replys_content = $('textarea.' + replys_no).val();
						console.log('replys_no : ' + replys_no);
						replyService.update({
							post_no: post_no,
							replys_no: replys_no,
							replys_content: replys_content
							},
							function(result){
								alert(result + "수정 완료");
								location.reload();
							});
					});
					//삭제버튼
					$('.remove').on("click",function(e){
						e.preventDefault();
						
						var replys_no = $(this).attr("href");
						
						replyService.remove(replys_no, function(result){
							alert(result + "삭제 완료");
							location.reload();
						});
					});
				});
			}
		});
	</script>		
</html>