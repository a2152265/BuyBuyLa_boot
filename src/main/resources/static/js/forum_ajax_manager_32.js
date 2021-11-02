/**
 * 
 */
$(document).ready(function() {
	$('.updateDataBtn').click(function(e)  
		{
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
});