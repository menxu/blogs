pie.load ->
  $login_form = jQuery('.page-login form')
  if $login_form.length != 0
    $login_form.find('.submit').click ->
      action = $login_form.attr('action')
      params = $login_form.serialize()
      jQuery.ajax
        url : action
        type : 'POST'
        data : params
        dataType : 'json'
        success : (res)->
          console.log res
          window.location.href = res.redirect_to
        error : (xhr)->
          $login_form.find('.login-errors')
          .stop()
          .empty().html(xhr.responseText)
          # .empty().html('特使')
          .fadeIn().delay(3000).fadeOut()

