$(document).on('turbolinks:load', function() {
  $(function(){
    $("#main_left_acmenu dt").on("click", function() {
     $(this).next().slideToggle("fast");
    });
  });
});