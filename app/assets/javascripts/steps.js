$(function(){
  $(document).on('ajax:success', '.edit-step-js', function(e, data, status, xhr){
    debugger;
    $(this).parent().children('.step-js').html(data.template)
    $(this).addClass('hide')
    $(this).parent().children('.step-js').removeClass('hide')
  })

  $(document).on('dblclick', '.step-description-js', function() {
    $(this).children('.edit-step-js').removeClass('hide')
    $(this).children('.step-js').addClass('hide')
  })

  $(document).on('ajax:success', '.edit-step-js', function(e, data, status, xhr){
    debugger;
    $('.step-show-partial-js').empty().append($(data.template))
  })
})
