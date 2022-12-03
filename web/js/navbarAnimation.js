$(window).scroll(function () {
    if ($(this).scrollTop() > 150) {
        $('#mainNavbar').addClass('sticky-top');
        $('#mainNavbar').addClass('shadow');
        $('#mainNavbar').addClass('rounded');
        $('#mainNavbar').addClass('bg-body');
        $('#mainNavbar').addClass('navbarTrasition');
    } else {
        $('#mainNavbar').removeClass('sticky-top');
        $('#mainNavbar').removeClass('shadow');
        $('#mainNavbar').removeClass('rounded');
        $('#mainNavbar').removeClass('bg-body');
        $('#mainNavbar').removeClass('navbarTrasition');
    }
});