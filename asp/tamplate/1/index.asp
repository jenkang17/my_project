<!--#include virtual="/include/dbcon.asp"-->
<!DOCTYPE html>
<html class="has-sidemenu" lang="en-US" dir="ltr">

<head>
    <!--#include virtual="/include/head.asp"-->
</head>

<% if Session("IU_ID") <> "" then %>
<body class="overflow-hidden-x" onload="getUserInfo()">
<% else %>
<body class="overflow-hidden-x">
<% end if %>

    <!--#include virtual="/include/nav.asp"-->


    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main min-vh-100" id="top">
        <!-- SCROLL TOP -->
        <a class="indicator indicator-up" href="#top"><span class="indicator-arrow indicator-arrow-one"
            data-zanim-xs="{&quot;from&quot;:{&quot;opacity&quot;:0,&quot;y&quot;:15},&quot;to&quot;:{&quot;opacity&quot;:1,&quot;y&quot;:-5,&quot;scale&quot;:1},&quot;ease&quot;:&quot;Back.easeOut&quot;,&quot;duration&quot;:0.4,&quot;delay&quot;:0.9}"
            style="transform: translate(-50%, 0%) translate(0px, -5px) rotate(45deg); opacity: 1;"></span><span
            class="indicator-arrow indicator-arrow-two"
            data-zanim-xs="{&quot;from&quot;:{&quot;opacity&quot;:0,&quot;y&quot;:15},&quot;to&quot;:{&quot;opacity&quot;:1,&quot;y&quot;:-5,&quot;scale&quot;:1},&quot;ease&quot;:&quot;Back.easeOut&quot;,&quot;duration&quot;:0.4,&quot;delay&quot;:1.05}"
            style="transform: translate(-50%, 0%) translate(0px, -5px) rotate(45deg); opacity: 1;"></span></a>

        <!-- ============================================-->
        <!-- Preloader ==================================-->
        <div class="preloader" id="preloader">
            <div class="loader">
                <div class="line-scale-pulse-out-rapid">
                    <div> </div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div> </div>
                </div>
            </div>
        </div>
        <!-- ============================================-->
        <!-- End of Preloader ===========================-->

        <!-- ============================================-->
        <!-- <section> begin ============================-->
        <section class="py-0 overflow-hidden bg-black" data-zanim-timeline='{"delay":0.4}' data-zanim-trigger="scroll">
            <video id="mainBgVideo" class="main-bg-video" muted autoplay loop="loop">
                <source src="/assets/video/videoplayback.mp4" type="video/mp4">
            </video>
            <div class="video-mask"></div>
            <div class="container-fluid">
                <div class="devices-wrapper">
                    <div class="macbook-1" data-zanim-xs='{"delay":0.5,"animation":"slide-left","duration":1.5}'><img class="device"
                            data-parallax="data-parallax" data-rellax-speed="3" src="assets/img/banner/banner2.jpg" alt="" /></div>
                    <div class="ipad--l-1" data-zanim-xs='{"delay":0.5,"animation":"slide-left","duration":1.5}'><img class="device"
                            data-parallax="data-parallax" data-rellax-speed="3.8" src="assets/img/game/MIDAS.png" alt="" /></div>
                    <div class="ipad--l-2" data-zanim-xs='{"delay":0.5,"animation":"slide-left","duration":1.5}'><img class="device"
                            data-parallax="data-parallax" data-rellax-speed="3.8" src="assets/img/game/ISOFTBET.png" alt="" /></div>
                    <div class="ipad--l-3" data-zanim-xs='{"delay":0.5,"animation":"slide-left","duration":1.5}'><img class="device"
                            data-parallax="data-parallax" data-rellax-speed="3.8" src="assets/img/game/BOONGO.png" alt="" /></div>
                    <div class="ipad--l-4" data-zanim-xs='{"delay":0.5,"animation":"slide-left","duration":1.5}'><img class="device"
                            data-parallax="data-parallax" data-rellax-speed="3.8" src="assets/img/game/EVOLUTION.png" alt="" /></div>
                    <div class="ipad--l-5" data-zanim-xs='{"delay":0.5,"animation":"slide-left","duration":1.5}'><img class="device"
                            data-parallax="data-parallax" data-rellax-speed="3.8" src="assets/img/game/TAISHAN.png" alt="" /></div>
                    <div class="game game-1" data-zanim-xs='{"delay":0.4,"animation":"slide-left","duration":1.5}'><img class="device"
                            data-parallax="data-parallax" data-rellax-speed="5" src="assets/img/game/CQ9.jpg" alt="" /></div>
                    <div class="game game-2" data-zanim-xs='{"delay":0.5,"animation":"slide-left","duration":1.5}'><img class="device"
                            data-parallax="data-parallax" data-rellax-speed="4.8" src="assets/img/game/PLAYNGO.jpg" alt="" /></div>
                </div>
                <div class="row py-8 min-vh-100 align-items-center">
                    <div class="col-md-auto px-md-4 ps-md-8">
                        <h1 class="display-4 fs-2 fs-sm-4 fs-md-4 fs-lg-5"><span class="overflow-hidden d-inline-block">
                            <span class="d-inline-block" data-zanim-xs='{"delay":1}'>세계 최초 공식 라이선스
                                <!-- <span class="font-base fst-italic fw-normal">No1.</span> -->
                            </span><br />
                            <span class="overflow-hidden d-inline-block pb-2">
                                <span class="d-inline-block" data-zanim-xs='{"delay":1.1}'>No1. 슬롯 카지노</span>
                            </span>
                        </h1>
                        <!-- <div class="overflow-hidden">
                            <p class="mt-3 mt-sm-4 font-sans-serif lead" data-zanim-xs='{"delay":1.2}'>Head start your
                                stylish website with a gorgeous template</p>
                        </div> -->
                        <div class="mt-3 mt-sm-5">
                            <!-- <a class="btn btn-dark btn-sm me-2 my-2" href="#demoes"
                                data-offset="60" data-zanim-xs='{"delay":1.3}'>Explore Demos</a> -->
                            <a class="btn btn-outline-dark btn-sm my-2 btn-white"
                                href="#games" data-zanim-xs='{"delay":1.3}'>Games &xrarr;</a></div>
                    </div>
                </div>
            </div>
            <!-- end of .container-->
        </section>
        <!-- <section> close ============================-->
        <!-- ============================================-->

        <!-- ============================================-->
        <!-- <section> marquee ============================-->

        <!--#include virtual="/include/marquee.asp"-->

        <!-- <section> close ============================-->
        <!-- ============================================-->

        <!-- ============================================-->
        <!-- <section> money ============================-->
        <section class="font-sans-serif text-center py-6 bg-dark money-wrap">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <% if Session("IU_ID") <> "" then %>
                        <a class="fancynavbar-addon-item btn-deposit" href="#depositModal" data-bs-toggle="modal">
                        <% else %>
                        <a class="fancynavbar-addon-item" href="#memberModal" data-bs-toggle="modal">
                        <% end if %>
                            <img src="/assets/img/icons/icon_cash.svg" alt="" width="60px" height="60px"><span class="font-sans-serif ls fw-black fs-0 text-white ms-3">입금신청</span>
                        </a>
                    </div>
                    <div class="col">
                        <% if Session("IU_ID") <> "" then %>
                        <a class="fancynavbar-addon-item btn-exchange" href="#depositModal" data-bs-toggle="modal">
                        <% else %>
                        <a class="fancynavbar-addon-item" href="#memberModal" data-bs-toggle="modal">
                        <% end if %>
                            <img src="/assets/img/icons/icon_cash.svg" alt="" width="60px" height="60px"><span class="font-sans-serif ls fw-black fs-0 text-white ms-3">출금신청</span>
                        </a>
                    </div>
                    <div class="col">
                        <% if Session("IU_ID") <> "" then %>
                        <a class="fancynavbar-addon-item btn-point" href="#depositModal" data-bs-toggle="modal">
                        <% else %>
                        <a class="fancynavbar-addon-item" href="#memberModal" data-bs-toggle="modal">
                        <% end if %>
                            <img src="/assets/img/icons/icon_point.svg" alt="" width="60px" height="60px"><span class="font-sans-serif ls fw-black fs-0 text-white ms-3">포인트 전환</span>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- <section> close ============================-->
        <!-- ============================================-->


        <!-- ============================================-->
        <!-- <section> begin ============================-->
        <section class="font-sans-serif text-center pt-0 pb-6 bg-dark">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-9 col-lg-10">
                        <div class="fs-2 text-white">
                            <h3 class="fs-3 d-inline-block fw-bold text-danger mb-3 jackpotTitle">Progressive Jackpot</h3>
                            <div class="jackpotNum">
                                <p class="jumbo" id="JackpotMoney">0</p>
                                <span>&#8361;</span>
                            </div>
                        </div>
                        <!-- <div class="fs-2 text-500">Turn your project from
                            <h3 class="d-inline-block fw-bold text-white">mediocre to remarkable</h3> — a design that is
                            simple, seamless and alive! With Sparrow, your outstanding website is just one step away.
                            Create with it what you will.
                        </div> -->
                        <hr class="hr-short bg-500 mt-6 opacity-1" />
                    </div>
                </div>
            </div>
            <!-- end of .container-->
        </section>
        <!-- <section> close ============================-->
        <!-- ============================================-->

        <!-- ============================================-->
        <!-- <section> begin ============================-->
        <section class="pb-9 pt-3 bg-dark games-wrap" id="games">
            <div class="container-fluid">
                <div class="row mx-0" data-isotope='{"layoutMode":"packery"}'>
                    <div class="col-6 isotope-item slots-wrap">
                        <h6 class="mb-3 text-center text-white text-capitalize">SLOTS</h6>
                        <div class="bg-wrap">
                            <div class="row">
                                <% if Session("IU_ID") <> "" then %>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#"><span><img src="/assets/img/game/slot/boongo.jpg" alt="playngo" title="playngo"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#"><span><img src="/assets/img/game/slot/playngo.jpg" alt="playngo" title="playngo"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#"><span><img src="/assets/img/game/slot/cq9.jpg" alt="playngo" title="playngo"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#"><span><img src="/assets/img/game/slot/cq9.jpg" alt="playngo" title="playngo"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#"><span><img src="/assets/img/game/slot/boongo.jpg" alt="playngo" title="playngo"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#"><span><img src="/assets/img/game/slot/playngo.jpg" alt="playngo" title="playngo"></span></a></div>
                                <% else %>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#memberModal" data-bs-toggle="modal"><span><img src="/assets/img/game/slot/boongo.jpg" alt="playngo" title="playngo"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#memberModal" data-bs-toggle="modal"><span><img src="/assets/img/game/slot/playngo.jpg" alt="playngo" title="playngo"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#memberModal" data-bs-toggle="modal"><span><img src="/assets/img/game/slot/cq9.jpg" alt="playngo" title="playngo"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#memberModal" data-bs-toggle="modal"><span><img src="/assets/img/game/slot/cq9.jpg" alt="playngo" title="playngo"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#memberModal" data-bs-toggle="modal"><span><img src="/assets/img/game/slot/boongo.jpg" alt="playngo" title="playngo"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#memberModal" data-bs-toggle="modal"><span><img src="/assets/img/game/slot/playngo.jpg" alt="playngo" title="playngo"></span></a></div>
                                <% end if %>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 isotope-item casino-wrap">
                        <h6 class="mb-3 text-center text-white text-capitalize">CASINO</h6>
                        <div class="bg-wrap">
                            <div class="row">
                                <% if Session("IU_ID") <> "" then %>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#" ><span><img src="/assets/img/game/casino/evolution.jpg" alt="evolution" title="evolution"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#" ><span><img src="/assets/img/game/casino/tgtiger.jpg" alt="evolution" title="evolution"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#" ><span><img src="/assets/img/game/casino/ag.jpg" alt="evolution" title="evolution"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#" ><span><img src="/assets/img/game/casino/microgaming.jpg" alt="evolution" title="evolution"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#" ><span><img src="/assets/img/game/casino/dream.jpg" alt="evolution" title="evolution"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#" ><span><img src="/assets/img/game/casino/pragmatic.jpg" alt="evolution" title="evolution"></span></a></div>
                                <% else %>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#memberModal" data-bs-toggle="modal"><span><img src="/assets/img/game/casino/evolution.jpg" alt="evolution" title="evolution"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#memberModal" data-bs-toggle="modal"><span><img src="/assets/img/game/casino/tgtiger.jpg" alt="evolution" title="evolution"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#memberModal" data-bs-toggle="modal"><span><img src="/assets/img/game/casino/ag.jpg" alt="evolution" title="evolution"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#memberModal" data-bs-toggle="modal"><span><img src="/assets/img/game/casino/microgaming.jpg" alt="evolution" title="evolution"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#memberModal" data-bs-toggle="modal"><span><img src="/assets/img/game/casino/dream.jpg" alt="evolution" title="evolution"></span></a></div>
                                <div class="col-sx col-md-6 col-lg-4 game"><a href="#memberModal" data-bs-toggle="modal"><span><img src="/assets/img/game/casino/pragmatic.jpg" alt="evolution" title="evolution"></span></a></div>
                                <% end if %>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ============================================-->
                <!-- bottom fixed ==================================-->
                    <!--#include virtual="/include/bottom_fixed.asp"-->
                <!-- ============================================-->
                <!-- End of bottom fixed ==================================-->
            </div>
            <!-- end of .container-->
        </section>
        <!-- <section> close ============================-->
        <!-- ============================================-->



        <!-- ============================================-->
        <!-- <section> begin ============================-->
        <section class="customer-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 px-4 py-4 qna-box">
                        <hr class="opacity-1 ms-0 bg-danger"
                            data-zanim-xs='{"delay":0.2,"from":{"width":0},"to":{"width":"100%"}}'
                            data-zanim-trigger="scroll" />
                        <% if Session("IU_ID") <> "" then %>
                        <a href="javascript:boardList(3, 1);" class="fs-3 fw-normal text-black">자주 묻는 질문</a>
                        <% else %>
                        <a href="#memberModal" class="fs-3 fw-normal text-black" data-bs-toggle="modal">자주 묻는 질문</a>
                        <% end if %>
                    </div>
                    <div class="col-lg-4 px-4 py-4 cs-box">
                        <hr class="bg-danger opacity-1 ms-0"
                            data-zanim-xs='{"delay":0.4,"from":{"width":0},"to":{"width":"100%"}}'
                            data-zanim-trigger="scroll" />
                        <% if Session("IU_ID") <> "" then %>
                        <a href="javascript:boardList(2, 1);" class="fs-3 fw-normal text-black">고객센터 문의</a>
                        <% else %>
                        <a href="#memberModal" class="fs-3 fw-normal text-black" data-bs-toggle="modal">고객센터 문의</a>
                        <% end if %>
                    </div>
                    <div class="col-lg-4 px-4 py-4 partner-box">
                        <hr class="bg-danger opacity-1 ms-0" data-zanim-xs='{"from":{"width":0},"to":{"width":"100%"}}'
                            data-zanim-trigger="scroll" />
                        <p class="fs-3 fw-normal text-black">파트너 제휴 문의</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- <section> close ============================-->
        <!-- ============================================-->

        <!-- ============================================-->
        <!-- <section> partner ============================-->
        <section class="bg-dark partner-wrap" >
            <div class="container-fluid">
            </div>
            <!-- end of .container-->
        </section>

        <!-- <section> close ============================-->
        <!-- ============================================-->

        <!-- ============================================-->
        <!-- <section> begin ============================-->
        <section class="pb-0">
            <div class="container">
                <div class="row justify-content-center text-center">
                    <div class="col-lg-8 col-xl-8 py-8">
                        <hr class="hr-short bg-500 mb-4 opacity-1" />
                        <img src="/assets/img/logo/logo.svg" class="logo-bt  mb-6" alt="logo">
                        <p class="fs-0 font-sans-serif lead text-dark">&#169; 2022 GOOD GAME. All Rights Reserved.</p>
                        <a class="btn btn-danger mt-3" href="#">Purchase now</a>
                    </div>
                </div>
            </div>
            <!-- end of .container-->
        </section>
        <!-- <section> close ============================-->
        <!-- ============================================-->

    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->



    <!--===============================================-->
    <!--    Footer-->
    <!--===============================================-->
    <!-- <footer class="footer bg-black text-600 py-4 font-sans-serif text-center overflow-hidden" data-zanim-timeline="{}"
        data-zanim-trigger="scroll">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-4 order-lg-2 position-relative"><a class="indicator indicator-up" href="#top"><span
                            class="indicator-arrow indicator-arrow-one"
                            data-zanim-xs='{"from":{"opacity":0,"y":15},"to":{"opacity":1,"y":-5,"scale":1},"ease":"Back.easeOut","duration":0.4,"delay":0.9}'></span><span
                            class="indicator-arrow indicator-arrow-two"
                            data-zanim-xs='{"from":{"opacity":0,"y":15},"to":{"opacity":1,"y":-5,"scale":1},"ease":"Back.easeOut","duration":0.4,"delay":1.05}'></span></a>
                </div>
                <div class="col-lg-4 text-lg-start mt-4 mt-lg-0">
                    <p class="fs--1 text-uppercase ls fw-bold mb-0">Copyright &copy; 2022 Sparrow&trade; inc.</p>
                </div>
                <div class="col-lg-4 text-lg-end order-lg-2 mt-2 mt-lg-0">
                    <p class="fs--1 text-uppercase ls fw-bold mb-0">Made with<span
                            class="text-danger fas fa-heart mx-1"></span>by <a class="text-600"
                            href="https://themewagon.com/">Themewagon</a></p>
                </div>
            </div>
        </div>
    </footer> -->

    <!--===============================================-->
    <!--    Modal for language selection-->
    <!--===============================================-->
    <!-- MODAL XS-->
    <div class="modal fade fade-in" id="languageModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xs mx-auto" role="document">
            <div class="modal-content bg-black">
                <div class="modal-body text-center p-0"><button
                        class="btn-close text-white position-absolute top-0 end-0 times-icon mt-2 me-2 p-0"
                        type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    <ul class="list-unstyled my-0 py-4 font-sans-serif">
                        <li><a class="text-white fw-bold pt-1 d-block" href="homes/default.html">English</a></li>
                        <li><a class="pt-1 d-block text-500" href="#!">Français</a></li>
                        <li><a class="text-500 pt-1 d-block" href="pages/rtl.html">عربى</a></li>
                        <li><a class="pt-1 d-block text-500" href="#!">Deutsche</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- MYINFO MODAL SM-->
    <div class="modal fade fade-in custom-modal myinfo-modal" id="myinfoModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-md mx-auto" role="document">
            <div class="modal-content">
                <div class="modal-header p-2">
                    <div>
                        <i class="fas fa-user fs-2 me-2"></i>
                        <span class="u-id fs-2"></span>
                    </div>
                    <button class="btn-close text-white" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <ul class="list-unstyled my-0 font-sans-serif p-2">
                        <li class="flex-center-between p-3">
                            <span>보유 머니</span>
                            <span class="u-money"></span>
                            <div>
                                <a href="#depositModal" class="btn-deposit me-2" data-bs-toggle="modal"><i class="fas fa-plus me-1"></i>입금</a>
                                <a href="#depositModal" class="btn-exchange" data-bs-toggle="modal"><i class="fas fa-minus me-1"></i>출금</a>
                            </div>
                        </li>
                        <li class="flex-center-between p-3">
                            <span>보유 포인트</span>
                            <span class="u-point"></span>
                            <div class="">
                                <a href="#depositModal" class="btn-point" data-bs-toggle="modal"><i class="fas fa-exchange-alt me-1"></i>전환</a>
                            </div>
                        </li>
                        <li class="flex-center-between p-3">
                            <span>연락처</span>
                            <span class="u-phone"></span>
                            <div class=""></div>
                        </li>
                        <li class="flex-center-between p-3">
                            <span>계좌정보</span>
                            <div>
                                <span class="u-account"></span> / 
                                <span class="u-bank"></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- LOGIN MODAL MD-->
    <div class="modal fade fade-in custom-modal login-modal" id="memberModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-md mx-auto" role="document">
            <div class="modal-content">
                <div class="modal-body text-center p-4">
                    <button
                        class="btn-close text-white position-absolute top-0 end-0 mt-2 me-2 p-0"
                        type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    <form name="loginForm" id="loginForm">
                        <input type="hidden" name="mode" value="login">
                        <input type="hidden" name="userip" value="<%=cf_conneting_ip%>">
                        <ul class="list-unstyled my-0 py-4 font-sans-serif">
                            <li class="mb-3"><input type="text" name="userid" class="form-control" placeholder="LOGIN ID"></li>
                            <li class="mb-4"><input type="password" name="userpw" class="form-control" placeholder="LOGIN PASSWORD"></li>
                            <li><button type="button" class="btn-dark btn" onclick="login();">LOGIN</button></li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- MESSAGE MODAL LG -->
    <div class="modal fade fade-in custom-modal message-modal" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg mx-auto" role="document">
            <div class="modal-content bg-black">
                <div class="modal-header">
                    <h5 class="modal-title fs-2" id="messageModalLabel">
                        <i class="fas fa-envelope me-2"></i>
                        쪽지함
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center p-3">
                    <iframe src="/message" width="100%" height="100%"></iframe>
                </div>
            </div>
        </div>
    </div>

    <!-- DEPOSIT MODAL XL -->
    <div class="modal fade custom-modal deposit-modal" id="depositModal" tabindex="-1" aria-labelledby="depositModalLabel"
        style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title h4 fs-2" id="depositModalLabel">SITE LOGO</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <iframe src="" width="100%" height="100%"></iframe>
                </div>
                <div class="modal-footer text-center py-4">
                    <button type="button" class="btn-dark btn" data-bs-dismiss="modal" aria-label="Close">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- BOARD LIST MODAL XL -->
    <div class="modal fade custom-modal board-list-modal" id="boardModal" tabindex="-1" aria-labelledby="boardModalLabel"
        style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title h4 fs-2" id="boardModalLabel">SITE LOGO</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <iframe src="" width="100%" height="100%"></iframe>
                </div>
                <div class="modal-footer text-center py-4">
                    <button type="button" class="btn-dark btn" data-bs-dismiss="modal" aria-label="Close">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <!--#include virtual="/include/script.asp"-->
    <script src="/assets/js/main.js"></script>
</body>

</html>