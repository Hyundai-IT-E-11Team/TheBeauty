function checkEmpty(){
	var keyword = $("#kewword").val();

    if (keyword == "") {
        alert("검색어를 입력하세요.");
        event.preventDefault();
        return;
    }
	
}