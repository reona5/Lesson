$(function(){
  $('#link-mark').on('click', function(){
    // 非同期でlikes#createに処理を送信＋その時にpost_idを渡す
    $.ajax({
      url: '/likes',
      type: 'POST',
      data: {post_id: $(this).data('post_id')}
    })
    // 処理に成功した際のボタン動作
    .done((data) => {
      if ($(this).text() === 'いいね！') {
        $(this).text('いいね！を取り消す').removeClass('btn-primary').addClass('btn-danger');
      } else if ($(this).text() === 'いいね！を取り消す！') {
        $(this).text('いいね！').removeClass('btn-danger').addClass('btn-primary');
      }
    })
    // 処理に失敗した際のアラート動作
    .fail((data) => {
      alert('いいね！に失敗しました');
    })
  });
});
