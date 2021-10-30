/**
 * 
 */
$(document).ready(function() {
	$('.messageBtn').click(function(e) {
		e.preventDefault();
		var datas = $("#addMsgForm").serializeArray();
		$.ajax({
			type:"POST",
			url:"addMessage",
			data:datas,
			success:function(){
				Swal.fire({
				  icon: 'success',
				  title: '新增留言成功',
				  showConfirmButton: false,
				  timer: 1000
				});
				function historyGo1(){
					history.go(0);
				}
				setTimeout(historyGo1,1000);
			}
		})
	});
});