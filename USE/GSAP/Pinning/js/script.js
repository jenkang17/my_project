gsap.registerPlugin(ScrollTrigger);
gsap.defaults({ease:"power1", duration:1});

const tl = gsap.timeline();
const sections = document.querySelectorAll('.section');

tl.from(".section2", {xPercent:100})
    .from(".section3", {xPercent:-100})
    .from(".section4", {yPercent:-100})

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

