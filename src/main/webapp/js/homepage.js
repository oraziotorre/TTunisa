let inTransition = false;
const immagini = ['images/homeImg1.png', 'images/homeImg2.jpg', 'images/homeImg3.jpg', 'images/homeImg4.jpg'];
let indiceImmagine = 0;

function redirectTo(url) {
    if (url == null)
        url = "${pageContext.request.contextPath}/"
    window.location.href = url;
}

function cambiaImmagine() {
    if (inTransition) return;
    inTransition = true;

    let immagine = document.getElementById('immagine_grande');
    immagine.style.opacity = 0;

    setTimeout(() => {
        indiceImmagine = (indiceImmagine + 1) % immagini.length;
        immagine.src = immagini[indiceImmagine];
        immagine.style.opacity = 1;
        inTransition = false;
    }, 500);
}

/*
NEL CASO SERVISSE
function increaseItemCount() {
    // Seleziona l'elemento con classe 'cart-icon'
    var cartIcon = document.querySelector('.cart-icon');

    // Ottieni l'attuale valore di data-item-count e convertilo in un numero intero
    var currentCount = parseInt(cartIcon.getAttribute('data-item-count'));

    // Incrementa il valore
    var newCount = currentCount + 1;

    // Aggiorna il valore di data-item-count nell'HTML
    cartIcon.setAttribute('data-item-count', newCount);

}*/

setInterval(cambiaImmagine, 5000);