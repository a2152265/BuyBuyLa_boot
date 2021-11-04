/**
 * 
 */
$(document).ready(function() {
	$('.updateDataClass').click(function() {
		var dataid = $(this).data('id');
		$.ajax({
			type: "GET",
			url: "editIntoVal",
			data: {
				"id": dataid
			},
			success: function(data) {
				$('#updid').val(data['id']);
				$('#summernote').summernote('code', data['content']);
				$('.title-fontsize').val(data['title']);

				$('.updContentBody').on('mouseover', function() {
					$('#updTag').val($('#updSelectTag option:selected').text());
				});
				var date = new Date();
				const updFormatDate = (date) => {
					let updFormatted_date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "  " + date.getHours() + ":" + date.getMinutes();
					return updFormatted_date;
				}
				$('#nowUpdDate').val('最後修改 '+updFormatDate(date));
			}
		})
	});
	$('.new').click(function(){
		alert('new');
	})
	$('.hot').click(function(){
		alert('hot');
	})
	$('.addViewQty').click(function(){
		var id=$(this).attr("id");
		$.ajax({
			type:"get",
			url:"addViewQty",
			data:{"id":id},
			success:function(){
				
			}
		})
	})
});