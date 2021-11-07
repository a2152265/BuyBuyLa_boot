/**
 * 
 */
$(document).ready(function() {
	var forumId = $('#id').val();
	var loginUserName = $('.loginUser').val();
	$.ajax({
		type: "get",
		url: "getLike",
		data: {
			"forumId": forumId,
			"loginUserName": loginUserName,
		},
		success: function(getLike) {
			if (getLike['status'] == true) {
				$('#likeImg').html('');
				$('#likeImg').append(
					"<img src='img/forum/like.png' class='like'>"
				)
			} else if (getLike['status'] == false) {
				$('#likeImg').html('');
				$('#likeImg').append(
					"<img src='img/forum/nolike.png' class='like'>"
				)
			} else{
				$('#likeImg').html('');
				$('#likeImg').append(
					"<img src='img/forum/nolike.png' class='like'>"
				)
			}
			$('#likeImg').click(function() {
				if (loginUserName == '') {
					alert('請先登入會員')
				}else{
					$.ajax({
						type:"get",
						url:"like",
						data:{
							"forumId":forumId,
							"loginUserName":loginUserName,
							"status":getLike['status']
						},
						success:function(result){
							if(result==true){
								$('#likeImg').html('');
								$('#likeImg').append(
									"<img src='img/forum/like.png' class='like'>"
								)
								getLike['status'] = true;
								var qty= $('#likeQty').html();
								$('#likeQty').html(parseInt(qty)+1);
							}else if ( result==false){
								$('#likeImg').html('');
								$('#likeImg').append(
									"<img src='img/forum/nolike.png' class='like'>"
								)
								getLike['status']=false;
								var qty= $('#likeQty').html();
								$('#likeQty').html(parseInt(qty)-1);
							}
						}
					})
					
				}
			})
		}
	})
	$.ajax({
		type:"get",
		url:"getLikeQty",
		data:{"forumId":forumId},
		success:function(qty){
			$('#likeQty').html('');
			$('#likeQty').html(qty);
		}
	})
})