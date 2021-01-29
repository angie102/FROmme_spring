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
	<c:set var="list" value="${requestScope.classList}" />
	<c:set var="nowPage" value="${requestScope.reqPage}" />
	<c:set var="startPage" value="${requestScope.startPage}" />
	<c:set var="endPage" value="${requestScope.endPage}" />
	<c:set var="totalCnt" value="${requestScope.totalCnt}" />
	<c:set var="totalPage" value="${requestScope.totalPage}" />


	<div class="product-status mg-b-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>클래스 목록</h4>
                          
                            <table>
                                <tr>
                                    <th>순번</th>
                                    <th>제목</th>
                                    <th>상태</th>
                                    <th>강사 이름</th>
                                    <th>좋아요</th>
                                    <th>가격</th>
                                   
                                    <th>비공개</th>
                                </tr>
                                <c:forEach var="classes" items="${list}" varStatus="i">
                                <tr>
                                    <td> ${i.index + 1} </td>
                                    <td>${classes.getClasses_name()}</td>
                                    <td>
                                    <c:choose>
                                    	<c:when test="${classes.getClasses_state() eq 1}">
                                    		<button class="pd-setting">예약 가능</button>
                                    	</c:when>
                                    	<c:when test="${classes.getClasses_state() eq 2}">
                                    		<button class="ps-setting">준비 중</button>
                                    	</c:when>
                                    	<c:when test="${classes.getClasses_state() eq 3}">
                                    		<button class="ds-setting">예약 불가</button>
                                    	</c:when>
                                    	<c:when test="${classes.getClasses_state() eq 4}">
                                    		<button class="ad-setting">비공개</button>
                                    	</c:when>	
                                    </c:choose>
                                    	<%-- 받은 데이터에 따라 버튼 클래스를 변경시켜줌 
                                    		ds - red 예약 불가
                                    		ps - blue 준비 중
                                    		pd - green 예약 가능
                                    	--%>
                                    </td>
                                    <td>${classes.getClasses_teacher()}</td>
                                    <td>${classes.getClasses_like()}</td>
                                    <td>${classes.getClasses_price()}</td>
                                    <td>
                                        
                                     
                                        <c:choose>
                                    		<c:when test="${classes.getClasses_state() eq 4 }">
                                    			<td>
                                    				<input type="checkbox" value="${classes.getClasses_no()}_${classes.getClasses_state()}" onclick="onClick(this)" checked>
                                    			</td>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<td>
                                    				<input type="checkbox" value="${classes.getClasses_no()}_${classes.getClasses_state()}" onclick="onClick(this)">
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
											<%-- href="${pageContext.request.contextPath}/board/BoardList.bo?page=${nowPage - 1}" --%>
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/classList.adm?page=${nowPage - 1}">이전</a></li>	
										</c:when>
									</c:choose>
									<c:forEach var="i" begin="${startPage + 1}" end="${endPage}" step="1">
										<c:choose>
											<c:when test="${i eq nowPage}">
												<li class="page-item"><a class="page-link" href="#">[${i}]</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/classList.adm?page=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${nowPage != totalPage}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/classList.adm?page=${nowPage + 1}">다음</a></li>
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
		console.log(data[0]);
		console.log(data[1]);
		
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
			http.open('POST', 'setPrivateClass.adm', true);		
			http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			http.send('num='+data[0]+'&set=4');
		} else if(data[1] == 4){
			http.open('POST', 'setPrivateClass.adm', true);		
			http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			http.send('num='+data[0]+'&set=1');
		}
	}
</script>
</html>