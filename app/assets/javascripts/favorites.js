$(function(){
   $(document).on('click', '.favorite', function(){
   $(this).children().children().toggleClass('fa-heart fa-heart-o')
  })
})