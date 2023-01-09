//JACKPOT
var HouseMoneyFst = 100;
var jackPotMoneyFst = 11565240.99;
var jackPotMoneyUd = 0;
var HouseMoneyExt = 0;

var hm_prefix = 0;
var jp_prefix = 0;
var hsMn;
var hm_options = {
    startVal: 0,
    separator: ',',
};

var jppp = new Date().getTime() + '';

(jppp = jppp.substring(2, 12) / 100 + 11565240.99 + ''),
    0 === parseInt(jppp.substr(0, -1)) && console.log('0');

function GetJP() {
    var get_jp = Math.floor(new Date().getTime() / 100);
    var str_length = Math.floor(new Date().getTime() / 100).toString().length;
    var jp_add = get_jp.toString().substr(str_length - 7, 6);
    jackPotMoneyUd = jp_add;
    var new_jp = parseInt(jackPotMoneyFst) + parseInt(jackPotMoneyUd);
    return new_jp;
}

setInterval(function () {
    var jppp = new Date().getTime() + '';
    (jppp = jppp.substring(2, 12) / 100 + 11565240.99 + ''),
        0 === parseInt(jppp.substr(0, -1)) && console.log('0');
    jp_om.update(jppp);
}, 2200);

var jp_e = document.querySelector('#JackpotMoney');

var jp_om = new Odometer({
    el: jp_e,
    value: 0,
    format: '(,ddd).dd',
});

setTimeout(function () {
    var jppp = new Date().getTime() + '';
    (jppp = jppp.substring(2, 12) / 100 + 11565240.99 + ''),
        0 === parseInt(jppp.substr(0, -1)) && console.log('0');
    jp_om.update(jppp);
}, 1000);

$(document).ready(function(){
    var body_width = $("body").innerWidth();
    if (body_width < 992)
    {
        $("#mainBgVideo source").attr("src", "/assets/video/videoplayback_m.mp4");
    }
    else
    {
        $("#mainBgVideo source").attr("src", "/assets/video/videoplayback.mp4");
    }
})

//스크롤 이벤트
var last_scrollTop = 0;

$(window).scroll(function () {
    var tmp = $(this).scrollTop();
    var body_width = $("body").innerWidth();

    if (body_width > 992)
    {
        if (tmp > last_scrollTop) {
            $('.bottom-fixed').css('bottom', '-132px');
            $('.indicator').css('bottom', '90px');
        } else {
            $('.bottom-fixed').css('bottom', '-300px');
            $('.indicator').css('bottom', '-100px');
        }
    }
    else if ( 420 < body_width && body_width <= 992 )
    {
        if (tmp > last_scrollTop) {
            $('.bottom-fixed').css('bottom', '-117px');
            $('.indicator').css('bottom', '90px');
        } else {
            $('.bottom-fixed').css('bottom', '-300px');
            $('.indicator').css('bottom', '-200px');
        }
    }
    else if ( body_width <= 420 )
    {
        if (tmp > last_scrollTop) {
            $('.indicator').css('bottom', '10px');
        } else {
            $('.indicator').css('bottom', '-200px');
        }
    }

    last_scrollTop = tmp;
});

$('.bottom-fixed').hover(
    function () {
        $(this).css('bottom', '0');
    },
    function () {
        var body_width = $("body").innerWidth();
        if (body_width > 992)
        {
            $(this).css('bottom', '-132px');
        }
        else if (420 < body_width && body_width <= 992 )
        {
            $(this).css('bottom', '-117px');
        }
        
    }
);

//실시간 입출금 현황
$('#verticalTiker1').totemticker({
    row_height: '36px',
    interval: 3000,
    mousestop: true,
});

$('#verticalTiker2').totemticker({
    row_height: '36px',
    interval: 5000,
    mousestop: true,
});

// $('.games-wrap .game').hover(
//     function () {
//         var audio = {};
//         audio['walk'] = new Audio();
//         audio['walk'].src = '/assets/sound/booksori-sarasvatl.wav';
//         audio['walk'].play();
//     }
//     ,
//     function () {
//         audio['walk'].pause();
//     }
// );