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
								"<input class='messageUserEmail' type='hidden' value='" + data[i]['messageUserEmail'] + "'>" +
								"<h5><a href='#' class='messageName'>" + data[i]['messageUserName'] + "</a></h5>" +
								"<p class='date'>" + data[i]['messageDate'] + "</p>" +
								"<p class='comment'>" + data[i]['messageContent'] + "</p>" +
								"</div>" +
								"</div>" +
								//
								"<div class='reply-btn' style='position:absolute;margin-left:300px'><a style='cursor:pointer;' class='btn-reply text-uppercase'>回覆</a></div>" +
								//
								"<div class='editBtn dropdown' style='visibility:hidden'>" +
								"<img  id='dropdownMenuButton1' data-bs-toggle='dropdown' style='cursor:pointer;width:30px;height:30px;' src='img/forum/more.png'>" +
								"<ul class='dropdown-menu' aria-labelledby='dropdownMenuButton1'>" +
								"<li><a class='dropdown-item reportMessageContent' style='cursor:pointer;' data-bs-toggle='modal' data-bs-target='#reportBtn'>檢舉</a></li>" +
								"<li><a class='dropdown-item editMessageContent' style='cursor:pointer;' data-bs-toggle='modal' data-bs-target='#editMessageBtn'>編輯</a></li>" +
								"<li><a class='dropdown-item delMessageContent' style='cursor:pointer;'>刪除</a></li></ul>" +
								"</div>" +
								"</div>" +
								"<input type='text' class='form-control mb-10' style='display:none;margin:10px 80px;width:400px;' placeholder='回覆" + data[i]['messageUserName'] + "........'>" +
								"</div>")
							$.ajax({
								type: "get",
								url: "getReply",
								async: false,
								data: { "messageId": data[i]['messageId'] },
								success: function(replyResult) {
									for (j = 0; j < replyResult.length; j++) {
										$('#messageResult').append(
											"<div class='comment-list left-padding editReplyDisplay' style='padding:20px;padding-top:0px;padding-left:100px'>" +
											"<div class='single-comment1 justify-content-between d-flex'>" +
											"<div class='user justify-content-between d-flex'>" +
											"<div class='thumb'>" +
											"<img style='width:40px; height:40px' src='getPicturefromMember/" + replyResult[j]['replyPicId'] + "'>" +
											"</div>" +
											"<div class='desc'>" +
											"<input class='replyId' type='hidden' value='" + replyResult[j]['replyId'] + "' >" +
											"<h5>" +
											"<a href='#' class='replyUserName'>" + replyResult[j]['replyUserName'] + "</a>" +
											"</h5>" +
											"<p class='date'>" + replyResult[j]['replyDate'] + "</p>" +
											"<p class='comment'>" +
											replyResult[j]['replyContent'] +
											"</p>" +
											"</div>" +
											"</div>" +
											"<div class='editReplyBtn dropdown' style='visibility:hidden'>" +
											"<img  id='dropdownMenuButton2' data-bs-toggle='dropdown' style='cursor:pointer;width:30px;height:30px;' src='img/forum/more.png'>" +
											"<ul class='dropdown-menu' aria-labelledby='dropdownMenuButton2'>" +
											"<li><a class='dropdown-item reportReplyMessageContent' style='cursor:pointer;' data-bs-toggle='modal' data-bs-target='#replyReportBtn'>檢舉</a></li>" +
											"<li><a class='dropdown-item editReplyMessageContent' style='cursor:pointer;' data-bs-toggle='modal' data-bs-target='#editReplyMessageBtn'>編輯</a></li>" +
											"<li><a class='dropdown-item delReplyMessageContent' style='cursor:pointer;'>刪除</a></li></ul>" +
											"</div>" +
											"</div>" +
											"</div>"
										)
									}
								}
							})
						}
						if ($('.loginUser').val() != '') {
							$('.editDisplay').each(function() {
								$(this).mouseover(function() {
									$(this).find('.editBtn').css('visibility', 'visible')
								})
								$(this).mouseout(function() {
									$(this).find('.editBtn').css('visibility', 'hidden')
								})
							})
						}
						if ($('.loginUser').val() != '') {
							$('.editReplyDisplay').each(function() {
								$(this).mouseover(function() {
									$(this).find('.editReplyBtn').css('visibility', 'visible')
								})
								$(this).mouseout(function() {
									$(this).find('.editReplyBtn').css('visibility', 'hidden')
								})
							})
						}
						$('.single-comment1').each(function() {
							var date = new Date();
							const nowReplyFormatDate = (date) => {
								let nowReplyFormatted_date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "  " + date.getHours() + ":" + date.getMinutes();
								return nowReplyFormatted_date;
							}
							// 登入的人
							var LoginUserName = $('.loginUser').val();
							// 發文的人
							var AuthorUserName = $('.authorUserName').html();
							var replyForumId = $('#id').val();
							var replyUserName = $(this).find('.replyUserName').html();
							var replyNowDate = nowReplyFormatDate(date);

							if (LoginUserName == '') {
								$('.editReplyBtn').css('display', 'none');
							}
							if ((LoginUserName == AuthorUserName) && (LoginUserName == replyUserName)) {
								$(this).find('.reportReplyMessageContent').css('display', 'none');
								$(this).find('.editReplyMessageContent').css('display', 'block');
								$(this).find('.delReplyMessageContent').css('display', 'block');
							}
							if ((LoginUserName == AuthorUserName) && (LoginUserName != replyUserName)) {
								$(this).find('.reportReplyMessageContent').css('display', 'block');
								$(this).find('.editReplyMessageContent').css('display', 'none');
								$(this).find('.delReplyMessageContent').css('display', 'block');
							}
							if ((LoginUserName != AuthorUserName) && (LoginUserName == replyUserName)) {
								$(this).find('.reportReplyMessageContent').css('display', 'none');
								$(this).find('.editReplyMessageContent').css('display', 'block');
								$(this).find('.delReplyMessageContent').css('display', 'block');
							}
							if ((LoginUserName != AuthorUserName) && (LoginUserName != replyUserName)) {
								$(this).find('.reportReplyMessageContent').css('display', 'block');
								$(this).find('.editReplyMessageContent').css('display', 'none');
								$(this).find('.delReplyMessageContent').css('display', 'none');
							}

							var reportReplyMessageContent = $(this).find('.reportReplyMessageContent');
							var editReplyMessageContent = $(this).find('.editReplyMessageContent');
							var delReplyMessageContent = $(this).find('.delReplyMessageContent');
							reportReplyMessageContent.click(function() {
								$('.reportedReplyContent').text($(this).parent().parent().parent().prev().find('.comment').html());
								$('.reportReplyDate').val(replyNowDate)
								$('.reportReplySelect').val($('#reportReptySelect option:selected').text());
								$('#reportReptySelect').change(function() {
									$('.reportReplySelect').val($('#reportReptySelect option:selected').text());
								})
								$('.reportReplyId').val($(this).parent().parent().parent().prev().find('.replyId').val());
								$('.reportReplyUserName').val(LoginUserName);
								$('.reportedReplyUserName').val($(this).parent().parent().parent().prev().find('.replyUserName').html())
								$('.reportedReplyUserEmail').val($(this).parent().parent().parent().prev().find('.replyUserEmail').val())
								$('.reportReplyMessageBtn').click(function() {
									$.ajax({
										type: "get",
										url: "reprotReplyMessage",
										data: {
											"reportReplyUserName": LoginUserName,
											"reportedReplyUserName": $('.reportedReplyUserName').val(),
											"reportedReplyContent": $('.reportedReplyContent').text(),
											"reportReplyForumId": replyForumId,
											"reportReplyMessageId": $('.reportReplyId').val(),
											"reportReplyReason": $('.reportReplySelect').val(),
											"reportReplyDate": $('.reportReplyDate').val(),
											"reportedReplyUserEmail": $('.reportedReplyUserEmail').val()
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
							editReplyMessageContent.click(function() {
								var replyId=$(this).parent().parent().parent().prev().find('.replyId').val();
								$.ajax({
									type:"get",
									url:"getReplyBean",
									data:{"replyId":replyId},
									success:function(result){
										$('.editReplyId').val(result['replyId'])
										$('.editMessageReplyId').val(result['messageReplyId'])
										$('.editReplyDate').val(nowReplyFormatDate(date))
										$('.editReplyForumId').val(result['replyForumId'])
										$('.editReplyIdentification').val('member')
										$('.editReplyPicId').val(result['replyPicId'])
										$('.editReplyUserName').val(result['replyUserName'])
										$('.editReplyUserEmail').val(result['replyUserEmail'])
										$('.editReplyContent').text(result['replyContent'])
										$('.editReplyyBtn').click(function(e){
											e.preventDefault();
											var replyDatas=$('#editReplyMsgForm').serializeArray();
											if($('.editReplyContent').val()==""){
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
												type:"post",
												url:"editReplyFin",
												data:replyDatas,
												success:function(){
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
							delReplyMessageContent.click(function() {
								var replyId = $(this).parent().parent().parent().prev().find('.replyId').val();
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
											url: 'deleteReplyMessage',
											data: {
												'id': replyId,
												"forumId": replyForumId
											},
											success: function() {
											}
										})
										setTimeout(function() { history.go(0) }, 1000);
									}
								})
							})
						})
						$('.single-comment').each(function() {
							var replyBtn = $(this).find('.reply-btn');
							var replyText = $(this).next();
							var messageReplyId = $(this).find('.messageId').val();
							var date = new Date();
							const nowFormatDate = (date) => {
								let nowFormatted_date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "  " + date.getHours() + ":" + date.getMinutes();
								return nowFormatted_date;
							}
							replyBtn.click(function() {
								if (replyText.css('display') == 'block') {
									replyText.css('display', 'none')
								} else if (replyText.css('display') == 'none') {
									replyText.css('display', 'block')
								}
							})
							replyText.keydown(function(e) {
								if (e.which == 13) {
									if (replyText.val() == '') {
										alert('請輸入內容')
									} else {
										$.ajax({
											type: "get",
											url: "addReplyMessage",
											data: {
												"messageReplyId": messageReplyId,
												"replyForumId": forumId,
												"replyDate": nowFormatDate(date),
												"replyContent": replyText.val(),
												"replyPicId": $('.loginId').val(),
												"replyUserName": loginUserName,
												"replyIdentification": $('.loginIdentification').val(),
												"replyUserEmail": $('.loginUserEmail').val()
											},
											success: function() {
												Swal.fire({
													icon: 'success',
													title: '回覆成功',
													showConfirmButton: false,
													timer: 1500
												})
												replyText.val('');
												replyText.css('display', 'none');
												$.ajax({
													type: "get",
													url: "message",
													data: {
														"id": forumId,
														"page": page
													},
													success: function(data) {
														showMessage(data);
													}
												})
											}
										})
									}
								}
							})

							var loginUserName = $('.loginUser').val();     //登入帳號
							var authorUserName = $('.authorUserName').html();   // 發文人
							var messageName = $(this).find('.messageName').html();  //   發表評論的人
							if (loginUserName == '') {
								$('.editBtn').css('display', 'none');
								$('.reply-btn').css('display', 'none');
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
								var reportedUserEmail = $(this).parent().parent().parent().prev().prev().find('.messageUserEmail').val();
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
								$('.reportedUserEmail').val(reportedUserEmail);
								$('.reportMessageBtn').click(function() {
									$.ajax({
										type: "get",
										url: "reprotMessage",
										data: {
											"reportForumId": forumId,
											"reportUserName": reportUserName,
											"reportedUserName": reportedUserName,
											"reportedContent": reportedContent,
											"reportMessageId": reportMessageId,
											"reportReason": $('.reportSelect').val(),
											"reportDate": $('.reportDate').val(),
											"reportedUserEmail": reportedUserEmail
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
												'forumId': forumId
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