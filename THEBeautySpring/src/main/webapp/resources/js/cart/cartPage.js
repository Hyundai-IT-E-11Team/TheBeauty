$(document).ready(function() {
	
	// 한국 화폐 형식으로 변환하는 함수
	function formatCurrency(num) {
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}


	// 상품삭제 함수 정의
	deleteProduct = function() {
		let container = $(this);
		var productSeq = $(this).data('product-id');
		$.ajax({
			url : '/theBeauty/cart/deleteProduct',
			type : 'POST',
			data : {
				productSeq : productSeq
			},
			success : function(response) {
				container.closest(".product").remove();
				updateTotalPrice(); // 상품 삭제 할 때 총 합계 업데이트
			}
		});
	}
	

	// 상품삭제 버튼 클릭 이벤트 처리
	$(".btn.color15").on("click", deleteProduct);

	
	// 페이지 로딩 시 각 상품 가격을 한국 화폐 형식으로 표시
	$(".item-price").each(function() {
		let price = $(this).data("price");
		$(this).text(formatCurrency(price) + " 원");
	});
	
	
	// 장바구니 페이지가 로드되면 총 가격을 계산
	updateTotalPrice();

});


// 장바구니 상품 개수 조절
function productCounting(operation, productSeq) {
	let productCountElement = document.getElementById("productCount-"
			+ productSeq);
	let currentCount = parseInt(productCountElement.value);

	let productPriceElement = document
			.getElementById("itemPrice-" + productSeq);
	let productPrice = parseFloat(productPriceElement
			.getAttribute("data-price"));

	if (operation === '+') {
		currentCount += 1;
	} else if (operation === '-') {
		if (currentCount > 1) {
			currentCount -= 1;
		} else {
			alert("상품의 수량이 0개보다 많아야 합니다.");
			return;
		}
	}

	productCountElement.value = currentCount;

	
	// 장바구니 개수에 따른 가격 변경
	let totalPrice = currentCount * productPrice;
	productPriceElement.innerHTML = totalPrice.toLocaleString("ko-KR") + "원";
	updateTotalPrice()
}


// 장바구니의 총 가격을 계산하고 해당 값을 페이지에 업데이트하는 함수
function updateTotalPrice() {
	let total = 0;

	$(".item-price").each(
			function() {
				let itemPrice = parseFloat($(this).attr("data-price"));
				let itemCount = parseInt($(this).closest(".product").find(
						".onlyNumberInput").val());
				total += itemPrice * itemCount;
			});

	total = total.toLocaleString("ko-KR");

	$("#totOrdPrc").text(total);
	$("#totProdPrc").text(total + " 원");
}
