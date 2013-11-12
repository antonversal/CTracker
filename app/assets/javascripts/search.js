$(function () {
    $('.search input').keyup(function () {
        $.get(this.action, $(this).serialize(), null, 'script');
        return false;
    });
});