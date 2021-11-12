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
	
	$('.serachText').bind('input propertychange',function(e){
		e.preventDefault();
		$.ajax({
			type:"get",
			url:"searchText",
			data:{"searchText":$('.serachText').val()},
			success:function(result){
				$('#browsers').empty();
				for(i=0;i<result.length;i++){
				$('#browsers').append("<option value='"+result[i]['userName']+"'>")
				}
			}
		})
	})
	$('.searchBtn').click(function(){
		var searchText=$('.serachText').val();
		$.ajax({
			type:"get",
			url:"getSearchTextList",
			data:{"searchText":searchText},
			success:function(datas){
				$('.allArticles').html('');
				$('.allArticles').append(
				"<ol class='breadcrumb'><li class='breadcrumb-item active' aria-current='page'>搜尋有關"+searchText+"的結果</li></ol>"+
				"<br>");
				for(i=0;i<datas.length;i++){
					$('.allArticles').append(
					"<article class='row blog_item bg-light' style='margin: 0px'><div class='col-md-12'><div class='blog_post'><div class='blog_details' style='margin-left: 20px'>"+
					"<div><img style='float: left; width: 40px; height: 40px; border-radius: 50%' src='getPicturefromMember/"+datas[i]['picId']+"'><span style='margin-left: 15px'>"+datas[i]['userName']+"<br>"+
					"<span style='margin-left: 15px; font-size: 13px; color: gray;'>"+datas[i]['date']+"</span></span></div>"+
					"<div><a href='detailed?id="+datas[i]['id']+"' ><h2>"+datas[i]['title']+"</h2></a>"+
					"<div class='box'><div class='ellipsis'>"+datas[i]['content']+"</div></div>"+
					"<a style='margin-left: 300px;' class='button button-blog addViewQty' id='"+datas[i]['id']+"' href='detailed?id="+datas[i]['id']+"' >View More</a>"+
					"</div><br> "+
					"<span style='color: #00BFA5; font-size: 14px'>"+datas[i]['tag']+"</span>"+
					"<span><a><img style='width: 15px; margin-left: 300px' src='img/forum/likeView.png'>"+
					"<span style='font-size: 14px; margin-left: 0px;'>"+datas[i]['likeQty']+" Likes</span></a></span>"+
					"<span><a><img style='width: 15px; margin-left: 10px' src='img/forum/speech-bubble.png'>"+
					"<span style='font-size: 14px; margin-left: 5px;'>"+datas[i]['messageQty']+" Comments</span></a></span>"+
					"<span><a><img style='width: 15px; margin-left: 10px' src='img/forum/eye.png'>"+
					"<span style='font-size: 14px; margin-left: 5px;'>"+datas[i]['viewQty']+" Views</span></a></span>"+
					"<hr></div></div></div></div></div></article>"
					)
				}
			}
		})
	})
});