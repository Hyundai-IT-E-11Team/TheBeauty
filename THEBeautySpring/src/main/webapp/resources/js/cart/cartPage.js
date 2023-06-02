$(document).ready(function() {
	
  // 상품삭제 함수 정의
  deleteProduct = function() {
	let container = $(this);
    var productSeq = $(this).data('product-id');
    $.ajax({
      url: '/theBeauty/cart/deleteProduct',
      type: 'POST',
      data: { productSeq: productSeq },
      success: function(response) {
        container.closest(".product").remove();
      }
    });
  }

  // 상품삭제 버튼 클릭 이벤트 처리
  $(".btn.color15").on("click", deleteProduct);
  
});




// 장바구니 상품 개수 조절
function productCounting(operation, productSeq) {
	let productCountElement  = document.getElementById("productCount-"+productSeq);
	let currentCount = parseInt(productCountElement.value);

    let productPriceElement = document.getElementById("itemPrice-"+productSeq);
    let productPrice = parseFloat(productPriceElement.getAttribute("data-price"));

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
}

