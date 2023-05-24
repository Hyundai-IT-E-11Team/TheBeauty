$(function() {
    var $submenu = $('#main-menu > #menulogo > .sub-menu');
    var $menulogo = $('#main-menu > #menulogo');

    $menulogo.mouseenter(function() {
        $submenu.stop().animate({height:'300px', opacity:1, visibility:'visible'}, 200);
    })
    .mouseleave(function() {
        $submenu.stop().animate({height:'0px', opacity:0, visibility:'hidden'}, 200);
    })
});
