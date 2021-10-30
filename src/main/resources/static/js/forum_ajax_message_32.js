/**
 * 
 */
$(document).ready(function() {
	var forumId = $('#id').val();
	$.ajax({
		type: "GET",
		url: "detailed",
		data: {
			"id": forumId
		},
		success: function() {
			$.ajax({
				type: "get",
				url: "message",
				data: {
					"id": forumId
				},
				success: function(data) {
					$('#messageResult').html('');
					for (i = 0; i < data.length; i++) {
						$('#messageResult').append(
							"<div class='comment-list'>" +
							"<div class='single-comment justify-content-between d-flex'>" +
							"<div class='user justify-content-between d-flex'>" +
							"<div class='thumb'>" +
							"<img style='width: 100px; height: 100px' src='/BuyBuyla_boot/getPicturefromMember/" + data[i]['messagePicId'] + "'>" +
							"</div>" +
							"<div class='desc'>" +
							"<h5><a href='#'>" + data[i]['messageUserName'] + "</a></h5>" +
							"<p class='date'>" + data[i]['messageDate'] + "</p>" +
							"<p class='comment'>" + data[i]['messageContent'] + "</p>" +
							"</div>" + "</div>" +
							"<div class='reply-btn'>" +
							"<a href='#reply'>" +
							"<button style='border: none;' class='btn-reply text-uppercase reply'>回復</button>" +
							"</a>" +
							"</div>" + "</div>" + "</div>"
						)
					}
					$('.pageBtn').click(function(e) {
						e.preventDefault();
						var page = $(this).val();
						$('#messageResult').html('');
						$.ajax({
							type: "get",
							url: "page",
							data: {
								"id": forumId,
								"page": page
							},
							success: function(data) {
								for (i = 0; i < data.length; i++) {
									$('#messageResult').append(
										"<div class='comment-list'>" +
										"<div class='single-comment justify-content-between d-flex'>" +
										"<div class='user justify-content-between d-flex'>" +
										"<div class='thumb'>" +
										"<img style='width: 100px; height: 100px' src='/BuyBuyla_boot/getPicturefromMember/" + data[i]['messagePicId'] + "'>" +
										"</div>" +
										"<div class='desc'>" +
										"<h5><a href='#'>" + data[i]['messageUserName'] + "</a></h5>" +
										"<p class='date'>" + data[i]['messageDate'] + "</p>" +
										"<p class='comment'>" + data[i]['messageContent'] + "</p>" +
										"</div>" + "</div>" +
										"<div class='reply-btn'>" +
										"<a href='#reply'>" +
										"<button style='border: none;' class='btn-reply text-uppercase reply'>回復</button>" +
										"</a>" +
										"</div>" + "</div>" + "</div>"
									)
								}
							}
						})
					})
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