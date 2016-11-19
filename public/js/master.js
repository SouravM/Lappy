$(document).ready(function(){
    $('#parallax').mousemove(function(e){
        var x = -(e.pageX + this.offsetLeft) / 20;
        var y = -(e.pageY + this.offsetTop) / 20;
        $(this).css('background-position', x + 'px ' + y + 'px');
    });
});