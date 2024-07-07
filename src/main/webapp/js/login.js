
function confermaParametri() {
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var resultEmail = emailRGX.test(email);
    var passwordRGX = /^[a-zA-Z0-9!@#$%^&*]*$/;
    var resultPassword = passwordRGX.test(password);

    if (resultEmail == false) {
        document.getElementById("error").innerHTML ="Formato non corretto";
        document.getElementById("error").style.display="block";
        return false;
    }

    if (resultPassword == false) {
        document.getElementById("error").innerHTML ="Formato non corretto";
        document.getElementById("error").style.display="block";
        return false;
    }


    return true;
}

function login() {
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;

    // Validazione degli input lato client
    var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var passwordRGX = /^[a-zA-Z0-9!@#$%^&*]*$/;

    if (!emailRGX.test(email) || !passwordRGX.test(password)) {
        document.getElementById("error").innerHTML = "Formato non corretto";
        document.getElementById("error").style.display = "block";
        return false;
    }

    // Invio della richiesta AJAX
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'login-check', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.status == "error") {
                document.getElementById("error").innerHTML = response.message;
                document.getElementById("error").style.display = "block";
            } else {
                // Redirect to success page or handle success as needed
                window.location.href = "home";
            }
        }
    };
    xhr.send('Email=' + encodeURIComponent(email) + '&Password=' + encodeURIComponent(password));

    return false; // Evita il comportamento predefinito del form di inviare la richiesta
}
