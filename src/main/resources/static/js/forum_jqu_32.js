/**
 * 
 */
$(function() {
	// 新增
	$("#insImgBtn").change(function() {
		var readFile = new FileReader();
		var mfile = $("#insImgBtn")[0].files[0];
		readFile.readAsDataURL(mfile);
		readFile.onload = function() {
			var img = $("#insImgshow");
			img.attr("src", this.result);
		}
	})
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
	// 修改
	$("#updImgBtn").change(function() {
		var readFile = new FileReader();
		var mfile = $("#updImgBtn")[0].files[0];
		readFile.readAsDataURL(mfile);
		readFile.onload = function() {
			var img = $("#updImgshow");
			img.attr("src", this.result);
		}
	})
	$('.updContentBody').on('mouseover', function() {
		$('#updTag').val($('#updSelectTag option:selected').text());
	});
	var date = new Date();
	const updFormatDate = (date) => {
		let updFormatted_date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "  " + date.getHours() + ":" + date.getMinutes();
		return updFormatted_date;
	}
	$('#nowUpdDate').val(updFormatDate(date));
	var f1 = $('.forumUsername').val();
	var f2 = $('.forumUsername2').html();
	if(f1!=f2){
		 $(".editIMG").css("display","none");
	}
	if($('.loginsession').html()==null){
		$('.newFoRuM').attr("disabled","disabled");
		$('.newFoRuM').css("background","gray");
		$('.newMessaGe').attr("disabled","disabled");
		$('.newMessaGe').css("background","gray");
	}
	console.log($('.adm').html())
})