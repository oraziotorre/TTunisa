function confermaParametri() {
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var resultEmail = emailRGX.test(email);
    var passwordRGX = /^[a-zA-Z0-9!@#$%^&*]*$/;
    var resultPassword = passwordRGX.test(password);

    if()

    if (password.length < 8) {
        document.getElementById("error").innerHTML
    }

    if (resultEmail == false) {

    }

    if (resultPassword == false) {
        alert("La password non rispecchia il formato corretto.Riprovare");
        return false;
    }
    return true;*/
}