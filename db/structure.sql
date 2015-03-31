DROP TABLE IF EXISTS Credenziali;
DROP TABLE IF EXISTS ReqFonti;
DROP TABLE IF EXISTS ReqComp;
DROP TABLE IF EXISTS TestMod;
DROP TABLE IF EXISTS Moduli;
DROP TABLE IF EXISTS Componenti;
DROP TABLE IF EXISTS Tests;
DROP TABLE IF EXISTS Requisiti;
DROP TABLE IF EXISTS Fonti;

CREATE TABLE Requisiti
(
	NomeReq VARCHAR(10),
	CodiceReq VARCHAR(10) NOT NULL, 
	Sistema VARCHAR(1) NOT NULL, 
	Importanza VARCHAR(1) NOT NULL, 
	Tipo VARCHAR(1) NOT NULL, 
	Descrizione TEXT NOT NULL,
	Soddisfatto BOOLEAN DEFAULT FALSE, 
	PRIMARY KEY (NomeReq)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE Fonti
(
	NomeFonte VARCHAR(30) NOT NULL,
	DescrizioneFonte TEXT,
	PRIMARY KEY (NomeFonte)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE ReqFonti
(
	NomeReq VARCHAR(10),
	NomeFonte VARCHAR(30),
	PRIMARY KEY (NomeReq, NomeFonte),
	FOREIGN KEY (NomeReq) REFERENCES Requisiti(NomeReq) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (NomeFonte) REFERENCES Fonti(NomeFonte) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE Credenziali
(
	Utente VARCHAR(20) NOT NULL,
	Password VARCHAR(30) NOT NULL,
	PRIMARY KEY (Utente)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE Componenti
(
	NomeComp	VARCHAR(42),
	DescrizioneComp TEXT,
	PRIMARY KEY (NomeComp)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE ReqComp
(
	NomeReq VARCHAR(10),
	NomeComp VARCHAR(42),
	PRIMARY KEY(NomeReq,NomeComp),
	FOREIGN KEY (NomeReq) REFERENCES Requisiti(NomeReq) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (NomeComp) REFERENCES Componenti(NomeComp) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE Tests
(
	CodTest VARCHAR(10),
	DescrizioneTest TEXT,
	Pass BOOLEAN DEFAULT FALSE,
	PRIMARY KEY(CodTest)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE TestComp
(
	CodTest VARCHAR(10),
	NomeComp VARCHAR(42),
	PRIMARY KEY(CodTest,NomeMod),
	FOREIGN KEY (CodTest) REFERENCES Tests(CodTest) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (NomeComp) REFERENCES Componenti(NomeComp) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;