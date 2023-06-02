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
	
    console.log(operation);
    console.log(productSeq);
    console.log(currentCount);
    if (operation === '+') {
        currentCount += 1;
    } else if (operation === '-') {
        if (currentCount > 1) {
            currentCount -= 1;
        } else {
            alert("Product count can't be less than 0");
            return;
        }
    }

    document.getElementById("productCount-"+productSeq).value = currentCount;

}

function updatePrice(productDetail, productSeq) {
    // Assuming productDetail has price and count
    let newPrice = productDetail.productPrice * productDetail.productCount;
    
    // Update price on the page
    $('#item-price-'+productSeq).text(newPrice);
}
