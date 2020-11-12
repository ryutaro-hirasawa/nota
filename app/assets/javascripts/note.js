$(document).on('turbolinks:load', function() {
  $(function(){
    //DataTransferオブジェクトで、データを格納する箱を作る
    let dataBox = new DataTransfer();
    //querySelectorでfile_fieldを取得
    let file_field = document.querySelector('input[type=file]')
    //fileが選択された時に発火するイベント
    $('#img-file').change(function(){
      //選択したfileのオブジェクトをpropで取得
      let files = $('input[type="file"]').prop('files')[0];
      $.each(this.files, function(i, file){
        //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
        let fileReader = new FileReader();

        //DataTransferオブジェクトに対して、fileを追加
        dataBox.items.add(file)
        //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
        file_field.files = dataBox.files

        let num = $('.note-image').length + 1 + i
        fileReader.readAsDataURL(file);
        //画像が4枚になったら超えたらドロップボックスを削除する
        if (num == 4){
          $('.fas.fa-camera').css('display', 'none')
        }
        //読み込みが完了すると、srcにfileのURLを格納
        fileReader.onloadend = function() {
          let src = fileReader.result
          let html= `<div class='note-image' data-image="${file.name}">
                      <div class=' note-image__content'>
                        <div class='note-image__content--icon'>
                          <img src=${src} width="114" height="80" >
                        </div>
                      </div>
                      <div class='note-image__operetion'>
                        <div class='note-image__operetion--delete'>削除</div>
                      </div>
                    </div>`
          //image_box__container要素の前にhtmlを差し込む
          $('#image-box__container').before(html);
        };
        //image-box__containerのクラスを変更し、CSSでドロップボックスの大きさを変えてやる。
        $('#image-box__container').attr('class', `note-num-${num}`)
      });
      //削除ボタンをクリックすると発火するイベント
      $(document).on("click", '.note-image__operetion--delete', function(){
        //削除を押されたプレビュー要素を取得
        let target_image = $(this).parent().parent()
        //削除を押されたプレビューimageのfile名を取得
        let target_name = $(target_image).data('image')
        //プレビューがひとつだけの場合、file_fieldをクリア
        if(file_field.files.length==1){
          //inputタグに入ったファイルを削除
          $('input[type=file]').val(null)
          dataBox.clearData();
        }else{
          //プレビューが複数の場合
          $.each(file_field.files, function(i,input){
            //削除を押された要素と一致した時、index番号に基づいてdataBoxに格納された要素を削除する
            if(input.name==target_name){
              dataBox.items.remove(i)
            }
          })
          //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
          file_field.files = dataBox.files
        }
        //プレビューを削除
        target_image.remove()
        //image-box__containerクラスをもつdivタグのクラスを削除のたびに変更
        let num = $('.note-image').length
        $('#image-box__container').show()
        $('#image-box__container').attr('class', `note-num-${num}`)
      })
    });
  });
});