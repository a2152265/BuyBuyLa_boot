/**
 * 
 */
       $('#summernote').summernote({
        placeholder: '請輸入內文',
        tabsize: 2,
        height: 200,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['insert', ['picture']]
        ]
      	
      });
      $('#summernote2').summernote({
        tabsize: 2,
        height: 200,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['insert', ['picture']]
        ]
      	
      });
      $('#insSubmit').on('click',function(){
      var markupStr = $('#summernote').summernote('code');
    	  $('.content').text(markupStr);
      })
      $('#updSubmit').on('click',function(){
      var markupStr = $('#summernote2').summernote('code');
    	  $('.updContent').text(markupStr);
      })