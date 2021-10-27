/**
 * 
 */
 	$(document).ready(function(){
		$('.updateDataClass').click(function(){
			var dataid=$(this).data('id');
			$.ajax({
				type:"GET",
				url:"editURL",
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
		$('.searchBtn').click(function(){
			var searchval=$('.searchText').val();
			$.ajax({
				type:"GET",
				url:"search",
				data:{"title":searchval},
				success:function(data){
					console.log(data);
				}
			})
		})
	});