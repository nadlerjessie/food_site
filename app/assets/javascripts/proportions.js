$(function(){
  $(document).on('click', 'button.delete-proprtion-js', function() {
    debugger;
  })

  $(document).on('ajax:success', '.edit-proportion-js', function(e, data, status, xhr){
    $(this).parent().children('.proportion-js').html(data.template)
    $(this).addClass('hide')
    $(this).parent().children('.proportion-js').removeClass('hide')
  })

  

  $(document).on('dblclick', '.proportion-list-js', function() {
    $(this).children('.edit-proportion-js').removeClass('hide')
    $(this).children('.proportion-js').addClass('hide')
  })

  
})
