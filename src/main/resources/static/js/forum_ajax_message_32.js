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
			var page = 0;
			$.ajax({
				type: "get",
				url: "message",
				data: {
					"id": forumId,
					"page": page
				},
				success: function(data) {
					$('.pages').text(page + 1);
					showMessage(data);
					$('.pageBtn').parent().eq(0).addClass("active");
					$('.pageBtn').click(function(e) {
						$(this).parent().addClass("active");
						$(this).parent().siblings().removeClass("active");
						e.preventDefault();
						var page = $(this).val() - 1;
						$('.pages').text(page + 1);
						$('#messageResult').html('');
						$.ajax({
							type: "get",
							url: "page",
							data: {
								"id": forumId,
								"page": page
							},
							success: function(data) {
								showMessage(data);
							}
						})
					})
					$('.leftBtn').click(function(e) {
						e.preventDefault();
						var page = $('.pages').text();
						if (page != 1) {
							$('.pages').text(parseInt(page) - 1);
						} else {
							return false;
						};
						var page = parseInt($('.pages').text());
						$('#messageResult').html('');
						$.ajax({
							type: "get",
							url: "pageLeft",
							data: {
								"id": forumId,
								"page": page - 1
							},
							success: function(data) {
								showMessage(data);
							}
						})
					})
					$('.rightBtn').click(function(e) {
						e.preventDefault();
						var page = $('.pages').text();
						var len = $('.pageBtn').length;
						if (page < len) {
							$('.pages').text(parseInt(page) + 1);
						} else {
							return false;
						};
						var page = parseInt($('.pages').text());
						$('#messageResult').html('');
						$.ajax({
							type: "get",
							url: "pageRight",
							data: {
								"id": forumId,
								"page": page - 1
							},
							success: function(data) {
								showMessage(data);
							}
						})
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
								timer: 1000
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
									timer: 1000
								});
								setTimeout(function() { history.go(0) }, 1000);
							}
						})
					});
					function showMessage(data) {
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
								"<input class='messageId' type='hidden' value='" + data[i]['messageId'] + "'>" +
								"<h5><a href='#' class='messageName'>" + data[i]['messageUserName'] + "</a></h5>" +
								"<p class='date'>" + data[i]['messageDate'] + "</p>" +
								"<p class='comment'>" + data[i]['messageContent'] + "</p>" +
								"</div>" +
								"</div>" +
								"<div class='editBtn dropdown'>" +
								"<img  id='dropdownMenuButton1' data-bs-toggle='dropdown' style='cursor:pointer;width:30px;height:30px;' src='https://cdn-icons.flaticon.com/png/512/2311/premium/2311523.png?token=exp=1635851763~hmac=dd6163c12d7c6a8d0b50bbea674800ac'>" +
								"<ul class='dropdown-menu' aria-labelledby='dropdownMenuButton1'>" +
								"<li><a class='dropdown-item editMessageContent' style='cursor:pointer;' data-bs-toggle='modal' data-bs-target='#editMessageBtn'>編輯</a></li>" +
								"<li><a class='dropdown-item delMessageContent' style='cursor:pointer;'>刪除</a></li></ul>" +
								"</div>" +
								"</div>" +
								"</div>"
							)
						}
						$('.single-comment').each(function(i, n) {
							var forumUserName = $('.Username').html();
							var loginUserName = $('.loginUser').val();
							var messageUserName = $('.messageUserName').val();
							var messageName = $(this).find('.messageName').html();
							if (messageName != messageUserName) {
								$(this).find('.editBtn').css('display', 'none');
							}
							if (forumUserName==loginUserName){
								$('.editBtn').css('display','block');
							}
							if (forumUserName!=messageName){
								$('.editMessageContent').css('display','none')
							}else{
								$('.editMessageContent').css('display','block')
							}
							
							var editBtn = $(this).find('.editMessageContent');
							var delBtn = $(this).find('.delMessageContent');
							var messageId = $(this).find('.messageId').val();
							editBtn.click(function() {
								$('.editMessageId').val(messageId);
								$.ajax({
									type: "get",
									url: "editMessage",
									data: { "id": messageId },
									success: function(data) {
										var date = new Date();
										const formatDate = (date) => {
											let formatted_date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes()
											return formatted_date;
										}
										$('.editMessageDate').val('最後修改 '+formatDate(date));
										$('.editMessageForumId').val(data['messageForumId']);
										$('.editMessageIdentification').val(data['messageIdentification']);
										$('.editMessagePicId').val(data['messagePicId']);
										$('.editMessageUserName').val(data['messageUserName']);
										$('.editMessageUserEmail').val(data['messageUserEmail']);
										$('.editMessageContent').val(data['messageContent']);

										$('.editMessageBtn').click(function(e) {
											e.preventDefault();
											var datas = $('#editMsgForm').serializeArray();
											if ($('.editMessageContent').val() == "") {
												Swal.fire({
													icon: 'error',
													title: '錯誤',
													text: '內容為空!',
													showConfirmButton: false,
													timer: 1000
												})
												return false;
											}
											$.ajax({
												type: "post",
												url: "editMessageFin",
												data: datas,
												success: function() {
													Swal.fire({
														icon: 'success',
														title: '修改留言成功',
														showConfirmButton: false,
														timer: 1000
													});
													setTimeout(function() { history.go(0) }, 1000);
												}
											})
										})
									}
								})
							})
							delBtn.click(function() {
								Swal.fire({
									title: '確定?',
									text: "你想要刪除這筆留言!",
									icon: 'warning',
									showCancelButton: true,
									confirmButtonColor: '#3085d6',
									cancelButtonColor: '#d33',
									confirmButtonText: '確定!'
								}).then((result) => {
									if (result.isConfirmed) {
										Swal.fire(
											'Deleted!',
											'刪除成功.',
											'success'
										)
										$.ajax({
											type: 'get',
											url: 'deleteMessage',
											data: {
												'id': messageId
											},
											success: function() {
											}
										})
										setTimeout(function() { history.go(0) }, 1000);
									}
								})
							})
						})
					}
				}
			})
		}
	})

});