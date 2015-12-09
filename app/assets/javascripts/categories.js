$(document).ready(function() {
  // categories-checkboxs.val()

  $('input:checkbox').change(function(){
    // displays all (hidden) recipies 
    $('.photo-grid li').hide();
    // $('input:checkbox:not(:checked)').each(function(index, not_checked){
    //   debugger;
      // $('li').filter(not_checked.value).hide()
      // //return $(this).val()
    var checked = $('input:checkbox:checked').map(function(index, checked){
      return "." + checked.value
    })

    $.each(checked, function(id){
      $('li').filter(id).show();
    })


    // $('input:checkbox:checked').each(function() {
    //   $('li').filter("." + $(this).val()).show();
    // });

  })
});
