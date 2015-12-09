$(document).ready(function() {

  $('input:checkbox').change(function(){
    if ($('input:checkbox:checked').length == 0) {
      $('.photo-grid li').show();
      console.log($('.photo-grid li:visible').length)
    }
    else {
      $('.photo-grid li').hide();
      var checked = $('input:checkbox:checked').map(function(index, checked){
        return "." + checked.value;
      });

      $.each(checked, function(index, category_id){
        $('li').filter(category_id).show();
      });
      console.log($('.photo-grid li:visible').length)
    };
  });

});
