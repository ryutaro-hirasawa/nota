$(document).on('turbolinks:load', function() {

  $(function () {
    $(".search_form_input").on("keyup", function () {
      let input = $(".search_form_input").val();
      console.log(input);
      $.ajax({
        type: 'GET',
        url: 'notes/search',
        data: { keyword: input },
        datatype: 'json'
      })
      .done(function (notes) {
        $(".appbanner").empty();
        if (notes.length !== 0) {
          notes.forEach(function (note) {
            appendNote(note);
          });
        }
        else {
          appendErrMsgToHTML("一致するノートがありません");
        }
      })
    });
  });
});