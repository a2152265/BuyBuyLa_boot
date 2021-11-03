/**
 * 
 */
$(function() {
	// 發起討論
	var previousfail=$('.previousFail').html();
	var afterFail=$('.afterFail').html();
	if(previousfail=='previousFail'){
		$('.previousBlock').css('visibility','hidden');
	}
	if(afterFail=='afterFail'){
		$('.afterBlock').css('visibility','hidden');
	}
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
	var loginUser = $('.loginUser').val();
	var forumUsername = $('.Username').html();
	if(loginUser!=forumUsername){
		 $(".editIMG").css("visibility","hidden");
//		 console.log("loginUser="+loginUser+" forumUsername="+forumUsername+" css="+"hidden")
	}else{
		$(".editIMG").css("visibility","visible");
//		console.log("loginUser="+loginUser+" forumUsername="+forumUsername+" css="+"visible")
	}
	
	if($('.loginsession').html()==null){
		$('.addNewForum').css('display','none')
		$('.newFoRuM').attr("disabled","disabled");
		$('.newFoRuM').css("background","gray");
		$('.messageContentBlock').css('display','none');
		$('.messageBtn').html('登入後進行評論');
//		$('.messageBtn').css({"background":"gray"});
		$('.messageContent').attr("disabled","disabled");
		$('.newMessageH4').css('display','none');
		$('.messageBtn').click(function(){
			alert('123')
		})
	}
	

})