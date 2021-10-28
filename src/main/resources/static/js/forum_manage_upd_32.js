/**
 * 
 */
 	$(document).ready(function(){
		$('.updateDataClass').click(function(){
			var dataid=$(this).data('id');
			console.log(dataid)
			$.ajax({
				type:"GET",
				url:"editManager",
				data:{
					"id":dataid
				},
				success:function(data){
					var content = data['content'];
					var title = data['title']
					$('.updTitle').val(title);
					$('#summernote2').summernote('code', content);
					$('#updid').val(data['id']);
				}
			})
		});
	});