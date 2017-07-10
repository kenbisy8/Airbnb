$(function(){

//ユーザー編集・ログアウトバナー
  var $account_box = $('#account-box')
  $(document).on('click', function(e) {
    if(!$(e.target).closest('.header__user').length){
      $account_box.hide();
    }
  });
  $('.header__user').click(function(){
    $account_box.show();
  });

//日記検索バナー
  var $header__diary = $('#header__diary')
  var $diary__box = $('.diary__box')
  var $diary__box__search = $('.diary__box__search')
  $(document).on('click', function(e) {
    if(!$(e.target).closest($header__diary).length){
      $diary__box.animate({width:"200"});
      $diary__box__search.animate({width:"150"})
      $diary__box.hide();
    };
  });
  $header__diary.click(function(){
    $diary__box.show();
    $diary__box.animate({width:"400px"}, 300)
    $diary__box__search.animate({width:"300"}, 300)
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
    };
  });
});
