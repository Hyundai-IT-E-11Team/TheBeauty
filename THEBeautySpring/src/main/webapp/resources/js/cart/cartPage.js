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
