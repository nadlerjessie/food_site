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

});
