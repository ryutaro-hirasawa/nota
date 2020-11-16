$(document).on('turbolinks:load', function() {
  $(function(){
    $(".fas.fa-arrow-circle-down").on("click", function() {
     $(this).next().slideToggle("fast");
    });
  });
});