/**
 * 
 */
$(document).ready(function() {


	// 熱門文章
	$.ajax({
		type: "get",
		url: "getHotArticles",
		success: function(result) {
			for (i = 0; i < result.length; i++) {
				$('#hotArticles').append(
					"<div class='media post_item'>" +
					"<img width='50' src='getPicturefromMember/" + result[i]['picId'] + "'>" +
					"<div class='media-body'>" +
					"<a href='detailed?id=" + result[i]['id'] + "'>" +
					"<h3>" + result[i]['title'] + "</h3></a>" +
					"<p>" + result[i]['date'] + "</p>" +
					"</div></div>")
			}
		}
	})
	// 最新帖子
	$.ajax({
		type: "get",
		url: "getNewArticles",
		success: function(result) {
			for (i = 0; i < result.length; i++) {
				$('#newArticles').append(
					"<div class='media post_item'>" +
					"<img width='50' src='getPicturefromMember/" + result[i]['picId'] + "'>" +
					"<div class='media-body'>" +
					"<a href='detailed?id=" + result[i]['id'] + "'>" +
					"<h3>" + result[i]['title'] + "</h3></a>" +
					"<p>" + result[i]['date'] + "</p>" +
					"</div></div>")
			}
		}
	})

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
				$('#nowUpdDate').val('最後修改 ' + updFormatDate(date));
			}
		})
	});
	$('.addViewQty').click(function() {
		var id = $(this).attr("id");
		$.ajax({
			type: "get",
			url: "addViewQty",
			data: { "id": id },
			success: function() {

			}
		})
	})
});