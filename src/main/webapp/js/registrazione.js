function confermaParametri() {
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var resultEmail = emailRGX.test(email);
    var passwordRGX = /^[a-zA-Z0-9!@#$%^&*]*$/;
    var resultPassword = passwordRGX.test(password);


    if (password.length < 8) {
        document.getElementById("error").style.display="block";
        document.getElementById("error").innerHTML="Password troppo corta";
        return false;
    }

    if (resultEmail == false) {
        document.getElementById("error").style.display="block";
        document.getElementById("error").innerHTML="Formato Errato";
        return false;
    }

    if (resultPassword == false) {
        document.getElementById("error").style.display="block";
        document.getElementById("error").innerHTML="Formato Errato";
        return false;
    }
    return true;
}