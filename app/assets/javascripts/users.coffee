# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  
$ ->
# slickスライダー
  $(".slick-item").slick(
    accessibility: true,
    autoplay: true,
    autoplaySpeed: 500,
    cssEase: 'ease',
    dots: true,
    fade: false,
  )

# signal = "red"
# switch signal
#   when "red"
#     alert 1
#   when "blue"
#     alert 2

# hoge = 1
# hello1 =-> alert "hello 1"
# hello2 =-> alert "hello 2"
# hello3 =-> alert "hello 3"

# switch hoge
#   when 1
#     hello1()
#   when 2
#     hello2()
#   when 3
#     hello3()

# sum = 0
# for i in [0..9]
#   sum += i
#   alert sum

#   $('h1').css('color', 'red')

#   # fadeInの使い方
#   $('head').append('<style>body{display:none;}')
#   $('body').delay(1200).fadeIn(1200)


# y = 10
# x = y ? 20
# alert x