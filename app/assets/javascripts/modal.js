$(function(){
  var $content_signup = $('#modal__contents-signup');
  var $signup = $('.modal__signup');
  var $content_signin = $('#modal__contents-signin');
  var $signin = $('#modal__signin');
  var $overlay = $("#modal-overlay");

  function centeringModal(modal){
    var w = $(window).width();
    var h = $(window).height();
    var cw = modal.outerWidth();
    var ch = modal.outerHeight();
    var left = ((w - cw)/2);
    var top = ((h - ch)/2);
    modal.css({"left": left + "px", "top": top + "px"});
  }

  function resetForm(form){
    form[0].reset();
    $('.error-messages').remove();
  }

  function errorMessages(data, form){
    for (var i = 0; i < data.error.length; i++){
      var error =
       form.prepend('<div class="error-messages">' + data.error[i] +'</div>');
    }
  }

  // $(window).resize(centeringModal($content_signup));


//サインアップ
  $(".modal__open-signup").click(function(){
    $content_signup.add($content_signin).hide();
    centeringModal($content_signup);
    $overlay.show();
    $content_signup.fadeIn(500);
  });
  $(".modal-close").click(function(){
    $overlay.add($content_signup).hide();
    resetForm($signup)
  });

  $signup.on('submit', function(e){
     e.preventDefault();
     var fd = new FormData(this);
    $.ajax({
      type: 'POST',
      url: '/users',
      data: fd,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      $('.error-messages').remove();
      if (data.error.length === 0) {
        $overlay.add($content_signup).fadeOut(500);
        resetForm($signup);
        location.reload(true);
      } else {
        $("#user_password").add("#user_password_confirmation").val("");
        $(".modal__login-btn").prop("disabled", false);
        errorMessages(data, $signup)
      };
    })
    .fail(function(data){
      alert('error');
      $(".modal__login-btn").prop("disabled", false);
    });
  });


//サインイン
  $(".modal__open-signin").click(function(){
    $content_signup.add($content_signin).hide();
    centeringModal($content_signin);
    $overlay.show();
    $content_signin.fadeIn(500);
  });
  $(".modal-close").click(function(){
    $overlay.add($content_signin).hide();
    resetForm($signin)
  });

  $signin.on('submit', function(e){
     e.preventDefault();
     var fd = new FormData(this);
    $.ajax({
      type: 'POST',
      url: '/users/sign_in',
      data: fd,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      $('.error-messages').remove();
      if (data.error.length === 0) {
        $overlay.add($content_signin).fadeOut(500);
        resetForm($signin);
        location.reload(true);
      } else {
        $("#user_password").add("#user_password_confirmation").val("");
        $(".modal__login-btn").prop("disabled", false);
        errorMessages(data, $signin)
      };
    })
    .fail(function(data){
      alert('error');
      $(".modal__login-btn").prop("disabled", false);
    });
  });
});

