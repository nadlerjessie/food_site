$(function(){

  $('.add-proportion').on('click', function(event){
    event.preventDefault();

  var value = $('.proportion-item').last().data('proportion-id') + 1
  var html = "<div class='proportion-item' data-proportion-id=" + value + ">"
      html += $('.proportion-item').html();
      html += "</div>"    
      html = html.replace(/\d+/g, value)
  
    $('.proportions-list').append(html);

  })

  $(document).on('ajax:success', '.add-proportion-from-show-js', function(e, data, status, xhr){
    var quantity = data.quantity;
    var unit = data.unit;
    var ingredient = data.ingredient;
    var cloned_proportion = $('.proportion-js').clone().get(0);
    var proportion_html = data.quantity + " " + data.unit + " " + data.ingredient
    var new_proportion = "<ul class='proportion-list-js'><div class='proportion-js'><li>" + proportion_html + "</li></div></ul>"
    $('.proportion-show-partial-js').append($(new_proportion));
    var form_fields = $('.add-proportion-from-show-js').find('input:text');
    form_fields.first().val("")
    $(form_fields.get(1)).val("")
    form_fields.last().val("")

    // var proportion_html = $(cloned_proportion).find('li').text(data.quantity + " " + data.unit + " " + data.ingredient);
  });
});


