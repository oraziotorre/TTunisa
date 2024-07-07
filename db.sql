-- Creazione del database
DROP
DATABASE IF EXISTS ttunisa;
CREATE
DATABASE ttunisa;
USE
ttunisa;

-- Creazione della tabella "utente"
CREATE TABLE utente
(
    utente_ID      INT AUTO_INCREMENT PRIMARY KEY,
    nome           VARCHAR(25)    NOT NULL,
    cognome        VARCHAR(25)    NOT NULL,
    saldo          DECIMAL(10, 2) NOT NULL,
    email          VARCHAR(25)    NOT NULL,
    pass           VARCHAR(1000)    NOT NULL,
    amministratore BOOLEAN        NOT NULL
);



-- Creazione della tabella "prodotto"
CREATE TABLE prodotto
(
    prodotto_ID INT AUTO_INCREMENT PRIMARY KEY,
    nome        VARCHAR(100)   NOT NULL,
    descrizione VARCHAR(300)   NOT NULL,
    prezzo      DECIMAL(10, 2) NOT NULL,
    quantita    int       NOT NULL,
    sconto      INT CHECK (sconto >= 0 AND sconto <= 100),
    categoria        ENUM('tavoli', 'racchette', 'palline', 'abbigliamento', 'altro')   NOT NULL,
    img         VARCHAR(1000)  NOT NULL,
    numero_acquisti INT DEFAULT 0
);



-- Creazione della tabella "ordine"
CREATE TABLE ordine
(
    ordine_ID  INT AUTO_INCREMENT PRIMARY KEY,
    prezzo_tot DECIMAL(10, 2) NOT NULL,
    data       DATE           NOT NULL,
    cap        VARCHAR(5)     NOT NULL,
    indirizzo  VARCHAR(25)    NOT NULL,
	scontrino JSON,
    utente_ID  INT,
	FOREIGN KEY (utente_ID) REFERENCES utente(utente_ID)
);


INSERT INTO utente (nome, cognome, saldo, email, pass, amministratore)
VALUES ('Francesco', 'Durante', 10000, 'francesco@gmail.com', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', TRUE),
       ('Orazio', 'Torre', 10000, 'orazio@gmail.com', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', FALSE),
        ('Giulia', 'Verdi', 12000, 'giulia@gmail.com', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', FALSE),
       ('Luca', 'Rossi', 8000, 'luca@gmail.com', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', FALSE),
       ('Chiara', 'Bianchi', 9500, 'chiara@gmail.com', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', FALSE),
       ('Marco', 'Neri', 7000, 'marco@gmail.com', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', FALSE),
       ('Elena', 'Ferrari', 11000, 'elena@gmail.com', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', FALSE);

INSERT INTO prodotto (nome, descrizione, prezzo, quantita, sconto, categoria, img)
VALUES ('Pallina Butterfly', 'una pallina di qualità', 5, 50, 0, 'racchette', '/Torre_Durante_pj_war_exploded/images/imageNA.png'),
       ('Racchetta Stiga', 'racchetta professionale', 45, 10, 5, 'racchette', '/Torre_Durante_pj_war_exploded/images/imageNA.png'),
       ('Borsa da tennis', 'borsa capiente e resistente', 60, 7, 10, 'racchette', '/Torre_Durante_pj_war_exploded/images/imageNA.png'),
       ('Set di palline', 'set di 6 palline', 12, 30, 0, 'racchette', '/Torre_Durante_pj_war_exploded/images/imageNA.png'),
       ('Tavolo da ping pong', 'tavolo di alta qualità', 300, 5, 15, 'racchette', '/Torre_Durante_pj_war_exploded/images/imageNA.png');


