$("input:checkbox").on('click', function() {
    var $box = $(this);
    if ($box.is(":checked")) {
        var group = "input:checkbox[name='" + $box.attr("name") + "']";
        $(group).prop("checked", false);
        $box.prop("checked", true);
    } else {
        $box.prop("checked", false);
    }
});

let form = document.querySelector('.main_form'),
    formInputs = document.querySelectorAll('.input-val');

function validateNumbers(num) {
    let re = /^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$/;
    return re.test(String(num));
}

form.onsubmit = function () {
       let errorInputs = Array.from(formInputs).filter(input => input.value === '' || !validateNumbers(input.value));
    formInputs.forEach(function (input) {
        if (input.value === '' || !validateNumbers(input.value) || input.value >= -5 || input.value <= 5) {
            input.classList.add('error-hovered');
        } else {
            input.classList.remove('error-hovered');
        }
    })

    if (errorInputs.length !== 0) {
        console.log('err inputs');
        return false;
    }
    let x = getText("x").eq(0).val();
    let y = getChe("y").eq(0).val();
    let r = getChe("r").eq(0).val();
    sendRequest(x, y, r);
}
function getChe(name) {
    return $(`:input[type=checkbox][name = "${name}"]:checked`);
}

function getText(name) {
    return $(`:input[name = "${name}"]`);
}
function sendRequest(x, y, r) {
    $.ajax({
        url: "./AreaCheckServlet",
        type: "POST",
        data: {'x': x, 'y': y, 'r': r},
        success: function(response){
            window.location.reload(true);
        },
        error: function (response) {
            alert("Не крокетно!");
        }
    });
}