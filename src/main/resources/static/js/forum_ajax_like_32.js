/**
 * 
 */
$(document).ready(function() {
	var forumId = $('#id').val();
	var loginUserName = $('.loginUser').val();
	$.ajax({
		type: "get",
		url: "getStatus",
		data: {
			"forumId": forumId,
			"loginUserName": loginUserName,
		},
		success: function(status)  {
			$('.like').click(function() {
				if (loginUserName != '') {
					$.ajax({
						type: 'get',
						url: 'like',
						data: {
							"forumId": forumId,
							"loginUserName": loginUserName,
							"status": status
						},
						success: function() {
						}
					})
				}else{
					alert('請先登入會員')
				}
			})
		}
	})
})