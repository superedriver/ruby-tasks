$(document).ready(function() {
  var $li = $("main>ul>li");
  $li.click(function() {
    $li.removeClass("active").children("a").attr("aria-expanded","false");
    $(this).addClass("active").children("a").attr("aria-expanded", "true");
    var article = $(this).children("a").attr("href");

    $(".article").removeClass("active");
    $(article).addClass("active");
    var i = 0;
  });
});