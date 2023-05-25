const carousel = document.querySelector(".carousel");
firstImg = carousel.querySelectorAll("img")[0];
arrowIcons = document.querySelectorAll(".wrapper i");

let isDragStart = false, isDragging = false, prevPageX, prevScrollLeft, positionDiff;

const showHideIcons = () => {
	let scrollWidth = carousel.scrollWidth - carousel.clientWidth;
	arrowIcons[0].style.display = carousel.scrollLeft == 0 ? "none" : "block";
	arrowIcons[1].style.display = carousel.scrollLeft == scrollWidth ? "none" : "block";
}

arrowIcons.forEach(icon => {
	icon.addEventListener("click", () => {
		let firstImgWidth = firstImg.clientWidth + 14;
		carousel.scrollLeft += icon.id == "left" ? -firstImgWidth : firstImgWidth;
		setTimeout(() => showHideIcons(), 60);
	})
})

const autoSlide = () => {
	if(carousel.scrollLeft == (carousel.scrollWidth - carousel.clientWidth)) return;
	
	positionDiff = Math.abs(positionDiff);
	let firstImgWidth = firstImg.clientWidth + 14;
	let valDifference = firstImgWidth - positionDiff;
	
	if(carousel.scrollLeft > preScrollLeft){
		return carousel.scrollLeft += positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
	}
	carousel.scrollLeft -= positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
}

const dragStart = (e) => {
	// mouse down이벤트에 전역 변수 값 업데이트
   isDragStart = true;
   prevPageX = e.pageX;
   prevScrollLeft = carousel.scrollLeft;
}

const dragging = (e) => {
	// 마우스 포인터에 따라 왼쪽으로 이미지/캐러셀 스크롤
   if(!isDragStart) return;
   e.preventDefault();
   isDragging = true;
   carousel.classList.add("dragging");
   positionDiff = e.pageX - prevPageX;
   carousel.scrollLeft = prevScrollLeft - positionDiff;
}

const dragStop = () => {
   isDragStart = false;
   carousel.classList.remove("dragging");
   
   if(!isDragging) return;
   isDragging = false;
   autoSlide();
}

carousel.addEventListener("mousedown", dragStart);
carousel.addEventListener("mousemove", dragging);
carousel.addEventListener("mouseup", dragStop);
carousel.addEventListener("mouseleave", dragStop);


//지호꺼
function checkEmpty(){
	var keyword = $("#kewword").val();

    if (keyword == "") {
        alert("검색어를 입력하세요.");
        event.preventDefault();
        return;
    }
	
}

//혜원이꺼
$(function() {
    var $submenu = $('#main-menu > #menulogo > .sub-menu');
    var $menulogo = $('#main-menu > #menulogo');

    $menulogo.mouseenter(function() {
        $submenu.stop().animate({height:'300px', opacity:1, visibility:'visible'}, 200);
    })
    .mouseleave(function() {
        $submenu.stop().animate({height:'0px', opacity:0, visibility:'hidden'}, 200);
    })
});

