function register() {
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    var nome = document.getElementById('nome').value;
    var cognome = document.getElementById('cognome').value;

    // Validazione degli input lato client
    var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var passwordRGX = /^[a-zA-Z0-9!@#$%^&*]*$/;

    if (emailRGX.test(email) || passwordRGX.test(password) || nome.trim() === "" || cognome.trim() === "") {
        document.getElementById("error").innerHTML = "Formato non corretto o campi vuoti.";
        document.getElementById("error").style.display = "block";
        return false; // Ferma la sottomissione del form
    }

    // Invio della richiesta AJAX
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'registrazione-check', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.status == "error") {
                document.getElementById("error").innerHTML = response.message;
                document.getElementById("error").style.display = "block";
            } else {
                // Redirect to success page or handle success as needed
                window.location.href = "login";
            }
        }
    };
    xhr.send('Email=' + encodeURIComponent(email) + '&Password=' + encodeURIComponent(password) + '&Nome=' + encodeURIComponent(nome) + '&Cognome=' + encodeURIComponent(cognome));

    return false; // Evita il comportamento predefinito del form di inviare la richiesta
}
