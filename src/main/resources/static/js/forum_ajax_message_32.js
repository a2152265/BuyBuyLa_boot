/**
 * 		留言管理
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
							if ($('.messageBtn').html() == "登入後進行評論") {
								return false;
							}
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
								"<div class='comment-list editDisplay'>" +
								"<div class='single-comment justify-content-between d-flex'>" +
								"<div class='user justify-content-between d-flex'>" +
								"<div class='thumb'>" +
								"<img style='width: 80px; height: 80px' src='getPicturefromMember/" + data[i]['messagePicId'] + "'>" +
								"</div>" +
								"<div class='desc'>" +
								"<input class='messageId' type='hidden' value='" + data[i]['messageId'] + "'>" +
								"<h5><a href='#' class='messageName'>" + data[i]['messageUserName'] + "</a></h5>" +
								"<p class='date'>" + data[i]['messageDate'] + "</p>" +
								"<p class='comment'>" + data[i]['messageContent'] + "</p>" +
								"</div>" +
//								"<div class='reply-btn'><a style='cursor:pointer;' class='btn-reply text-uppercase'>回覆</a></div>"+
								"</div>" +
								"<div class='editBtn dropdown' style='display:none'>" +
								"<img  id='dropdownMenuButton1' data-bs-toggle='dropdown' style='cursor:pointer;width:30px;height:30px;' src='img/forum/more.png'>" +
								"<ul class='dropdown-menu' aria-labelledby='dropdownMenuButton1'>" +
								"<li><a class='dropdown-item reportMessageContent' style='cursor:pointer;' data-bs-toggle='modal' data-bs-target='#reportBtn'>檢舉</a></li>" +
								"<li><a class='dropdown-item editMessageContent' style='cursor:pointer;' data-bs-toggle='modal' data-bs-target='#editMessageBtn'>編輯</a></li>" +
								"<li><a class='dropdown-item delMessageContent' style='cursor:pointer;'>刪除</a></li></ul>" +
								"</div>" +
								"</div>" +
								"</div>" 

							)
						}
							if($('.loginUser').val()!=''){
						$('.editDisplay').each(function(){
							$(this).mouseover(function(){
								$(this).find('.editBtn').css('display','block')
							})
							$(this).mouseout(function(){
								$(this).find('.editBtn').css('display','none')
							})
						})
							}
						$('.single-comment').each(function() {
							var loginUserName = $('.loginUser').val();     //登入帳號
							var authorUserName = $('.authorUserName').html();   // 發文人
							var messageName = $(this).find('.messageName').html();  //   發表評論的人
							if (loginUserName == '') {
								$('.editBtn').css('display', 'none');
								$('.reply-btn').css('display','none');
							}
							if ((loginUserName == authorUserName) && (loginUserName == messageName)) {
								$(this).find('.reportMessageContent').css('display', 'none');
								$(this).find('.editMessageContent').css('display', 'block');
								$(this).find('.delMessageContent').css('display', 'block');
							}
							if ((loginUserName == authorUserName) && (loginUserName != messageName)) {
								$(this).find('.reportMessageContent').css('display', 'block');
								$(this).find('.editMessageContent').css('display', 'none');
								$(this).find('.delMessageContent').css('display', 'block');
							}
							if ((loginUserName != authorUserName) && (loginUserName == messageName)) {
								$(this).find('.reportMessageContent').css('display', 'none');
								$(this).find('.editMessageContent').css('display', 'block');
								$(this).find('.delMessageContent').css('display', 'block');
							}
							if ((loginUserName != authorUserName) && (loginUserName != messageName)) {
								$(this).find('.reportMessageContent').css('display', 'block');
								$(this).find('.editMessageContent').css('display', 'none');
								$(this).find('.delMessageContent').css('display', 'none');
							}
							
							// 檢舉留言
							var reprotBtn = $(this).find(".reportMessageContent");
							reprotBtn.click(function() {
								$('.reportSelect').val($('#reportSelect option:selected').text());
								$('#reportSelect').change(function() {
									$('.reportSelect').val($('#reportSelect option:selected').text());
								})
								var reportUserName = $('.loginUser').val();
								var reportedUserName = $(this).parent().parent().parent().parent().find('.user').find('.messageName').html();
								var reportedContent = $(this).parent().parent().parent().parent().find('.user').find('.comment').html();
								var reportMessageId = messageId;
								var date = new Date();
								const FormatDate = (date) => {
									let Formatted_date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "  " + date.getHours() + ":" + date.getMinutes();
									return Formatted_date;
								}
								$('.reportDate').val(FormatDate(date));
								$('.reportedContent').text(reportedContent);
								$('.reportUserName').val(reportUserName);
								$('.reportedUserName').val(reportedUserName);
								$('.reportMessageId').val(reportMessageId);
								$('.reportMessageBtn').click(function() {
									$.ajax({
										type: "get",
										url: "reprotMessage",
										data: {
											"reportForumId":forumId,
											"reportUserName": reportUserName,
											"reportedUserName": reportedUserName,
											"reportedContent": reportedContent,
											"reportMessageId": reportMessageId,
											"reportReason": $('.reportSelect').val(),
											"reportDate": $('.reportDate').val(),
											"reportedUserEmail":$('.reportedUserEmail').val()
										},
										success: function() {
											Swal.fire({
												icon: 'success',
												title: '感謝你提交檢舉',
												showConfirmButton: false,
												timer: 1000
											});
											setTimeout(function() { history.go(0) }, 1000);
										}

									})
								})
							})

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
										$('.editMessageDate').val('最後修改 ' + formatDate(date));
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
												'id': messageId,
												'forumId':forumId
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
	});

});