/**
 * 
 */
 $(document).ready(function(){
	$('.DetailedMessageKeyInput').click(function(){
		$('.messageContent').val('test');
	})
	
	$('.DetailedEditMessageKeyInput').click(function(){
	var editMessageContent = $('.editMessageContent').val();
	$('.editMessageContent').val('( 修改 ) '+editMessageContent);
	})
	$('.addNewForumKeyInput').click(function(){
		$('.titleKeyInput').val('test');
		$('#summernote').summernote('code', 'test');
	})
	
})