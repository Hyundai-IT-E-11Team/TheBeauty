$(document).ready(function() {
    // 가격 정보 가져오기
    var priceString = productDetail.productVO.productPrice;
    var price = parseFloat(priceString.replace(/[^0-9.]+/g, ""));

    // 할인 금액 계산
    var discountAmount = price * 0.95;
    var discountMessage = '현대백화점카드 5% <strong>' + discountAmount.toLocaleString() + '원</strong>';
    $("#card-benefit").html(discountMessage); // 수정: text 대신 html 메서드를 사용하여 태그를 적용합니다.
    
    // 배송비 계산 함수 호출
    calculateShippingFee(price);
});
    

function calculateShippingFee(price) {
    console.log(price); // 콘솔에 가격 정보 출력
    var shippingFee = 0;
    var shippingFeeMessage = "";

    // 가격에 따라 배송비 계산
    if (price > 30000) {
        shippingFee = 0; // 무료 배송
        shippingFeeMessage = "무료 배송";
    } else {
        shippingFee = 3000; // 3000원 배송비
        shippingFeeMessage = "배송비 3,000원 (3만원 이상 무료)";
    }

    // 배송비 업데이트
    $("#shipping-fee").text(shippingFeeMessage);
}


// 장바구니로 이동 확인
function confirmAddToCart() {
    return confirm('장바구니에 추가하시겠습니까?');
}
