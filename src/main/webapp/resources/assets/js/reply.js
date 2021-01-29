/**
 * JavaScript의 모듈화
 * 
 * 함수들을 하나의 모듈처럼 묶음으로 구성하는 것을 의미합니다.
 * 화면 내에서 JavaScript 처리를 하다 보면 이벤트 처리와 DOM, Ajax처리 등이
 * 복잡하게 섞여서 유지보수가 힘듭니다. 따라서 JavaScript를 하나의 모듈처럼 구성하여 사용합니다.
 * 
 * reply modules
 */

var replyService = (function(){
	 
	function add(reply, callback, error){
		console.log("add reply...");
		$.ajax({
			type: "POST",
			url: "/replies/new",
			data: JSON.stringify(reply),
			contentType: "application/json;charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					console.log(result);
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	//댓글 삭제
	function remove(replys_no, callback, error){
		console.log("remove reply...");
		$.ajax({
			type: "DELETE",
			url: `/replies/${replys_no}`,
			success : function(result, status, xhr){
				if(callback){
					//console.log(result);
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	//댓글 수정
	function update(reply, callback, error){
		console.log("modify reply...");
		$.ajax({
			type: "PUT",
			url: `/replies/${reply.replys_no}`,
			data: JSON.stringify(reply),
			contentType: "application/json;charset=utf-8",
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	//댓글 목록
	function getList(param, callback, error){
		var post_no = param.post_no;
		var page = param.page || 1;

		$.getJSON(`/replies/pages/${post_no}/${page}.json`, 
				function(data){
					if(callback){
						callback(data.replyCnt, data.list);
					}
		}).fail(function(xhr, status, er){
			if(error){
				error(er);
			}
		}); 
	}
	return {add : add, getList : getList, remove : remove, update : update};
})();


