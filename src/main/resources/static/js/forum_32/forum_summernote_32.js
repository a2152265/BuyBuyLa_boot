/**
 * 
 */
$('#summernote').summernote({
	placeholder: '請輸入內文',
	tabsize: 1,
	height: 200,
	toolbar: [
		['font', ['bold', 'underline', 'clear']],
		['color', ['color']],
		['insert', ['picture']],
		['view', ['codeview']]
	]

});

$('#insSubmit').on('click',  function() {
	var markupStr = $('#summernote').summernote('code');
	$('.content').text(markupStr);
	if($('#summernote').summernote('isEmpty')) {
		Swal.fire({
		  icon: 'error',
		  title: 'Oops...',
		  text: '請輸入內容!'
		})
	return false;
}
})
$('#updSubmit').on('click', function() {
	var markupStr = $('#summernote').summernote('code');
	$('.updContent').text(markupStr);
	if ($('#summernote').summernote('isEmpty')) {
		Swal.fire({
		  icon: 'error',
		  title: 'Oops...',
		  text: '請輸入內容!'
		})
		return false;
	}
})

$('#managerAddSummernote').summernote({
	placeholder: '請輸入內文',
	tabsize: 1,
	height: 200,
	toolbar: [
		['font', ['bold', 'underline', 'clear']],
		['color', ['color']],
		['insert', ['picture']],
		['view', ['codeview']]
	]

});
$('#managerInsSubmit').on('click', function() {
	var markupStr = $('#managerAddSummernote').summernote('code');
	$('.managerAddContent').text(markupStr);
	if ($('#managerAddSummernote').summernote('isEmpty')) {
		Swal.fire({
		  icon: 'error',
		  title: 'Oops...',
		  text: '請輸入內容!'
		})
		return false;
	}
})