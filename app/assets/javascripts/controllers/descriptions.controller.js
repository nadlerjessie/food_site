$(function(){

  $('.description-item').on("keypress", function(event) {
    return event.keyCode != 13;
  });
  
  $(document).on('click', '.add-description', function(event){
    event.preventDefault();

  var value = $('.description-item').last().data('description-id') + 1
  var html = "<div class='description-item' data-description-id=" + value + ">"
      html += $('.description-item').html();
      html += "</div>"
      html = html.replace(/\d+/g, value)

    $('.descriptions-list').append(html);


  })



});
