$(document).ready(function(){
  setTimeout(function(){
    $('.alert').remove();
  }, 3000);
});

$(document).ready(function(){
  $(document).on('click', 'tr[data-link]', function(){
    window.location = $(this).data("link")
  });
});
