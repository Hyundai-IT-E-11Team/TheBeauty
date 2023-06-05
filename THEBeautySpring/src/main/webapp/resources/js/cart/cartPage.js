$(document).ready(function() {
    // 한국 화폐 형식으로 변환하는 함수
    function formatCurrency(num) {
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    
    // 상품삭제 함수 정의
    let deleteProduct = function() {
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

    // 상품 선택 체크박스 클릭 이벤트 처리
    $(".product-checkbox").on("change", function() {
        $(this).closest(".product").attr("data-selected", this.checked ? "true" : "false");
        updateTotalPrice(); // 체크박스 상태가 바뀔 때마다 총 가격을 계산
    });

    // 페이지 로딩 시 각 상품 가격을 한국 화폐 형식으로 표시
    $(".item-price").each(function() {
    	let price = parseFloat(this.innerHTML);
        $(this).text(formatCurrency(price) + " 원");
    });

    // 장바구니 상품 개수 조절
    window.productCounting = function(operation, productSeq) {
        let productCountElement = document.getElementById("productCount-" + productSeq);
        let currentCount = parseInt(productCountElement.value);

        let productPriceElement = document.getElementById("itemPrice-" + productSeq);
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
       
        // 장바구니 상품 개수 업데이트 (DB 업데이트)
        $.ajax({
            url: '/theBeauty/cart/updateProductCount',
            type: 'POST',
            data: {
                productSeq: productSeq,
                productCount: currentCount
            }
        }).done(function(response) {
            console.log(response);
        }).fail(function(error) {
            console.log(error);
        });
        
        updateTotalPrice()
    }

    // 장바구니의 총 가격을 계산하고 해당 값을 페이지에 업데이트하는 함수
    function updateTotalPrice() {
        let total = 0;

        $(".item-price").each(function() {
            // 상품이 선택되었는지 확인
            let isSelected = $(this).closest(".product").attr("data-selected") === "true";
            if (isSelected) {
                let itemPrice = parseFloat($(this).attr("data-price"));
                let itemCount = parseInt($(this).closest(".product").find(".onlyNumberInput").val());
                total += itemPrice * itemCount;
            }
        });

        total = total.toLocaleString("ko-KR");

        $("#totOrdPrc").text(total + " 원"); // 총 주문금액 업데이트
        $("#totProdPrc").text(total + " 원"); // 상품금액 업데이트
        $("#payPrc").text(total + " 원");  // 결제 예정 금액 업데이트
    }

    // 페이지 로딩 시 모든 체크박스를 선택하고 상품 가격 반영
    $(".product-checkbox").each(function() {
        $(this).prop('checked', true);
        $(this).closest(".product").attr("data-selected", "true");
    });

    updateTotalPrice();
});



