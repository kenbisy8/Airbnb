$(function(){
//ユーザー編集・ログアウトバナー
  $('.header__user').click(function(){
    $('#account-box').toggle();
  });

//flashメッセージ削除
  $('.ion-ios-close-empty').click(function(){
    $('.flash__box').fadeOut();
  });

//rooms#index slick
  $('.inn__container').slick({
    infinite: false,
    slidesToShow: 3,
    slidesToScroll: 1
  });

});
