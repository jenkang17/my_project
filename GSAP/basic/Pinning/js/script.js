gsap.registerPlugin(ScrollTrigger);
gsap.defaults({ease: "power1", duration:3});

const tl = gsap.timeline();

tl.from(".section03", {xPercent: -100})
.from(".section04", {xPercent: 100})
.from(".section05", {xPercent: 100});

ScrollTrigger.create({
    animation:tl,
    trigger: "#container",
    start: "top top",
    end: "+=4000",
    pin: true,
    scrub: true,
    anticipatePin:1
});