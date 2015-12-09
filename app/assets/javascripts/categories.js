$(document).ready(function() {
  // categories-checkboxs.val()
  $('input:checkbox').change(function(){
    // $('.photo-grid').hide();
    $('input:checkbox:not(:checked)').each(function(index, not_checked){
      debugger;
      $('li').filter(not_checked.value).hide()
      //return $(this).val()
    })
  })
});