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
    let currentCount = parseInt($('#productCount-'+productSeq).val());

    // count up and down operation
    if (operation === '+') {
        currentCount += 1;
    } else if (operation === '-') {
        if (currentCount > 0) {
            currentCount -= 1;
        } else {
            alert("Product count can't be less than 0");
            return;
        }
    }

    // update product count in the input field
    $('#productCount-'+productSeq).val(currentCount);

    // Here goes your Ajax request for updating product count in the server
    $.ajax({
        type: 'POST',
        url: '/theBeauty/cart/updateProductCount', // use the url for updating product count in your backend
        data: {
            productSeq: productSeq,
            productCount: currentCount
        },
        success: function(response) {
            // Update price on the page based on the new count
            updatePrice(response, productSeq);
        },
        error: function(error) {
            console.log('Error in updating product count', error);
        }
    });
}

function updatePrice(productDetail, productSeq) {
    // Assuming productDetail has price and count
    let newPrice = productDetail.productPrice * productDetail.productCount;
    
    // Update price on the page
    $('#item-price-'+productSeq).text(newPrice);
}
