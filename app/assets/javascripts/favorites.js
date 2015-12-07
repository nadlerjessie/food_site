$(function(){
   $(document).on('click', '.favorite', function(){
   $(this).children().children().children().toggleClass('fa-heart fa-heart-o')
  })
})