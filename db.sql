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
    utente_id      INT AUTO_INCREMENT PRIMARY KEY,
    nome           VARCHAR(25)    NOT NULL,
    cognome        VARCHAR(25)    NOT NULL,
    saldo          DECIMAL(10, 2) NOT NULL,
    email          VARCHAR(25)    NOT NULL,
    pass           VARCHAR(30)    NOT NULL,
    amministratore BOOLEAN        NOT NULL
);

-- Inserimento di dati nella tabella "utente"
INSERT INTO utente (utente_id, nome, cognome, saldo, email, pass, amministratore)
VALUES (1, 'Francesco', 'Durante', 10000, 'francesco@gmail.com', '1234', TRUE),
       (2, 'Orazio', 'Torre', 10000, 'orazio@gmail.com', '4321', TRUE);

-- Creazione della tabella "prodotto"
CREATE TABLE prodotto
(
    prodotto_ID INT AUTO_INCREMENT PRIMARY KEY,
    nome        VARCHAR(100)   NOT NULL,
    descrizione VARCHAR(300)   NOT NULL,
    prezzo      DECIMAL(10, 2) NOT NULL,
    quantita    int            NOT NULL,
    sconto      INT CHECK (sconto >= 0 AND sconto <= 100),
    categoria   ENUM('tavoli', 'racchette', 'palline', 'abbigliamento', 'altro') NOT NULL,
    img         VARCHAR(1000)  NOT NULL
);


-- Creazione della tabella "ordine"
CREATE TABLE ordine
(
    ordine_ID  INT AUTO_INCREMENT PRIMARY KEY,
    prezzo_tot DECIMAL(10, 2) NOT NULL,
    data       DATE           NOT NULL,
    cap        VARCHAR(5)     NOT NULL,
    indirizzo  VARCHAR(25)    NOT NULL,
    utente_ID  INT,
    scontrino  JSON
);

