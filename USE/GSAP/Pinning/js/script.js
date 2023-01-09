var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;

gsap.registerPlugin(ScrollTrigger);
gsap.defaults({ease:"power1", duration:5});

const tl = gsap.timeline();
const sections = document.querySelectorAll('.section');


if (isMobile)
{
    tl.from(".section2", {xPercent:100})
    .from(".section3", {xPercent:100})
    .from(".section4", {xPercent:100})
    .from(".section5", {xPercent:100})
    .from(".section6", {xPercent:100})
    .from(".section7", {xPercent:100})

}
else 
{
    tl.from(".section2", {xPercent:100})
    .from(".section3", {xPercent:100})
    .from(".section4", {yPercent:100})
    .from(".section5", {xPercent:100})
    .from(".section6", {xPercent:-100})
    .from(".section7", {yPercent:-100})
}


ScrollTrigger.create({
    animation: tl,
    trigger: "#container",
    start: "top top",
    end : "+=3000",
    pin: true,
    scrub: true,
    anticipatePin:1
})

function gotoslide(i) {

    const section = document.getElementsByClassName("section");
    const target = document.querySelector(".section" + i);

    if (isMobile)
    {
        $(".navbar-toggler").addClass("collapsed");
        $(".navbar-collapse").removeClass("show");
    }

    for (let j = 0; j < section.length; j++)
    {
        section[j].classList.remove("active");
    }

    target.classList.add("active");
}

document.addEventListener('scroll', function(){
    const section = document.getElementsByClassName("section");

    for (let j = 0; j < section.length; j++)
    {
        section[j].classList.remove("active");
    }
})

function boardView(n){
    $("#boardView").modal('show');
}

function boardWrite() {
    $("#boardWrite").modal('show');
}

function login(){
    $("#login").modal('show');
}

function register(){
    $("#register").modal('show');
}



//$(".game-box").hover(function(){
    //gsap.to($(this).find(".game-img"), { duration: 0.3, ease: "slow(0.7, 0.7, false)", y: -10 });
//})
