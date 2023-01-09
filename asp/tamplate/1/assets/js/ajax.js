// 로그아웃
function logout() {
    $.ajax({
        type: "POST",
        url: "/member/proc.asp",
        data: {mode: 'logout'},
        success: function () {
            console.log('logout');
            location.reload();
        },
        error: function () {
            //Error시, 처리
            alert('server error');
        },
    });
}

// 로그인
function login(){
    var user_id = $("#loginForm [name='userid']").val();
    var user_pw = $("#loginForm [name='userpw']").val();

    if (user_id == "" || user_id.length == 0)
    {
        swal({
            text: '아이디를 입력해주세요.',
            confirmButtonText: 'X'
        });
        return;
    }

    if (user_pw == "" || user_pw.length == 0)
    {
        swal({
            text: '비밀번호를 입력해주세요.',
            confirmButtonText: 'X'
        });
        return;
    }

    var loginData = $("#loginForm").serialize();
    //console.log(loginData);
    $.ajax({
        type: "POST",
        url: "/member/proc.asp",
        data: loginData,
        success: function (data) {
            //Sucess시, 처리
            if (data == "0") // 로그인 성공
            {
                location.href='/';
            }
            else if (data == "-1")
            {
                swal({
                    text: '회원정보가 없습니다.',
                    confirmButtonText: 'X'
                });
                return;
            }
            else if (data == "-2")
            {
                swal({
                    text: '비밀번호를 다시 확인해주세요.',
                    confirmButtonText: 'X'
                });
                return;
            }
            else if (data == "isonline")
            {
                swal({
                    text: '현재 접속중인 계정입니다.',
                    confirmButtonText: 'X'
                });
                return;
            }
            else if (data == "status")
            {
                swal({
                    text: '이용이 제한된 계정입니다.',
                    confirmButtonText: 'X'
                });
                return;
            }
            else if (data == "level")
            {
                swal({
                    text: '이 계정은 플래이어 계정이 아닙니다.',
                    confirmButtonText: 'X'
                });
                return;
            }
            else if (data == "black_ip")
            {
                swal({
                    text: '이용이 제한되었습니다.',
                    confirmButtonText: 'X'
                });
                return;
            }
            else
            {
                swal({
                    text: '서버 에러. 잠시후 다시 시도해주세요.',
                    confirmButtonText: 'X'
                });
                return;
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            //Error시, 처리
            swal({
                text: '서버 에러. 잠시후 다시 시도해주세요.',
                confirmButtonText: 'X'
            });
            return;
        },
    });
}


// 회원정보
function getUserInfo() {
    $.ajax({
        type: "POST",
        url: "/member/proc.asp",
        data: {mode: 'get_info'},
        success: function (data) {

            if ( data == "error" )
            {
                alert('Session out');
                logout();
            }
            else
            {
                let user_info = data;
                user_info = user_info.split(',');
                let user_id = user_info[1];

                if ( user_id == "" || user_id.length == 0 )
                {
                    location.href="/member/proc.asp?mode=session_out"
                }
                
                $(".u-id").text(user_id);
                $(".u-money").text(insertComma(user_info[3].toString()));
                $(".u-money").val(insertComma(user_info[3].toString()));
                $(".u-point").text(insertComma(user_info[3].toString()));
                $(".u-phone").text(user_info[4]);
                $(".u-bank").text(user_info[5]);
                $(".u-account").text(user_info[6]);

            }
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            //Error시, 처리
            alert('Session error');
        },
    });

    timerID = setTimeout("getUserInfo()", 5000);
}

// 입금신청
function deposit() {
    var my_money =  $('#depositFrm [name="myMoney"]').val().replace(/[^0-9]/g,'');
    var money =  $('#depositFrm [name="requestMoney"]').val().replace(/[^0-9]/g,'');

    if (money == "" || money <= 0)
    {

        swal({
            text: '신청 금액을 선택해주세요.',
            confirmButtonText: 'X'
        })

        //$('#depositFrm [name="requestMoney"]').css("border-color", "#d0021b");
        return false;
    }

    $.ajax({
        type: "POST",
        url: "/money/proc.asp",
        data: {mode: 'deposit'},
        success: function (data) {
            //Sucess시, 처리
            //console.log(data);
            if (data === "0")
            {
                swal({
                    text: '입금신청이 완료되었습니다.',
                    confirmButtonText: 'X'
                })
            }
            else
            {
                swal({
                    text: '입금신청이 되지 않았습니다. 잠시후에 다시 시도해 주세요.',
                    confirmButtonText: 'X'
                })
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            //Error시, 처리
            alert('server error');
        },
    });
}

// 출금신청
function exchange() {
    var my_money =  $('#exchangeFrm [name="myMoney"]').val().replace(/[^0-9]/g,'');
    var money =  $('#exchangeFrm [name="requestMoney"]').val().replace(/[^0-9]/g,'');
    var exchange_pw = $('#exchangeFrm [name="exchangePw"]').val();
    var check_pw =  $('#exchangeFrm [name="checkpw"]').val();

    if (money == "" || money <= 0)
    {

        swal({
            text: '신청 금액을 선택해주세요.',
            confirmButtonText: 'X'
        })

        //$('#exchangeFrm [name="requestMoney"]').css("border-color", "#d0021b");
        return false;
    }

    if (parseInt(my_money) <  parseInt(money))
    {
        $('#exchangeFrm [name="requestMoney"]').val(0);
       //$('#exchangeFrm [name="requestMoney"]').css("border-color", "#d0021b");
        swal({
            text: '출금신청 금액이 보유 금액보다 높습니다.',
            confirmButtonText: 'X'
        })
        return false;
    }

    if ( check_pw == "" || check_pw != "Y" ||  exchange_pw == "" || exchange_pw.length == 0 )
    {
        swal({
            text: '출금 비밀번호를 확인해주세요.',
            confirmButtonText: 'X'
        })
        return false;
    }
    
    $.ajax({
        type: "POST",
        url: "/money/proc.asp",
        data: {mode: 'exchange'},
        success: function (data) {
            //Sucess시, 처리
            if (data === "0")
            {
                swal({
                    text: '출금신청이 완료되었습니다.',
                    confirmButtonText: 'X'
                })
            }
            else
            {
                swal({
                    text: '출금신청이 되지 않았습니다. 잠시후에 다시 시도해 주세요.',
                    confirmButtonText: 'X'
                })
                return false;
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            //Error시, 처리
            swal({
                text: 'server error.',
                confirmButtonText: 'X'
            })
        },
    });
}

// 출금 비밀번호 확인
function checkPw() {
    var acc_pw =  $('#exchangeFrm [name="exchangePw"]').val();

    if ( acc_pw == "" || acc_pw.length == 0 )
    {
        swal({
            text: '출금 비밀번호를 입력해주세요.',
            confirmButtonText: 'X'
        })
        return false;
    }

    $.ajax({
        type: "POST",
        url: "/money/proc.asp",
        data: {mode: 'check_pw', exchangePw: acc_pw},
        success: function (data) {
            //Sucess시, 처리
            if (data == "0")
            {
                swal({
                    text: '출금 비밀번호가 확인되었습니다.',
                    confirmButtonText: 'X'
                })
                $('#exchangeFrm [name="checkpw"]').val("Y");
            }
            else
            {
                swal({
                    text: '출금 비밀번호가 다릅니다.',
                    confirmButtonText: 'X'
                })
                $('#exchangeFrm [name="checkpw"]').val("N");
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            //Error시, 처리
            swal({
                text: 'server error.',
                confirmButtonText: 'X'
            })
        },
    });
    
}

// 공지사항 리스트
function ntcList() {
    $.ajax({
        type: "POST",
        url: "/board/proc.asp",
        data: {mode: 'notice', list_cnt:10},
        success: function (data) {
            //Sucess시, 처리
            $("#ntc-tab-pane tbody").html(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            //Error시, 처리
            swal({
                text: 'server error.',
                confirmButtonText: 'X'
            })
        },
    });
}

// 고객센터 리스트
function csList() {
    $.ajax({
        type: "POST",
        url: "/board/proc.asp",
        data: {mode: 'customer', list_cnt:10},
        success: function (data) {
            //Sucess시, 처리
            $("#csAccordion").html(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            //Error시, 처리
            swal({
                text: 'server error.',
                confirmButtonText: 'X'
            })
        },
    });
}

// 문의사항 등록
function insertAsk() {
    var ask = $("#csFrm [name='ask']").val();
    var list_cnt  = $("#csAccordion .accordion-item").length;

    if (ask == "" || ask.length == 0)
    {
        swal({
            text: '문의 내용을 입력해주세요.',
            confirmButtonText: 'X'
        })
        return;
    }

    $.ajax({
        type: "POST",
        url: "/board/proc.asp",
        data: {mode: 'insert_ask', ask: ask, list_cnt: list_cnt },
        success: function (data) {
            //Sucess시, 처리
            $("#csFrm [name='ask']").val('');
            $("#csAccordion").html(data);
            swal({
                text: '문의사항이 등록되었습니다.',
                confirmButtonText: 'X'
            })
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            //Error시, 처리
            swal({
                text: 'server error.',
                confirmButtonText: 'X'
            })
        },
    });
}

// 빠른계좌문의
function accountAsk() {
    var list_cnt  = $("#csAccordion .accordion-item").length;
    $.ajax({
        type: "POST",
        url: "/board/proc.asp",
        data: {mode: 'account_ask', list_cnt: list_cnt },
        success: function (data) {
            //Sucess시, 처리
            $("#csAccordion").html(data);
            swal({
                text: '계좌문의가 완료되었습니다.',
                confirmButtonText: 'X'
            })
            
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            //Error시, 처리
            swal({
                text: 'server error.',
                confirmButtonText: 'X'
            })
        },
    });
}

// 리스트 더보기
function listMore(t, n){
    var mode = t;

    if (mode == "notice")
    {
        var list_cnt  = $("#ntc-tab-pane tbody tr").length;
        var target = $("#ntc-tab-pane tbody");
    }
    else if(mode == "customer")
    {
        var list_cnt  = $("#csAccordion .accordion-item").length;
        var target = $("#csAccordion");
    }
    
    var more_cnt = n;
    
    //alert(list_cnt+3);
    $.ajax({
        type: "POST",
        url: "/board/proc.asp",
        data: {mode: mode, list_cnt: list_cnt + more_cnt },
        success: function (data) {
            //Sucess시, 처리
            target.html(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            //Error시, 처리
            swal({
                text: 'server error.',
                confirmButtonText: 'X'
            })
        },
    });
}