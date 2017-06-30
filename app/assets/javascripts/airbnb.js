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

//rooms#show right-contents
  $(window).on('load scroll resize', function(){
    var $right_contents = $('.details__contents__right')
    var top = $('.header').height() + 380;
    var bottom =  $('.footer').offset().top - 134;
    var content = $right_contents.height() + 170;
    var scroll = $(window).scrollTop();
    var x = $(window).width();
    var min_x = 1500;

    if((scroll + content) > bottom){
      $right_contents.css({
        'position': 'absolute',
        'top': bottom - content + 300
      });
    } else if(top < scroll){
        if(min_x > x){
          $right_contents.css({
            'position': 'absolute',
            'top': scroll + 150
          });
        } else {
          $right_contents.css({
            'position': '$right_contents',
            'top': '150px'
          });
        }
    } else {
      $right_contents.css({
        'position':'absolute',
        'top': top + 150
      });
    }
  });

});
