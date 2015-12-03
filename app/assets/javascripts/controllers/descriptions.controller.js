$(function(){

  $('.add-description').on('click', function(event){
    event.preventDefault();

  var value = $('.description-item').last().data('description-id') + 1
  var html = "<div class='description-item' data-description-id=" + value + ">"
      html += $('.description-item').html();
      html += "</div>"    
      html = html.replace(/\d+/g, value)
  
    $('.descriptions-list').append(html);

  })

});
