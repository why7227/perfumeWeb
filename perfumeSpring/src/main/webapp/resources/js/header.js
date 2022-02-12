$(function () {
    //카테고리 하위메뉴
    $('nav1>a').hide();

    $('#nav1>a').mouseover(function () {
        $('.nav_hide').slideDown();
    });

    $('.nav_hide').mouseleave(function () {
        $('.nav_hide').slideUp();
    });
});
