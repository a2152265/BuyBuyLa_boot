/**
 * 
 */
$(function() {
	// 發起討論
	$('.insContentBody').on('mouseover', function() {
		$('#insTag').val($('#insSelectTag option:selected').text())
	})
	var date = new Date();
	const formatDate = (date) => {
		let formatted_date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes()
		return formatted_date;
	}
	$('#nowDate').val(formatDate(date))
	$('#messageDate').val(formatDate(date))

	// 判斷登入狀態
	// 訪客不能發起討論  留言
	var f1 = $('.forumUsername').val();
	var f2 = $('.forumUsername2').html();
	if(f1!=f2){
		 $(".editIMG").css("display","none");
	}
	if($('.loginsession').html()==null){
		$('.newFoRuM').attr("disabled","disabled");
		$('.newFoRuM').css("background","gray");
		$('.messageBtn').attr("disabled","disabled");
		$('.messageBtn').css("background","gray");
	}
	$('.reply').on('click',function(){
		console.log($('.desc').html())
	})
})