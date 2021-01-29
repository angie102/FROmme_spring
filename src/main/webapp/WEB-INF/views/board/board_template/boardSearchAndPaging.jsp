<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageNum" value="${pageMaker.cri.pageNum}" />
<div>
	<form class="minisrch_form" name="srchform" method="get">
		<fieldset style="margin-top:20px;">
		<input type="hidden" name="category_no" value="${pageMaker.cri.category_no}" />
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
		<input type="hidden" name="sort" value="${pageMaker.cri.sort}" />
		<input type="hidden" name="list_type" value="${pageMaker.cri.list_type}" />
			<select name='field' size='0' class="listbox">
				<option value='title' ${pageMaker.cri.field eq "title" ? "selected" : "" }>제목</option>
				<option value='users_id' ${pageMaker.cri.field eq "users_id" ? "selected" : "" }>아이디</option>
			</select>
			<legend>검색</legend>
			<input type="text" class="tbox" name="keyword" title="검색어를 입력하세요" placeholder="검색어를 입력하세요" value="${pageMaker.cri.keyword}">
			<a href="javascript:searchBoard()" class="btn_srch">검색</a>
			<div class="btn_wrap">
				<c:if test="${pageMaker.cri.users_authority eq 3}">
					<c:if test="${category_no eq 1}">
						<a href="javascript:checkBoard('del',${category_no},${pageNum})" class="btn_bbs write_btn">삭제</a>			
					</c:if>
					<c:if test="${listtype ne 'image'}">
						<a href="javascript:checkBoard('pub',${category_no},${pageNum})" class="btn_bbs write_btn">공개</a>			
					</c:if>
				</c:if>
				<c:if test="${category_no ne 1}">
					<a href="javascript:checkSessionIdBeforeSubmitBoardWrite('${pageMaker.cri.getListLink()}')" class="btn_bbs write_btn">글쓰기</a>
				</c:if>
			</div>
		</fieldset>
		<div class="current_page" style="margin-top:20px;">
			<c:if test="${pageNum >= 1}">
				${pageNum} / ${pageMaker.endPage} page			
			</c:if>
		</div>
	</form>
</div>
<c:set var="image_path" value="/resources/assets/img/board_images" />
<div class="pagination" id="small">
	<c:if test="${pageNum > 1}">
		<a href="${pageNum - 1}" class="prevpage pbtn changePage"><img src="${image_path}/btn_prevpage.png" alt="이전 페이지로 이동"></a>
	</c:if>
	<a href="#"><span class="pagenum currentpage">${pageNum}</span></a>
	<c:if test="${pageNum < pageMaker.realEnd}">
		<a href="${pageNum + 1}" class="nextpage pbtn changePage"><img src="${image_path}/btn_nextpage.png" alt="다음 페이지로 이동"></a>                      	
	</c:if>
</div>
<div class="pagination" id="big">
	<c:if test="${pageMaker.prev}">
		<a href="${pageMaker.startPage}" class="firstpage pbtn changePage"><img src="${image_path}/btn_firstpage.png" alt="첫 페이지로 이동"></a>
		<a href="${pageMaker.startPage - 1}" class="prevpage pbtn changePage"><img src="${image_path}/btn_prevpage.png" alt="이전 페이지로 이동"></a>          	
	</c:if>
	<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		<c:choose>
			<c:when test="${i eq pageNum}">
				<a href="#"><span class="pagenum currentpage">${i}</span></a>
			</c:when>
			<c:otherwise>
				<a href="${i}" class="changePage"><span class="pagenum">${i}</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pageMaker.next}">
		<a href="${pageMaker.endPage + 1}" class="nextpage pbtn changePage"><img src="${image_path}/btn_nextpage.png" alt="다음 페이지로 이동"></a>
		<a href="${pageMaker.endPage}" class="lastpage pbtn changePage"><img src="${image_path}/btn_lastpage.png" alt="마지막 페이지로 이동"></a>                              	
	</c:if>
</div>