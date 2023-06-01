function handleSkintoneInput(input) {
    var radioValue = document.querySelector('input[name="surveySkintone"]:checked').value;
    if (radioValue === "기타") {
        input.value = radioValue + ',' + input.value;
    }
}