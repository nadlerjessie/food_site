$(function(){
  // $(document).on('click', 'button.delete-proprtion-js', function() {
  //   debugger;
  // })
  function resetPlaceholder () {
    $('.quantity-input-js').attr("placeholder", 'Quantity')
  };

  // $(document).on('ajax:success', '.edit-proportion-js', function(e, data, status, xhr){
  //   $(this).parent().children('.proportion-js').html(data.template)
  //   $(this).addClass('hide')
  //   $(this).parent().children('.proportion-js').removeClass('hide')
  // })

  $(document).on('keypress', '.quantity-input-js', function(e) {
    if (e.which != 8 && e.which != 0 && e.which !='47' && e.which != '46' && e.which != '32' && (e.which < 48 || e.which > 57)) {
        $(this).attr("placeholder", 'Digits Only');
        setTimeout(resetPlaceholder, 1000);
               return false;
    }
  })

  $(document).on('ajax:success', '.edit-proportion-js', function(e, data, status, xhr){
    $('.proportion-show-partial-js').empty().append($(data.template))
  })

  $(document).on('dblclick', '.proportion-list-js', function() {
    $(this).children('.edit-proportion-js').removeClass('hide')
    $(this).children('.proportion-js').addClass('hide')
  })

})
