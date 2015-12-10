$(document).ready(function(){
  $(document).on('ajax:success', '.edit-recipe-js', function(e, data, status, xhr){
    $(this).parent().children('.recipe-name-js').html(data.template)
    $(this).addClass('hide')
    $(this).next().removeClass('hide')
  });

  $(document).on('dblclick', '.recipe-name-js', function() {
    $(this).addClass('hide')
    $(this).next().removeClass('hide')
  });

})
