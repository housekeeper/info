//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require impress


reveal_impress = ->
  $("#printable").hide()
  impress().goto window.location.hash
  impress().init()
  
  #  class_saver=$("body").attr("class");
  #    $("body").attr("class",class_saver);
  $("#impress").show()
  $("body").css "overflow", "hidden"
reveal_cv = ->
  window.location.hash = "printable"
  
  #class_saver=$("body").attr("class");
  $("body").removeAttr "class"
  $("#impress").hide()
  $("#printable").fadeIn()
  $(".fallback-message").hide()
  $("#printable").zIndex = 90000
  $("body").zIndex = 0
  $("body").css "overflow", "auto"
select_view = ->
  unless window.location.hash.indexOf("printable") is -1
    reveal_cv()
  else
    $("body").attr "class", class_saver
    impress().init()
    if window.location.hash.indexOf("init") isnt -1 or not window.location.hash
      $(".hint").show()
    else
      $(".hint").hide()
    $(".fallback-message").hide()
    reveal_impress()
    
    #   $('#printable').hide();
    #    impress().goto(window.location.hash);
    class_saver = $("body").attr("class")
class_saver = []
$("#impress").hide()
$(document).ready ->
  $(".loading").hide()
  cv = $("#printable").html()
  $(".content").each (i, el) ->
    cv += $(el).html()

  $("#printable").html cv
  $("#jcprt").click = reveal_cv
  window.onhashchange = select_view
  select_view()
