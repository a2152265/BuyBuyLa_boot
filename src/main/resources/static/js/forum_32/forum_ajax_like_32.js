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
			"loginUserName": loginUserName
		},
		success: function(getLike) {
			if (getLike['status'] == true) {
				$('#likeImg').html('');
				$('#likeImg').append("<img src='img/forum/like.png' class='like'>")
			} else if (getLike['status'] == false) {
				$('#likeImg').html('');
				$('#likeImg').append("<img src='img/forum/nolike.png' class='like'>");
			} else {
				$('#likeImg').html('');
				$('#likeImg').append("<img src='img/forum/nolike.png' class='like'>");
			}
			$('#likeImg').click(function() {
				if (loginUserName == '') {
					Swal.fire({
						title: '目前為訪客身分',
						showCancelButton: true,
						confirmButtonText: '登入'
					}).then((result) => {
						if (result.isConfirmed) {
							window.location.href ="try/login";
						} 
					})
				} else {
					$.ajax({
						type: "get",
						url: "like",
						data: {
							"forumId": forumId,
							"loginUserName": loginUserName,
							"loginId": $('.loginId').val(),
							"status": getLike['status']
						},
						success: function(result) {
							if (result == true) {
								$('#likeImg').html('');
								$('#likeImg').append("<img src='img/forum/like.png' class='like'>");
								getLike['status'] = true;
								$.ajax({
									type: "get",
									url: "getLikeQty",
									data: { "forumId": forumId },
									success: function(qty) {
										$('#likeQty').html('');
										$('#likeQty').html("<span class='displayLikeUser aria-expanded='false' dropdown-toggle' data-bs-toggle='dropdown' style='cursor:pointer'>" + qty + "</span>" +
											"<ul class='dropdown-menu userLikeList'>" + "</ul>");

										$('.displayLikeUser').click(function() {
											$.ajax({
												type: "get",
												url: "displayUserLike",
												data: { "forumId": forumId },
												success: function(result) {
													$('.userLikeList').html('');
													for (i = 0; i < result.length; i++) {
														$('.userLikeList').append(
															"<li style='margin:10px 10px'><img style='width:20px;height:20px;border-radius:50%;margin-right:10px' src='getPicturefromMember/" + result[i]['loginId'] + "'>" + result[i]['loginUserName'] + "</li>"
														);
													}
												}
											})
										})
									}
								})
							} else if (result == false) {
								$('#likeImg').html('');
								$('#likeImg').append("<img src='img/forum/nolike.png' class='like'>");
								getLike['status'] = false;
								$.ajax({
									type: "get",
									url: "getLikeQty",
									data: { "forumId": forumId },
									success: function(qty) {
										$('#likeQty').html('');
										$('#likeQty').html("<span class='displayLikeUser aria-expanded='false' dropdown-toggle' data-bs-toggle='dropdown' style='cursor:pointer'>" + qty + "</span>" +
											"<ul class='dropdown-menu userLikeList'></ul>");
										$('.displayLikeUser').click(function() {
											$.ajax({
												type: "get",
												url: "displayUserLike",
												data: { "forumId": forumId },
												success: function(result) {
													$('.userLikeList').html('');
													for (i = 0; i < result.length; i++) {
														$('.userLikeList').append(
															"<li style='margin:10px 10px'><img style='width:20px;height:20px;border-radius:50%;margin-right:10px' src='getPicturefromMember/" + result[i]['loginId'] + "'>" + result[i]['loginUserName'] + "</li>"
														);
													}
												}
											})
										})
									}
								})
							}
						}
					})

				}
			})
		}
	})
	$.ajax({
		type: "get",
		url: "getLikeQty",
		data: { "forumId": forumId },
		success: function(qty) {
			$('#likeQty').html('');
			$('#likeQty').html("<span class='displayLikeUser aria-expanded='false' dropdown-toggle' data-bs-toggle='dropdown' style='cursor:pointer'>" + (parseInt(qty)) + "</span>" +
				"<ul class='dropdown-menu userLikeList'></ul>");

			$('.displayLikeUser').click(function() {
				$.ajax({
					type: "get",
					url: "displayUserLike",
					data: { "forumId": forumId },
					success: function(result) {
						$('.userLikeList').html('');
						for (i = 0; i < result.length; i++) {
							$('.userLikeList').append(
								"<li style='margin:10px 10px'><img style='width:20px;height:20px;border-radius:50%;margin-right:10px' src='getPicturefromMember/" + result[i]['loginId'] + "'>" + result[i]['loginUserName'] + "</li>"
							);
						}
					}
				})
			})
		}
	})
})