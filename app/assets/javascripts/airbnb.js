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
      $('.header__diary__search').remove();
      $('.diary__box__search').val("");
    };
  });
  $header__diary.click(function(){
    $diary__box.show();
    $diary__box.animate({width:"400px"}, 300)
    $diary__box__search.animate({width:"300"}, 300)
  });


//日記検索インクリメンタルサーチ
  function searchDiary() {
    var $incremental = $('#incremental-search-wrapper')
    var $incrementalResult = $('.header__diary__search')
    var resultNone = '<div id="incremental-no-result">一致するものがありません'
    var input = $('.diary__box__search').val();

    function insertHTML(data){
      var link = '<a href="/diaries/' + data.id + '" class="header__diary__search">'
      var search = '<div class="header__diary__search'
      var nation_city = $(search + '--location">').append(data.city_name + ", " + data.nation_name);
      var title = $(search + '--title">').append(data.article_title);

      var result = $(link).append(nation_city, title);
      return result
    };

    $.ajax({
      type: "GET",
      data: ('q=' + input),
      dataType: "json",
      url: "/diaries"
    })

    .done(function(data){
      $incrementalResult.remove();
      $('#incremental-no-result').remove();
      if (data.length > 0) {
        for (var i = 0; i < data.length; i++){
          var result = insertHTML(data[i])
          $incremental.append(result);
        };
      } else {
        $incremental.append(resultNone);
      };
    })
    .fail(function(data){
      alert("error");
    });
  };

  $header__diary.on('keyup', searchDiary);


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

//diary preview表示
  $("#diary-photo-btn").change(function(){
    var preview = document.querySelector('#image_preview');
    var file    = document.querySelector('#diary-photo-btn').files[0];
    var reader  = new FileReader();

    reader.addEventListener("load", function () {
      preview.src = reader.result;
    }, false);

    if (file) {
      reader.readAsDataURL(file);
    };
  });
});
