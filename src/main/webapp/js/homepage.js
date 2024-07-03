
    let inTransition = false; // Variabile per gestire la transizione

    function cambiaImmagine() {
    if (inTransition) return; // Evita di eseguire se è già in transizione
    inTransition = true;

    let immagine = document.getElementById('immagine_grande');
    immagine.style.opacity = 0; // Imposta opacità a 0 per farlo scomparire

    // Cambia immagine dopo la durata della transizione (500ms)
    setTimeout(() => {
    let immagineAttuale = immagine.src;

    if (immagineAttuale.endsWith('home1.jpg')) {
    immagine.src = 'images\\homeimg1.png';
} else {
    immagine.src = 'images\\home1.jpg';
}

    immagine.style.opacity = 1; // Riporta opacità a 1 per far apparire la nuova immagine
    document.querySelector("ul").style.zIndex='1000';
    inTransition = false; // Transizione completata

}, 500);
}

    /* l'intervallo cambia immagine automaticamente ogni 3 secondi */
    setInterval(cambiaImmagine, 3000);

