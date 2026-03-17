const slides = document.querySelectorAll(".hero-slide");
const nextBtn = document.querySelector(".hero-next");
const prevBtn = document.querySelector(".hero-prev");

let index = 0;

function showSlide(i) {

slides.forEach(slide => slide.classList.remove("active"));

slides[i].classList.add("active");

}

function nextSlide() {

index++;

if (index >= slides.length) {
index = 0;
}

showSlide(index);

}

function prevSlide() {

index--;

if (index < 0) {
index = slides.length - 1;
}

showSlide(index);

}

nextBtn.addEventListener("click", nextSlide);
prevBtn.addEventListener("click", prevSlide);

/* AUTO SLIDE */
setInterval(nextSlide, 3600);