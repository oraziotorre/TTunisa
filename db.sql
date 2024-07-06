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
    nome           VARCHAR(25) NOT NULL,
    cognome        VARCHAR(25) NOT NULL,
    saldo DOUBLE NOT NULL,
    email          VARCHAR(25) NOT NULL,
    pass           VARCHAR(30) NOT NULL,
    amministratore BOOLEAN     NOT NULL
);

-- Inserimento di dati nella tabella "utente"
INSERT INTO utente (utente_id, nome, cognome, saldo, email, pass, amministratore)
VALUES (1, 'Francesco', 'Durante', 10000, 'francesco@gmail.com', '1234', TRUE),
       (2, 'Orazio', 'Torre', 10000, 'orazio@gmail.com', '4321', TRUE);

-- Creazione della tabella "prodotto"
CREATE TABLE prodotto
(
    prodotto_ID       INT AUTO_INCREMENT PRIMARY KEY,
    nome             VARCHAR(100) NOT NULL,
    descrizione       VARCHAR(300) NOT NULL,
    prezzo           DOUBLE NOT NULL,
    quantita             int,
    sconto            INT CHECK (sconto >= 0 AND sconto <= 100),
	img 			VARCHAR(100)  NOT NULL
);

-- Creazione della tabella "categoria"
CREATE TABLE categoria
(
    tipo VARCHAR(25) PRIMARY KEY
);

-- Creazione della tabella "ordine"
CREATE TABLE ordine
(
    ordine_ID   INT AUTO_INCREMENT PRIMARY KEY,
    prezzo_tot DOUBLE NOT NULL,
    data         DATE        NOT NULL,
    cap         VARCHAR(5)  NOT NULL,
    indirizzo   VARCHAR(25) NOT NULL,
    utente_ID   INT,
    FOREIGN KEY (utente_ID) REFERENCES utente (utente_ID)
);

-- Creazione della tabella di associazione tra prodotto e ordine
CREATE TABLE ordine_prod
(
    ordine_ID       INT,
    prodotto_ID     INT,
    quantita_ordine INT NOT NULL,
    FOREIGN KEY (prodotto_ID) REFERENCES prodotto (prodotto_id),
    FOREIGN KEY (ordine_ID) REFERENCES ordine (ordine_ID),
    PRIMARY KEY (ordine_ID, prodotto_ID)
);


-- Creazione della tabella di associazione tra prodotto e categoria
CREATE TABLE cat_prod
(
    prodotto_ID INT,
    cat_Tipo    VARCHAR(25),
    FOREIGN KEY (prodotto_ID) REFERENCES prodotto (prodotto_ID),
    FOREIGN KEY (cat_Tipo) REFERENCES categoria (tipo),
    PRIMARY KEY (prodotto_ID, cat_Tipo)
);