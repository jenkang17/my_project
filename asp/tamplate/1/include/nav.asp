<nav class="fancynavbar fancynavbar-expand-lg"
    data-zanim-lg='{"from":{"opacity":1,"x":70},"to":{"opacity":1,"x":0},"ease":"CubicBezier","duration":0.8,"delay":0.3}'
    data-zanim-xs='{"from":{"opacity":1,"y":-37},"to":{"opacity":1,"y":0},"ease":"CubicBezier","duration":0.8,"delay":0.3}'
    data-zanim-trigger="scroll" data-exclusive="true">
    <% if Session("IU_ID") <> "" then %>
    <div class="user-info-box">
        <p><span class="u-id"></span>님 반갑습니다</p>
    </div>
    <% end if %>
    <div class="fancynavbar-togglerbar bg-black"><a class="fancynavbar-brand" href="index.html"><img
                class="fancynavbar-brand-img" src="assets/img/logo-sparrow-invert.svg" alt="" width="30" height="30"
                data-zanim-lg='{"from":{"opacity":0,"x":45},"to":{"opacity":1,"x":0},"ease":"CubicBezier","duration":0.8,"delay":0.4}'
                data-zanim-trigger="scroll" />
            <!--You can use icon or text logo as well-->
            <!--<span class='fab fa-superpowers fs-3'></span>-->
            <!--<span class='logo-sparrow'>S</span>-->
        </a>
        <div class="fancynavbar-toggler"><svg class="fancynavbar-toggler-icon" viewBox="0 0 70 70"
                xmlns="http://www.w3.org/2000/svg"
                data-zanim-lg='{"from":{"opacity":0,"x":45},"to":{"opacity":1,"x":0},"ease":"CubicBezier","duration":0.8,"delay":0.5}'
                data-zanim-trigger="scroll">
                <path id="path-top"
                    d="M20,25c0,0,22,0,30,0c16,0,18.89,40.71-.15,21.75C38.7,35.65,19.9,16.8,19.9,16.8"></path>
                <path id="path-middle" d="M20,32h30"></path>
                <path id="path-bottom"
                    d="M19.9,46.98c0,0,18.8-18.85,29.95-29.95C68.89-1.92,66,38.78,50,38.78c-8,0-30,0-30,0"></path>
            </svg></div>
        <div class="fancynavbar-addon"
            data-zanim-lg='{"from":{"opacity":1,"x":45},"to":{"opacity":1,"x":0},"ease":"CubicBezier","duration":0.8,"delay":0.4}'
            data-zanim-trigger="scroll">

            <% if Session("IU_ID") <> "" then %>
            <a href="#myinfoModal" class="fancynavbar-addon-item" data-bs-toggle="modal">
                <i class="fas fa-user"></i>
            </a>
            <a href="#messageModal" class="fancynavbar-addon-item btn-msg" data-bs-toggle="modal">
                <span class="fas fa-envelope"></span>
                <i class="count">10</i>
            </a>
            <% end if %>

            <!-- <a class="fancynavbar-addon-item" href="#!">
                <span class="fab fa-twitter"></span>
            </a> -->
            <a class="fancynavbar-addon-item" href="#!">
                <span class="fab fa-telegram"></span>
            </a>
            <a class="fancynavbar-addon-item" href="#languageModal" data-bs-toggle="modal">
                <span class="font-sans-serif ls fw-black fs--1 d-block">EN</span>
            </a>
        </div>
    </div>
    <div class="fancynavbar-collapse">
        <ul class="fancynavbar-nav">
            <li class="fancynav-item">
                <a class="fancynav-link" href="/" style="opacity: 1; transform: translate(0px, 0px);"><span class="fancynav-link-content"><i class="fas fa-home me-3 fs-1"></i>홈</span></a>
            </li>
            <li class="fancynav-item fancy-dropdown"><a class="fancynav-link fancy-dropdown-toggle"
                href="JavaScript:void(0)"><span class="fancynav-link-content"><i class="fas fa-gamepad me-3 fs-1"></i>게임</span></a>
                <div class="fancy-dropdown-menu">
                    <div class="row pb-4 pt-3">
                        <div class="col-auto">
                            <a class=" false fancy-dropdown-item" href="/">슬롯</a>
                        </div>
                        <div class="col-auto">
                            <a class=" false fancy-dropdown-item" href="/">카지노</a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="fancynav-item">
                <a class="fancynav-link btn-deposit" href="#depositModal" data-bs-toggle="modal" style="opacity: 1; transform: translate(0px, 0px);"><span class="fancynav-link-content"><i class="fas fa-plus me-3 fs-1"></i>입금신청</span></a>
            </li>
            <li class="fancynav-item">
                <a class="fancynav-link btn-exchange" href="#depositModal" data-bs-toggle="modal" style="opacity: 1; transform: translate(0px, 0px);"><span class="fancynav-link-content"><i class="fas fa-minus me-3 fs-1"></i>출금신청</span></a>
            </li>
            <li class="fancynav-item">
                <a class="fancynav-link btn-point" href="#depositModal" data-bs-toggle="modal" style="opacity: 1; transform: translate(0px, 0px);"><span class="fancynav-link-content"><i class="fas fa-exchange-alt me-3 fs-1"></i>포인트 전환</span></a>
            </li>
            <li class="fancynav-item">
                <a class="fancynav-link" href="javascript:boardList(2, 1);" style="opacity: 1; transform: translate(0px, 0px);"><span class="fancynav-link-content"><i class="fas fa-comments me-3 fs-1"></i>고객센터</span></a>
            </li>
            <li class="fancynav-item">
                <a class="fancynav-link" href="#messageModal" data-bs-toggle="modal" style="opacity: 1; transform: translate(0px, 0px);"><span class="fancynav-link-content"><i class="fas fa-envelope me-3 fs-1""></i>쪽지함</span></a>
            </li>
            <li class="fancynav-item">
                <a class="fancynav-link" href="javascript:boardList(1, 1);" style="opacity: 1; transform: translate(0px, 0px);"><span class="fancynav-link-content"><i class="fas fa-list me-3 fs-1""></i>공지사항</span></a>
            </li>
            <li class="fancynav-item">
                <a class="fancynav-link" href="javascript:boardList(3, 1);" style="opacity: 1; transform: translate(0px, 0px);"><span class="fancynav-link-content"><i class="fas fa-question-circle me-3 fs-1"></i>자주 묻는 질문</span></a>
            </li>
            <% if Session("IU_ID") <> "" then %>
            <li class="fancynav-item">
                <a class="fancynav-link" href="javascript:logout();" style="opacity: 1; transform: translate(0px, 0px);"><span class="fancynav-link-content"><i class="fas fa-sign-in-alt me-3 fs-1"></i>로그아웃</span></a>
            </li>
            <% else %>
            <li class="fancynav-item">
                <a class="fancynav-link" href="#memberModal" data-bs-toggle="modal" style="opacity: 1; transform: translate(0px, 0px);"><span class="fancynav-link-content"><i class="fas fa-sign-in-alt me-3 fs-1"></i>로그인</span></a>
            </li>
            <% end if %>
            <!-- <li class="fancynav-item fancy-dropdown"><a class="fancynav-link fancy-dropdown-toggle"
                href="JavaScript:void(0)"><span class="fancynav-link-content">Main</span></a>
                <div class="fancy-dropdown-menu">
                    <div class="row pb-4 pt-3">
                        <div class="col-auto">
                            <a class=" false fancy-dropdown-item" href="/">Default</a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="fancynav-item fancy-dropdown"><a class="fancynav-link fancy-dropdown-toggle"
                href="JavaScript:void(0)"><span class="fancynav-link-content">Game List</span></a>
                <div class="fancy-dropdown-menu">
                    <div class="row pb-4 pt-3">
                        <div class="col-auto">
                            <a class=" false fancy-dropdown-item" href="#games">style1</a>
                        </div>
                    </div>
                </div>
            </li> -->
        </ul>
    </div>
</nav>