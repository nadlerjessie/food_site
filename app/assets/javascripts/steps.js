$(function(){
   $(document).on('ajax:success', '.edit_step', function(e, data, status, xhr){
   $(this).parent().children('.step-js').html(data.template)
  })
})
