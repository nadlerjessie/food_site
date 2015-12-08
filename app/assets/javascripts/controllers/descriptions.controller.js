$(function(){

  $(document).on('click', '.add-description', function(event){
    event.preventDefault();

  var value = $('.description-item').last().data('description-id') + 1
  var html = "<div class='description-item' data-description-id=" + value + ">"
      html += $('.description-item').html();
      html += "</div>"
      html = html.replace(/\d+/g, value)

    $('.descriptions-list').append(html);

  })

  $(document).on("keypress", '.description-item' function(event) {
    debugger; 
    return event.keyCode != 13;
  });


});
