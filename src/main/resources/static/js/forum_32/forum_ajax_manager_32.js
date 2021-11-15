/**
 * 
 */
$(document).ready(function() {
     
	// 管理員  置頂設定
	$("#insFlexCheckDefault").click(function() {
			var managerTitleKeyInput = $('.managerTitleKeyInput').val();
		if ($(this).prop("checked")) {
			$('.insTopArticle').val('top')
			$('.managerTitleKeyInput').val('【置頂】'+managerTitleKeyInput)
		} else {
			$('.insTopArticle').val('general')
		}
	});
	$(".editFlexCheckDefault").click(function() {
		alert('123')
		var editManagerTitleKeyInput = $('.editManagerTitleKeyInput').val();
		if ($(this).prop("checked")) {
			$('.editTopArticle').val('top');
			$('.editManagerTitleKeyInput').val('【置頂】'+editManagerTitleKeyInput)
		} else {
			$('.editTopArticle').val('general');
		}
	});

	// 管理員  編輯
	$('.updateDataBtn').click(function(e) {
		e.preventDefault();
		var dataid = $(this).data('id');
		$.ajax({
			type: "GET",
			url: "editManager",
			data: {
				"id": dataid
			},
			success: function(data) {
				$('#updid').val(dataid);
				$('#editesummernote').summernote('code', data['content']);
				$('.title-fontsize').val(data['title']);
				$('.userNickname').val(data['userNickname']);
				$('.userEmail').val(data['userEmail']);
				$('.userName').val(data['userName']);
				$('.picId').val(data['picId']);
				$('.editTopArticle').val(data['topArticle']);
				$('.editMessageQty').val(data['messageQty']);
				$('.editViewQty').val(data['viewQty']);
				$('.editLikeQty').val(data['likeQty']);
				if ($('.topArticle').val() == 'top') {
					$('.form-check-input').attr("checked", "checked");
				} else {
					$('.form-check-input').removeAttr("checked", "checked");
				}
				$("#flexCheckDefault").click(function() {
					if ($(this).prop("checked")) {
						$('.topArticle').val('top');
					} else {
						$('.topArticle').val('general');
					}
				});

				$('.updContentBody').on('mouseover', function() {
					$('#updTag').val($('#updSelectTag option:selected').text());
				});
				var date = new Date();
				const updFormatDate = (date) => {
					let updFormatted_date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "  " + date.getHours() + ":" + date.getMinutes();
					return updFormatted_date;
				}
				$('#nowUpdDate').val('最後修改 ' + updFormatDate(date));
			}
		})
	});

	$('.managerCrudBtn').click(function() {
		var messageForumId = $(this).parent().parent().find('.sorting_1').html();
		$.ajax({
			type: "get",
			url: "findAllMessage",
			data: { "id": messageForumId },
			success: function(datas) {
				$.ajax({
					type: "get",
					url: "getForumTitle",
					data: { "id": messageForumId },
					success: function(data) {
						$('.managerMessageTitle').html(data);
					}
				})
				$('#messageResult').html('');
				for (i = 0; i < datas.length; i++) {
					$('#messageResult').append(
						"<tr>" +
						"<td class='managerDelId'>" + datas[i]['messageId'] + "</td>" +
						"<td>" + datas[i]['messageUserName'] + "</td>" +
						"<td>" + datas[i]['messageUserEmail'] + "</td>" +
						"<td>" + datas[i]['messageContent'] + "</td>" +
						"<td>" + datas[i]['messageDate'] + "</td>" +
						"<td><button class='btn btn-primary managerDeleteBtn'>刪除</button></td>" +
						"</tr>"
					)
				}
				$('.managerDeleteBtn').click(function() {
					var delMessageId = $(this).parent().prev().prev().prev().prev().prev().html();
					$.ajax({
						type: "get",
						url: "deleteMessageById",
						data: { "id": delMessageId,
								"messageForumId":messageForumId},
						success: function() {
							Swal.fire({
								icon: 'success',
								title: '刪除留言成功',
								showConfirmButton: false,
								timer: 1500
							});
							$.ajax({
								type: "get",
								url: "findAllMessage",
								data:{"id":messageForumId},
								success: function(datas) {
									$('#messageResult').html('');
									for (i = 0; i < datas.length; i++) {
										$('#messageResult').append(
											"<tr>" +
											"<td class='managerDelId'>" + datas[i]['messageId'] + "</td>" +
											"<td>" + datas[i]['messageUserName'] + "</td>" +
											"<td>" + datas[i]['messageUserEmail'] + "</td>" +
											"<td>" + datas[i]['messageContent'] + "</td>" +
											"<td>" + datas[i]['messageDate'] + "</td>" +
											"<td><button class='btn btn-primary managerDeleteBtn'>刪除</button></td>" +
											"</tr>"
										)
									}
								}
							})
						}
					})
				})
				
			}
		})

	})
	$('.reportStatus').each(function(){
		if($(this).html()=='已完成'){
			$(this).next().html("<input type='button' value='復原' class='btn btn-warning retest'>")
		}
	})
	// 復原
	$('.retest').each(function(){
		$(this).click(function(){
			var reportId =$(this).parent().parent().find('.reportId').html();
			var messageId =$(this).parent().parent().find('.reportMessageId').html();
			$.ajax({
				type:"get",
				url:"retest",
				data:{
					"reportId":reportId,
					"messageId":messageId
				},
				success:function(){
					history.go(0);
				}
			})
		})
	})
	// 忽略
	$('.ignore').each(function() {
		$(this).click(function(){
			var reportId =$(this).parent().parent().find('.reportId').html();
			$.ajax({
				type:"get",
				url:"ignoreReprot",
				data:{
					"reportId":reportId
					},
				success:function(){
					history.go(0);
				}
			})
		})
	})
	// 警告
	$('.warning').each(function(){
		$(this).click(function(){
			var reportId =$(this).parent().parent().find('.reportId').html();
			var messageId =$(this).parent().parent().find('.reportMessageId').html();
			var userEmail =$(this).parent().parent().find('.reportedUserEmail').html();
			$.ajax({
				type:"get",
				url:"warning",
				data:{
					"reportId":reportId,
					"messageId":messageId,
					"userEmail":userEmail
				},
				success:function(){
					history.go(0);
				}
			})
		})
	})
	// 清除
	$('.clear').click(function(){
		$.ajax({
			type:"get",
			url:"clear",
			success:function(){
				history.go(0);
			}
		})
	})
  

});