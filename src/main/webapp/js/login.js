function verifyLogin(event) {
    event.preventDefault(); //Previene il comportamento predefinito del form di inviare una richiesta HTTP quando viene premuto il bottone di submit.



    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;

    // Validazione degli input lato client
    var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var passwordRGX = /^[a-zA-Z0-9!@#$%^&*]*$/;

    if (!passwordRGX.test(password) || !emailRGX.test(email)) {
        document.getElementById("error").innerHTML = "Formato non corretto";
        document.getElementById("error").style.display = "block";
        return false;
    }

    // Invio della richiesta AJAX
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'login', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (!response.success) {
                document.getElementById("error").innerHTML = "Email o password errati!";
                document.getElementById("error").style.display = "block";
            } else {
                window.location.href = response.redirect;
            }
        }
    };
    
    xhr.send('Email=' + encodeURIComponent(email) + '&Password=' + encodeURIComponent(password));
    return false; // Prevent the default form submission
}

document.querySelector('.login-form').addEventListener('submit', verifyLogin);
