/**
 * classes js
 */

function check(){
	alert("연결확인");
}


//좋아요 모듈화
var likeService = (function() {
	function update(likeit, callback, error) {
		$.ajax({
			type:"PUT",
			url:"/datas/like/"+likeit.userId+"/"+likeit.classesNo,
			data: JSON.stringify(likeit),
			contentType:"application/json; charset=utf-8",
			successs: function(result, status, xhr) {
				if(callback){
					console.log("성공");
				callback(result);
				}
			},
			error: function(er, status, xhr) {
				if(error){error(er);}
			}
		})
	}
	
	return {update:update};

})();

//datepicker 선택시 비동시 통신
var dateService = (function() {
	function getNum(classesInfo, callback, error) {
		var classesNo = classesInfo.classesNo;
		var classesDate = classesInfo.classesDate;
		$.getJSON("/datas/"+classesNo+"/"+classesDate,
		function(data) {
			if(callback){callback(data);}
		}).fail(function(xhr, status, err) {
			if(error){errer(er);}
		});
	}
	return { getNum : getNum }
})();



var CartService = (function() {

	function add(cart, callback, error) {
		console.log(cart.usersId);
		$.ajax({
			type:"post",
			url:"/cart/new",
			data: JSON.stringify(cart),
			contentType:"application/json; charset=utf-8",
			successs: function(result, status, xhr) {
				if(callback){
					console.log("성공");
				callback(result);
				}
			},
			error: function(er, status, xhr) {
				if(error){error(er);}
			}
		})
	}
	
	function remove(cartNo, callback, error) {
		$.ajax({
			type:"DELETE",
			url:"/cart/"+cartNo,
			successs: function(result, status, xhr) {
				if(callback){
				callback(result);
				}
			},
			error: function(er, status, xhr) {
				if(error){error(er);}
			}
		})
	}
	
	function modify(cart, callback, error) {
		$.ajax({
			type:"PUT",
			url:"/cart/"+cart.cartNo,
			data: JSON.stringify(cart),
			contentType:"application/json; charset=utf-8",
			successs: function(result, status, xhr) {
				if(callback){callback(result);}
			},
			error: function(er, status, xhr) {
				if(error){error(er);}
			}
		})
	}

	return {add : add, modify : modify, remove : remove}
	
})();
