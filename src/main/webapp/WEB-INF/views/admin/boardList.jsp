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
	<c:set var="list" value="${requestScope.postList}" />
	<c:set var="nowPage" value="${requestScope.reqPage}" />
	<c:set var="startPage" value="${requestScope.startPage}" />
	<c:set var="endPage" value="${requestScope.endPage}" />
	<c:set var="totalCnt" value="${requestScope.totalCnt}" />
	<c:set var="totalPage" value="${requestScope.totalPage}" />
	<c:set var="category" value="${requestScope.category}" />


	<div class="product-status mg-b-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>문의사항 게시판 글 목록</h4>
                          	<form>
                            <table>
                                <tr>
                                    <th>순번</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>조회 수</th>
                                    <th>댓글 수</th>
                                    <th>설정 </th>
                                    <th>비공개</th>
                                </tr>
                                <c:forEach var="post" items="${list}" varStatus="i">
                                
                                <tr>
                                    <td>${i.index + 1}</td>
                                    <td>${post.getPost_title()}</td>
                                    <td>${post.getUsers_id()}</td>
                                    <td>${post.getPost_views()}</td>
                                    <td>${post.getReply_count()}</td>
                                    <td>
                                    	
                                        <a href="${pageContext.request.contextPath}/board/BoardView.bo?seq=${post.getPost_no()}&cat=${post.getCategory_no()}&page=1&sort=date&litstype=text" >
                                        
                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                        </a>
                                    </td>
                                    	<c:choose>
                                    		<c:when test="${post.getPost_pub() eq 2 }">
                                    			<td>
                                    				<input type="checkbox" value="${post.getPost_no()}_${post.getPost_pub()}" onclick="onClick(this)" checked>
                                    			</td>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<td>
                                    				<input type="checkbox" value="${post.getPost_no()}_${post.getPost_pub()}" onclick="onClick(this)">
                                    			</td>
                                    		</c:otherwise>
                                    	</c:choose>
                                    
                                </tr>
                                </c:forEach>
                            </table>
                            </form>
                            <div class="custom-pagination">
								<ul class="pagination">
									<c:choose>
										<c:when test="${nowPage > 1}">
											
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/board.adm?category=${category}&page=${nowPage-1}">이전</a></li>	
										</c:when>
									</c:choose>
									<c:forEach var="i" begin="${startPage+1}" end="${endPage}" step="1">
										<c:choose>
											<c:when test="${i eq nowPage}">
												<li class="page-item"><a class="page-link">[${i}]</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/board.adm?category=${category}&page=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${nowPage != totalPage}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/board.adm?category=${category}&page=${nowPage+1}">다음</a></li>
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
			http.open('POST', 'setPrivate.adm', true);		
			http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			http.send('num='+data[0]+'&set=2');
		} else if(data[1] == 2){
			http.open('POST', 'setPrivate.adm', true);		
			http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			http.send('num='+data[0]+'&set=1');
		}
		
	}
</script>

</html>