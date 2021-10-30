/**
 * 
 */
$(document).ready(function() {
	$.ajax({
		type:"GET",
		url:"detailed",
		
	})
	
	$('.messageBtn').click(function(e) {
		e.preventDefault();
		var datas = $("#addMsgForm").serializeArray();
		if($('.messageContent').val()==""){
			Swal.fire({
			  icon: 'error',
			  title: '錯誤',
			  text: '內容為空!',
			  showConfirmButton: false,
			  timer: 2000
			})
			return false;
		}
		$.ajax({
			type:"POST",
			url:"addMessage",
			data:datas,
			success:function(){
				Swal.fire({
				  icon: 'success',
				  title: '新增留言成功',
				  showConfirmButton: false,
				  timer: 2000
				});
				function historyGo1(){
					history.go(0);
				}
				setTimeout(historyGo1,2000);
			}
		})
	});
});