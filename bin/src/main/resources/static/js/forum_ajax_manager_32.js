/**
 * 
 */
$(document).ready(function() {

	// 管理員  發起公告  置頂設定
	$("#insFlexCheckDefault").click(function() {
		if ($(this).prop("checked")) {
			$('.insTopArticle').val('top')
		} else {
			$('.insTopArticle').val('general')
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
				console.log(data['content']);
				$('#summernote').summernote('code', data['content']);
				$('.title-fontsize').val(data['title']);
				$('.userNickname').val(data['userNickname']);
				$('.userEmail').val(data['userEmail']);
				$('.userName').val(data['userName']);
				$('.picId').val(data['picId']);
				$('.topArticle').val(data['topArticle']);
				$('.editMessageQty').val(data['messageQty'])
				$('.editViewQty').val(data['viewQty'])

				if ($('.topArticle').val() == 'top') {
					$('.form-check-input').attr("checked", "checked");
				} else {
					$('.form-check-input').removeAttr("checked", "checked");
				}
				$("#flexCheckDefault").click(function() {
					if ($(this).prop("checked")) {
						$('.topArticle').val('top')
					} else {
						$('.topArticle').val('general')
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
				$('#nowUpdDate').val('最後修改' + updFormatDate(date));
			}
		})
	});

	$('.managerCrudBtn').click(function() {
		var messageForumId = $(this).parent().parent().find('.sorting_1').html()
		$.ajax({
			type: "get",
			url: "findAllMessage",
			data: { "id": messageForumId },
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
						"<td><button class='btn btn-primary managerDeleteBtn'>刪除</button></td>"+
						"</tr>"
					)
				}
				$('.managerDeleteBtn').click(function(){
					var delMessageId = $(this).parent().prev().prev().prev().prev().prev().html();
					$.ajax({
						type:"get",
						url:"deleteMessageById",
						data:{"id":delMessageId},
						success:function(){
								Swal.fire({
									icon: 'success',
									title: '刪除留言成功',
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

});