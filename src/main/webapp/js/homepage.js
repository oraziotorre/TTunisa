let inTransition = false;
const immagini = ['images/homeimg1.jpg', 'images/homeimg2.jpg', 'images/homeimg3.jpg'];
let indiceImmagine = 0;

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

setInterval(cambiaImmagine, 5000);