/**
 * 
 */
$(document).ready(function() {
	$('.updateDataClass').click(function() {
		var dataid = $(this).data('id');
		$.ajax({
			type: "GET",
			url: "editURL",
			data: {
				"id": dataid
			},
			success: function(data) {
				$('#updid').val(data['id']);
				$('#summernote').summernote('code', data['content']);
				$('.updTitle').val(data['title']);

				$('.updContentBody').on('mouseover', function() {
					$('#updTag').val($('#updSelectTag option:selected').text());
				});
				var date = new Date();
				const updFormatDate = (date) => {
					let updFormatted_date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "  " + date.getHours() + ":" + date.getMinutes();
					return updFormatted_date;
				}
				$('#nowUpdDate').val('最後修改'+updFormatDate(date));
			}
		})
	});
});