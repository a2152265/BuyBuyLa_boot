/**
 * 
 */
       $('#summernote').summernote({
        placeholder: '請輸入內文',
        tabsize: 1,
        height: 350,
        toolbar: [
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['insert', ['picture']]
        ]
      	
      });
      $('#insSubmit').on('click',function(){
      var markupStr = $('#summernote').summernote('code');
    	  $('.content').text(markupStr);
      if ($('#summernote').summernote('isEmpty')) {
		 alert('內容為空');
		 return false;
	  }
      })
      $('#updSubmit').on('click',function(){
      var markupStr = $('#summernote').summernote('code');
    	  $('.updContent').text(markupStr);
      if ($('#summernote').summernote('isEmpty')) {
		 alert('內容為空');
		 return false;
	  }
      })