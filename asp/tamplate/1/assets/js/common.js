window.dataLayer = window.dataLayer || [];

function gtag() {
    dataLayer.push(arguments);
}
gtag('js', new Date());
gtag('config', 'UA-122907869-1');

/* MODAL */
$(".btn-deposit").click(function(){ //DEPOSIT
    $("#depositModal iframe").attr("src", "/money/index.asp?tab=1");
})

$(".btn-exchange").click(function(){ //EXCHANGE
    $("#depositModal iframe").attr("src", "/money/index.asp?tab=2");
})

$(".btn-point").click(function(){ //POINT
    $("#depositModal iframe").attr("src", "/money/index.asp?tab=3");
})

// $(".ntc").click(function(){ //BORAD
//     $("#boardViewModal iframe").attr("src", "/board/index.asp?tab=1");
// })

$(".btn-delete").click(function(){ //DELETE BOARD LIST
    var result = confirm('삭제한 기록은 복구할 수 없습니다. 삭제하시겠습니까?');
    if (result)
    {
        //YES
    }
    else
    {
        //NO
    }
})

/* BOARD VIEW */
function boardView(n){
    var idx = n;
    $("#boardModal").modal("show");
    $("#boardModal iframe").attr("src", "/board/view.asp?idx="+idx);
}
function boardList(tab, page){
    var tab_num = tab;
    var page_num = page;
    //$("#boardViewModal").modal("hide");
    $("#boardModal").modal("show");
    $("#boardModal iframe").attr("src", "/board/index.asp?tab="+tab_num+"&page="+page_num);
}

