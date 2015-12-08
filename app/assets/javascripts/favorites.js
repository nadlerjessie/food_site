$(function(){
  $(document).on('ajax:success', '.favorite', function(e, data, status, xhr){
    $('.favorites-js').html(data.template) 
  })
})