<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>
<html class="no-js" lang="kr">

<head>
    <c:import url="./header.jsp"></c:import>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<c:import url="./menuBar.jsp"></c:import>
	<c:set var="list" value="${userList}" />
	<c:set var="nowPage" value="${page}" />
	<c:set var="startPage" value="${requestScope.startPage}" />
	<c:set var="endPage" value="${requestScope.endPage}" />
	<c:set var="totalCnt" value="${requestScope.totalCnt}" />
	<c:set var="totalPage" value="${requestScope.totalPage}" />


	<div class="product-status mg-b-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>유저 목록</h4>
                          
                            <table>
                                <tr>
                                    <th>순번</th>
                                    <th>아이디</th>
                                    <th>권한</th>
                                    <th>전화번호</th>
                                    <th>예약 횟수</th>
                                    <th>지불액</th>
                                    <th>게시글 수</th>
                                    <th>댓글 수</th>
                                    <th>설정</th>
                                    <th>비활성화</th>
                                </tr>
                                <c:forEach var="users" items="${list}" varStatus="i">
                                <tr>
                                    <td> ${i.index + 1} </td>
                                    <td>${users.getUsers_id()}</td>
                                    <td>
                                    <c:choose>
                                    	<c:when test="${users.getUsers_authority() == 1}">
                                    		<button class="pd-setting">일반 회원</button>
                                    	</c:when>
                                    	<c:when test="${users.getUsers_authority() == 2}">
                                    		<button class="ps-setting">공방 주</button>
                                    	</c:when>
                                    	<c:when test="${users.getUsers_authority() == 3}">
                                    		<button class="ds-setting">관리자</button>
                                    	</c:when>
                                    	<c:when test="${users.getUsers_authority() == 6}">
                                    		<button class="ad-setting">비활성화</button>
                                    	</c:when>	
                                    </c:choose>
                                    	<%-- 받은 데이터에 따라 버튼 클래스를 변경시켜줌 
                                    		ds - red 예약 불가
                                    		ps - blue 준비 중
                                    		pd - green 예약 가능
                                    	--%>
                                    </td>
                                    <td>${users.getUsers_phone()}</td>
                                    <td>${users.getUsers_ReservationCnt()}</td>
                                    <td>${users.getUsers_Amount()}</td>
                                    <td>${users.getUsers_PostCnt()}</td>
                                    <td>${users.getUsers_ReplyCnt()}</td>
                                    <td>
                                        <a href="/admin/userModifyAction.adm?id=${users.getUsers_id()}&page=${nowPage}">
                                        	<button data-toggle="tooltip" title="수정" class="pd-setting-ed"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                                        </a>
                                      
                                        <!-- 정지 먹이기 -->
                                        <c:choose>
                                    		<c:when test="${users.getUsers_authority() eq 6 }">
                                    			<td>
                                    				<input type="checkbox" value="${users.getUsers_no()}_${users.getUsers_authority()}" onclick="onClick(this)" checked>
                                    			</td>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<td>
                                    				<input type="checkbox" value="${users.getUsers_no()}_${users.getUsers_authority()}" onclick="onClick(this)">
                                    			</td>
                                    		</c:otherwise>
                                    	</c:choose>
                                    </td>
                                </tr>
                                </c:forEach>
 
                            </table>
                            <div class="custom-pagination">
								<ul class="pagination">
									<c:choose>
										<c:when test="${nowPage > 1}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/userList.adm?page=${nowPage - 1}">이전</a></li>	
										</c:when>
									</c:choose>
									<c:forEach var="i" begin="${startPage+1}" end="${endPage}" step="1">
										<c:choose>
											<c:when test="${i eq nowPage}">
												<li class="page-item"><a class="page-link">[${i}]</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/userList.adm?page=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${nowPage != totalPage}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/userList.adm?page=${nowPage + 1}">다음</a></li>
										</c:when>
									</c:choose>
								</ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="./footer.jsp"></c:import>
</body>
<script>
	function onClick(obj) {
		let data = obj.value.split("_");
		let http = new XMLHttpRequest();
		http.onreadystatechange = (e) => {
			let body = e.target;
			if(body.readyState == XMLHttpRequest.DONE) {
				if(body.status == 200 || body.status == 201) {
					console.log(body);	
				}
			}
		}
		if(data[1] == 1) {
			http.open('POST', '/user/private/'+data[0]+'/6', true);
			http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			http.send();
		} else if(data[1] == 6){
			http.open('POST', '/user/private/'+data[0]+'/1', true);
			http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			http.send();
		}
		
	}
</script>
</html>
