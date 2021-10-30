/**
 * 
 */
$(document).ready(function() {
		var forumId=$('#id').val();
		$.ajax({
			type:"GET",
			url:"detailed",
			data:{
				"id":forumId
			},
			success:function(){
				$.ajax({
					type:"get",
					url:"message",
					data:{
						"id":forumId
						},
					success:function(data){
						console.log(data);
						console.log(data.length);
					}
				})
			}
		})
		
	$('.messageBtn').click(function(e) {
		e.preventDefault();
		var datas = $("#addMsgForm").serializeArray();
		if ($('.messageContent').val() == "") {
			Swal.fire({
				icon: 'error',
				title: '錯誤',
				text: '內容為空!',
				showConfirmButton: false,
				timer: 1500
			})
			return false;
		}
		$.ajax({
			type: "POST",
			url: "addMessage",
			data: datas,
			success: function() {
				Swal.fire({
					icon: 'success',
					title: '新增留言成功',
					showConfirmButton: false,
					timer: 1500
				});
				function historyGo1() {
					history.go(0);
				}
				setTimeout(historyGo1, 1500);
			}
		})
	});
});