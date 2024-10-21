create database Sistemi_Informativ_i_Universitetit;

use	Sistemi_Informativ_i_Universitetit;

--FILLIMI I PJESES PER DDL

CREATE TABLE FAKULTETI(
	ID_Fakultetit int primary key not null,
	Emri varchar(255) not null,
	Qyteti varchar(255) not null,
	Numri_Rruges varchar(255) not null,
	Dekani varchar(255) not null,
	Info_kontaktuese varchar(255) not null
);
CREATE TABLE DEPARTAMENTI_AKADEMIK(
    ID_Fakultetit int  not null,
    ID_DEPARTAMENTI_AKADEMIK int  not null,
    Primary key(ID_DEPARTAMENTI_AKADEMIK, ID_Fakultetit),
    Emri_Departamentit varchar(255) not null,
    Kreu_Departamentit varchar(255) not null,
    Ndihmone_ne_organizim varchar(255) not null,
    Dekani varchar(255) not null,
    Info_kontaktuese varchar(255) not null,
    FOREIGN KEY(ID_Fakultetit) references FAKULTETI(ID_Fakultetit)
);

CREATE TABLE STAFI_AKADEMIK(
    ID_STAFI_AKADEMIK int not null,
    ID_DEPARTAMENTI_AKADEMIK int not null,
    ID_Fakultetit int not null, 
    Primary key(ID_STAFI_AKADEMIK, ID_DEPARTAMENTI_AKADEMIK),
    Emri varchar(255) not null,
    Mbiemrin varchar(255) not null,
    Departamentin_Punues varchar(255) not null,
    Info_kontaktuese varchar(255) not null,
    Titulli_Akademik varchar(255) not null,
    FOREIGN KEY(ID_DEPARTAMENTI_AKADEMIK, ID_Fakultetit) REFERENCES DEPARTAMENTI_AKADEMIK(ID_DEPARTAMENTI_AKADEMIK, ID_Fakultetit)
);


CREATE TABLE Numri_Telefonit(
	Numri_Telefonit int not null,
	ID_STAFI_AKADEMIK int not null,
	ID_DEPARTAMENTI_AKADEMIK int  not null,
	Prefixi varchar(255) not null,
	Primary key (Numri_Telefonit, ID_STAFI_AKADEMIK),
	Foreign key (ID_STAFI_AKADEMIK, ID_DEPARTAMENTI_AKADEMIK) references STAFI_AKADEMIK(ID_STAFI_AKADEMIK, ID_DEPARTAMENTI_AKADEMIK)

);

CREATE TABLE Profesori(
    ID_STAFI_AKADEMIK int not null,
    ID_Profesori int not null,
    ID_DEPARTAMENTI_AKADEMIK int not null,
    Ligjeratat_Doktorratures varchar(255) not null,
    Primary key (ID_STAFI_AKADEMIK, ID_Profesori),
    Foreign key (ID_STAFI_AKADEMIK, ID_DEPARTAMENTI_AKADEMIK) references STAFI_AKADEMIK(ID_STAFI_AKADEMIK, ID_DEPARTAMENTI_AKADEMIK)
);
CREATE TABLE DIPLOMA_PROGRAMIT_STUDIMOR(
    ID_INDEKSI_DIPLOMES int not null,
    ID_Profesori int not null,
    ID_STAFI_AKADEMIK int not null,
    Emri_Diplomes varchar(255) not null,
    Programi_Studimor varchar(255) not null,
    Kredite_Akademike int not null,
    Primary key (ID_STAFI_AKADEMIK, ID_Profesori),
    Foreign key (ID_STAFI_AKADEMIK, ID_Profesori) references Profesori(ID_STAFI_AKADEMIK, ID_Profesori)
);

CREATE TABLE Asistenti(    
    ID_STAFI_AKADEMIK int not null,
    ID_Asistenti int not null,
    ID_DEPARTAMENTI_AKADEMIK int not null,
    Ligjeratat_Magjistratures varchar(255) not null,
    ID_ASISTENTI_SENIOR int not null,
    PRIMARY KEY (ID_STAFI_AKADEMIK, ID_Asistenti),
    FOREIGN KEY (ID_STAFI_AKADEMIK, ID_DEPARTAMENTI_AKADEMIK) REFERENCES STAFI_AKADEMIK(ID_STAFI_AKADEMIK, ID_DEPARTAMENTI_AKADEMIK),
    FOREIGN KEY (ID_STAFI_AKADEMIK, ID_Asistenti) REFERENCES Asistenti(ID_STAFI_AKADEMIK, ID_Asistenti)
);

CREATE TABLE Lenda_Magjistratures(
	Numri_Kredive int not null,
	ID_Asistenti int not null,
	NUMRI_ASISTENTAVE int not null,
	Primary key (Numri_Kredive, ID_Asistenti)
);

CREATE TABLE Ndjeke(
    ID_Asistenti int not null,
    Numri_Kredive int not null,
	ID_STAFI_AKADEMIK int not null,
    Primary key (Numri_Kredive, ID_Asistenti),
    Foreign key (ID_STAFI_AKADEMIK, ID_Asistenti) references Asistenti(ID_STAFI_AKADEMIK, ID_Asistenti),
    Foreign key (Numri_Kredive, ID_Asistenti) references Lenda_Magjistratures(Numri_Kredive, ID_Asistenti)
);

CREATE TABLE LLOGARIA(
    ID_Asistenti int not null,
    ID_STAFI_AKADEMIK int not null,
    PRIMARY KEY (ID_Asistenti, ID_STAFI_AKADEMIK),
    FOREIGN KEY (ID_STAFI_AKADEMIK, ID_Asistenti) REFERENCES Asistenti(ID_STAFI_AKADEMIK, ID_Asistenti)
);


CREATE TABLE Studenti(
    ID_Fakultetit int  not null,
	ID_Studenti int not null,
	primary key(ID_Fakultetit, ID_Studenti),
	Emri varchar(255) not null,
	Mbiemri varchar(255) not null,
	Nota_mesatara float not null,
	Numri_Telefonit int not null,
	Data_Lindjes date not null,
    FOREIGN KEY (ID_Fakultetit) REFERENCES FAKULTETI(ID_Fakultetit)
);

CREATE TABLE INTERNSHIP_STUDIME (
    ID_INTERNSHIP_STUDIME int PRIMARY KEY NOT NULL,
    PRAKTIKA_PROFESIONALE varchar(250) NOT NULL,
    MUNDESI_PUNESIMI varchar(250) NOT NULL
);

CREATE TABLE PROGRAMI_STUDIMOR_i_STUDENTIT (
    ID_Studenti int NOT NULL,
    ID_INTERNSHIP_STUDIME int NOT NULL,
    ID_Fakultetit int NOT NULL,
    PRIMARY KEY (ID_Studenti, ID_INTERNSHIP_STUDIME),
    FOREIGN KEY (ID_INTERNSHIP_STUDIME) REFERENCES INTERNSHIP_STUDIME (ID_INTERNSHIP_STUDIME),
    FOREIGN KEY (ID_Fakultetit, ID_Studenti) REFERENCES Studenti (ID_Fakultetit, ID_Studenti)
);



CREATE TABLE Projekti (
    ID_Asistenti int NOT NULL,
    ID_Studenti int NOT NULL,
    ID_Fakultetit int NOT NULL,
    ID_Stafi_Akademik int NOT NULL,
    PRIMARY KEY (ID_Asistenti, ID_Studenti),
    FOREIGN KEY (ID_Fakultetit, ID_Studenti) REFERENCES Studenti(ID_Fakultetit, ID_Studenti),
    FOREIGN KEY (ID_Stafi_Akademik, ID_Asistenti) REFERENCES Asistenti(ID_STAFI_AKADEMIK, ID_Asistenti)
);

CREATE TABLE Monitorohet (
    ID_Asistenti int NOT NULL,
    ID_Studenti int NOT NULL,
    ID_Profesori int NOT NULL,
    ID_Stafi_Akademik int NOT NULL,
    PRIMARY KEY (ID_Asistenti, ID_Studenti, ID_Profesori),
    FOREIGN KEY (ID_Asistenti, ID_Studenti) REFERENCES Projekti(ID_Asistenti, ID_Studenti),
    FOREIGN KEY (ID_Stafi_Akademik, ID_Profesori) REFERENCES Profesori(ID_Stafi_Akademik, ID_Profesori)
);


CREATE TABLE PJESEMARRES (
    ID_Asistenti int NOT NULL,
    ID_Studenti int NOT NULL,
    ID_Profesori int NOT NULL,
    ID_Fakultetit int NOT NULL,
	ID_STAFI_AKADEMIK int not null,
    PRIMARY KEY (ID_Asistenti, ID_Studenti, ID_Profesori, ID_Fakultetit),
	FOREIGN KEY (ID_Fakultetit, ID_Studenti) REFERENCES Studenti (ID_Fakultetit, ID_Studenti),
    FOREIGN KEY (ID_STAFI_AKADEMIK, ID_Asistenti) REFERENCES Asistenti(ID_STAFI_AKADEMIK, ID_Asistenti),
	FOREIGN KEY (ID_STAFI_AKADEMIK, ID_Profesori) REFERENCES Profesori(ID_STAFI_AKADEMIK, ID_Profesori),
    FOREIGN KEY (ID_Fakultetit) REFERENCES Fakulteti(ID_Fakultetit)
);


create table Lenda(
	
	ID_Lenda int primary key not null,
	Emri_Lendes varchar(250) not null,
	Numri_Kredive int not null,
	Numri_Ligjeratave int not null,

);

create table Ndegjon(
	ID_Lenda int not null,
	ID_Studenti int not null,
	ID_Fakultetit int not null,
	primary key(ID_Lenda, ID_Studenti),
	FOREIGN KEY(ID_Lenda) references Lenda(ID_Lenda),
	Foreign key(ID_Fakultetit, ID_Studenti) references Studenti(ID_Fakultetit, ID_Studenti)
);


create table Ligjeron(
	ID_STAFI_AKADEMIK int not null,
	ID_Lenda int not null,
	Numri_Asistenteve int not null,
	Numri_kredive int not null,
	ID_DEPARTAMENTI_AKADEMIK int not null,
	primary key(ID_STAFI_AKADEMIK, ID_Lenda),
	FOREIGN KEY(ID_Lenda) references Lenda(ID_lenda),
	Foreign key(ID_STAFI_AKADEMIK, ID_DEPARTAMENTI_AKADEMIK) references STAFI_AKADEMIK(ID_STAFI_AKADEMIK, ID_DEPARTAMENTI_AKADEMIK)
);

create table Lendet_VITI_III(
	ID_Lenda int not null,
	ID_VITI3 int not null,
	Shkenca_Kompjuterike2 varchar(255) not null,
	Strukture_Diskrete varchar(255) not null,
	BIEE varchar(255) not null,
	primary key(ID_VITI3, ID_Lenda),
	Foreign key(ID_Lenda) references Lenda(ID_Lenda)
);

create table Lendet_VITI_II(
	ID_Lenda int not null,
	ID_VITI2 int not null,
	Shkenca_Kompjuterike1 varchar(255) not null,
	Web_Dizajn varchar(255) not null,
	DataBaze varchar(255) not null,
	primary key(ID_VITI2, ID_Lenda),
	Foreign key(ID_Lenda) references Lenda(ID_Lenda)
);

create table Lendet_VITI_I(
	ID_Lenda int not null,
	ID_VITI1 int not null,
	Hyrje_ne_Programim varchar(255) not null,
	Hyrje_ne_Algoritme varchar(255) not null,
	Matematike varchar(255) not null,
	primary key(ID_VITI1, ID_Lenda),
	Foreign key(ID_Lenda) references Lenda(ID_Lenda)
);

--FILLIMI I PJESES PER DML
INSERT INTO FAKULTETI (ID_Fakultetit, Emri, Qyteti, Numri_Rruges, Dekani, Info_kontaktuese)
VALUES
(1, 'Fakulteti i Shkencave Matematikore', 'Prizren', 'Rruga e Epirit', 'Adrian Shehu', 'ashehu@hotmail.com'),
(2, 'Fakulteti i Mjek\EBsis\EB', 'Prishtine', 'Rr. 28 Nentori', 'Ariana Hoxha', 'ahoxha@hotmail.com'),
(3, 'Fakulteti i Shkencave Kompjuterike', 'Prishtine', 'Rruga Afrim Zhitia', 'Violeta Shala', 'ashala@hotmail.com'),
(4, 'Fakulteti i Inxhinieris\EB Elektrike', 'Prizren', 'Rr. Muharrem Fejza', 'Lend Dibra', 'ldibra@hotmail.com'),
(5, 'Fakulteti i Arteve', 'Peje', 'Rruga e Epirit', 'Melos Abazi', 'mabazi@hotmail.com'),
(6, 'Fakulteti i Gjuheve te Huaja', 'Prishtine', 'Rr. 28 Nentori', 'Andi Hoxha', 'ahoxha@hotmail.coml'),
(7, 'Fakulteti i Ekonomise', 'Prishtine', 'Rruga Muharrem Fejza', 'Rinor Hysi', 'rhysi@hotmail.com'),
(8, 'Fakulteti i Juridikut', 'Prishtine', 'Rr. 28 Nentori', 'Drin Murati', 'dmurati@hotmail.com'),
(9, 'Fakulteti i Arteve', 'Prizren', 'Rruga e Epirit', 'Anila Shkrela', 'ashkrelau@hotmail.com'),
(10,'Fakulteti i Shkencave Politike', 'Peje', 'Rr. 28 Nentori', 'Tara Xhafa', 'txhafa@hotmail.com'),
(11, 'Fakulteti i Shkencave Kompjuterike', 'Peje', 'Rruga Afrim Zhitia', 'Liridon Gashi', 'lgashi@hotmail.com'),
(12, 'Fakulteti i Inxhinieris\EB Elektrike', 'Prishtine', 'Rr. Muharrem Fejza', 'Blerta Krasniqi', 'bkrasniqi@hotmail.com'),
(13, 'Fakulteti i Gjuheve te Huaja', 'Prizren', 'Rruga e Epirit', 'Ardit Selmani', 'aselmani@hotmail.com'),
(14, 'Fakulteti i Ekonomise', 'Peje', 'Rruga Muharrem Fejza', 'Valmira Gashi', 'vgashi@hotmail.com'),
(15, 'Fakulteti i Juridikut', 'Prishtine', 'Rr. 28 Nentori', 'Gentian Bajrami', 'gbajrami@hotmail.com'),
(16, 'Fakulteti i Shkencave Matematikore', 'Prishtine', 'Rruga Afrim Zhitia', 'Elira Duli', 'eduli@hotmail.com'),
(17, 'Fakulteti i Mjek\EBsis\EB', 'Prizren', 'Rr. Muharrem Fejza', 'Flaka Krasniqi', 'fkrasniqi@hotmail.com'),
(18, 'Fakulteti i Shkencave Politike', 'Peje', 'Rr. 28 Nentori', 'Ermal Gashi', 'egashi@hotmail.com'),
(19, 'Fakulteti i Mjek\EBsis\EB', 'Prishtine', 'Rr. 28 Nentori', 'Xhavit Hoxha', 'xhoxha@hotmail.com'),
(20, 'Fakulteti i Shkencave Matematikore', 'Peje', 'Rruga e Epirit', 'Albana Bajrami', 'abajrami@hotmail.com'),
(21, 'Fakulteti i Inxhinieris\EB Elektrike', 'Prizren', 'Rruga Afrim Zhitia', 'Vigan Berisha', 'vberisha@hotmail.com'),
(22, 'Fakulteti i Gjuheve te Huaja', 'Prishtine', 'Rr. Muharrem Fejza', 'Rina Haliti', 'rhaliti@hotmail.com'),
(23, 'Fakulteti i Ekonomise', 'Prishtine', 'Rr. 28 Nentori', 'Erblin Gashi', 'egashi@hotmail.com'),
(24, 'Fakulteti i Juridikut', 'Peje', 'Rruga Muharrem Fejza', 'Adea Morina', 'amorina@hotmail.com'),
(25, 'Fakulteti i Arteve', 'Prishtine', 'Rr. 28 Nentori', 'Arlinda Krasniqi', 'akrasniqi@hotmail.com');



INSERT INTO DEPARTAMENTI_AKADEMIK (ID_Fakultetit, ID_DEPARTAMENTI_AKADEMIK, Emri_Departamentit, Kreu_Departamentit, Ndihmone_ne_organizim, Dekani, Info_kontaktuese)
VALUES
(1,1, 'Fakulteti i Shkencave Matematikore', 'Aferdita Ismajli','Po', 'Adrian Shehu', 'ashehu@hotmail.com'),
(2,2, 'Fakulteti i Mjek\EBsis\EB', 'Agron Beqiri', 'Ariana Hoxha','Jo', 'ahoxha@hotmail.com'),
(3,3, 'Fakulteti i Shkencave Kompjuterike', 'Kujtim Bytyqi', 'Violeta Shala','Jo', 'ashala@hotmail.com'),
(4,4, 'Fakulteti i Inxhinieris\EB Elektrike', 'Kaltrina Lleshi', 'Lend Dibra','Jo','ldibra@hotmail.com'),
(5, 5,'Fakulteti i Arteve',  'Lule Fazliu', 'Melos Abazi','Po','mabazi@hotmail.com'),
(6, 6,'Fakulteti i Gjuheve te Huaja', 'Mirela Gjergji', 'Andi Hoxha','Po', 'ahoxha@hotmail.com'),
(7, 7,'Fakulteti i Ekonomise',  'Melisa Rexha', 'Rinor Hysi','Po', 'rhysi@hotmail.com'),
(8, 8,'Fakulteti i Juridikut', 'Yll Kamberi', 'Diona Murati','Po', 'dmurati@hotmail.com'),
(9, 9,'Fakulteti i Arteve', 'Alb Latifi', 'Anila Shkrela','Po', 'ashkrelau@hotmail.com'),
(10, 10,'Fakulteti i Shkencave Politike', 'Erza Hyseni', 'Tara Xhafa','Jo', 'txhafa@hotmail.com'),
 (11, 11, 'Fakulteti i Shkencave Matematikore', 'Artan Krasniqi', 'Mimoza Gashi', 'Po', 'artan.krasniqi@example.com'),
  (12, 12, 'Fakulteti i Mjek�sis�', 'Vesa Jashari', 'Dardan Krasniqi', 'Jo', 'vesa.jashari@example.com'),
  (13, 13, 'Fakulteti i Shkencave Kompjuterike', 'Fitim Ahmeti', 'Liridona Gashi', 'Jo', 'fitim.ahmeti@example.com'),
  (14, 14, 'Fakulteti i Inxhinieris� Elektrike', 'Adea Morina', 'Dren Krasniqi', 'Jo', 'adea.morina@example.com'),
  (15, 15, 'Fakulteti i Arteve', 'Blerta Gashi', 'Rron Krasniqi', 'Po', 'blerta.gashi@example.com'),
  (16, 16, 'Fakulteti i Gjuheve te Huaja', 'Gazmend Ahmeti', 'Diona Krasniqi', 'Po', 'gazmend.ahmeti@example.com'),
  (17, 17, 'Fakulteti i Ekonomise', 'Arlind Rexha', 'Eda Krasniqi', 'Po', 'arlind.rexha@example.com'),
  (18, 18, 'Fakulteti i Juridikut', 'Hana Gashi', 'Art Krasniqi', 'Po', 'hana.gashi@example.com'),
  (19, 19, 'Fakulteti i Arteve', 'Labinot Gjergji', 'Marsel Krasniqi', 'Po', 'labinot.gjergji@example.com'),
  (20, 20, 'Fakulteti i Shkencave Politike', 'Besa Ahmeti', 'Kushtrim Krasniqi', 'Jo', 'besa.ahmeti@example.com'),
  (21, 21, 'Fakulteti i Shkencave Matematikore', 'Valon Krasniqi', 'Rina Gashi', 'Po', 'valon.krasniqi@example.com'),
  (22, 22, 'Fakulteti i Mjek�sis�', 'Lum Nesimi', 'Kaltrin Krasniqi', 'Jo', 'lum.nesimi@example.com'),
  (23, 23, 'Fakulteti i Shkencave Kompjuterike', 'Era Krasniqi', 'Alb Krasniqi', 'Jo', 'era.krasniqi@example.com'),
  (24, 24, 'Fakulteti i Inxhinieris� Elektrike', 'Granit Gashi', 'Lea Krasniqi', 'Jo', 'granit.gashi@example.com'),
  (25, 25, 'Fakulteti i Gjuheve te Huaja', 'Elsa Hajdari', 'Leon Krasniqi', 'Po', 'elsa.hajdari@example.com');


INSERT INTO STAFI_AKADEMIK (ID_STAFI_AKADEMIK, ID_DEPARTAMENTI_AKADEMIK, ID_Fakultetit, Emri, Mbiemrin, Departamentin_Punues, Info_kontaktuese, Titulli_Akademik)
VALUES
(1, 1, 1, 'Aferdita','Shehu', 'Departamenti i Matematikes', 'ashehu@hotmail.com','Msc' ),
(2, 2, 2, 'Agron', 'Hoxha', 'Departamenti i Mjek\EBsis\EB', 'ahoxha@hotmail.com','Dr' ),
(3, 3, 3, 'Kujtim', 'Shala', 'Departamenti i Shkencave Kompjuterike', 'ashala@hotmail.com','Dr.Sc' ),
(4, 4, 4, 'Kaltrina', 'Dibra', 'Departamenti i Inxhinieris\EB Elektrike', 'ldibra@hotmail.com','Dr.Sc' ),
(5, 5, 5, 'Lule', 'Abazi', 'Departamenti i Arteve Vizuale', 'mabazi@hotmail.com','Msc' ),
(6, 6, 6, 'Mirela', 'Hoxha', 'Departamenti i Gjuheve te Huaja', 'ahoxha@hotmail.com','Dr' ),
(7, 7, 7, 'Melisa', 'Hysi', 'Departamenti i Ekonomise', 'rhysi@hotmail.com','Dr'),
(8, 8, 8, 'Yll', 'Murati', 'Departamenti i Juridikut', 'dmurati@hotmail.com','Dr.Sc' ),
(9, 9, 9, 'Alb', 'Shkrela', 'Departamenti i Muzikes', 'ashkrelau@hotmail.com','Dr' ),
(10, 10, 10, 'Erza', 'Xhafa', 'Departamenti i Shkencave Politike', 'txhafa@hotmail.com','Msc' ),
(11, 11, 11, 'Artan', 'Gashi', 'Departamenti i Shkencave Matematikore', 'artan.krasniqi@example.com', 'Msc'),
(12, 12, 12, 'Vesa', 'Krasniqi', 'Departamenti i Mjek\EBsis\EB', 'vesa.jashari@example.com', 'Dr'),
(13, 13, 13, 'Fitim', 'Gashi', 'Departamenti i Shkencave Kompjuterike', 'fitim.ahmeti@example.com', 'Dr.Sc'),
(14, 14, 14, 'Adea', 'Krasniqi', 'Departamenti i Inxhinieris\EB Elektrike', 'adea.morina@example.com', 'Dr.Sc'),
(15, 15, 15, 'Blerta', 'Krasniqi', 'Departamenti i Arteve Vizuale', 'blerta.gashi@example.com', 'Msc'),
(16, 16, 16, 'Gazmend', 'Krasniqi', 'Departamenti i Gjuheve te Huaja', 'gazmend.ahmeti@example.com', 'Dr'),
(17, 17, 17, 'Arlind', 'Krasniqi', 'Departamenti i Ekonomise', 'arlind.rexha@example.com', 'Dr'),
(18, 18, 18, 'Hana', 'Krasniqi', 'Departamenti i Juridikut', 'hana.gashi@example.com', 'Dr.Sc'),
(19, 19, 19, 'Alb', 'Shkrela', 'Departamenti i Muzikes', 'ashkrelau@hotmail.com', 'Dr'),
(20, 20, 20, 'Erza', 'Xhafa', 'Departamenti i Shkencave Politike', 'txhafa@hotmail.com', 'Msc'),
(21, 21, 21, 'Valon', 'Gashi', 'Departamenti i Shkencave Matematikore', 'valon.krasniqi@example.com', 'Msc'),
(22, 22, 22, 'Lum', 'Krasniqi', 'Departamenti i Mjek\EBsis\EB', 'lum.nesimi@example.com', 'Dr'),
(23, 23, 23, 'Era', 'Krasniqi', 'Departamenti i Shkencave Kompjuterike', 'era.krasniqi@example.com', 'Dr.Sc'),
(24, 24, 24, 'Granit', 'Krasniqi', 'Departamenti i Inxhinieris\EB Elektrike', 'granit.gashi@example.com', 'Dr.Sc'),
(25, 25, 25, 'Elsa', 'Krasniqi', 'Departamenti i Gjuheve te Huaja', 'elsa.hajdari@example.com', 'Msc');


INSERT INTO Numri_Telefonit (Numri_Telefonit, ID_STAFI_AKADEMIK, ID_DEPARTAMENTI_AKADEMIK, Prefixi)
VALUES
(044223456, 1, 1, '+383'),
(044799112, 2, 2,  '+383'),
(044345678, 3, 3,  '+383'),
(044900534, 4, 4,  '+383'),
(044567890, 5, 5,  '+383'),
(044234565, 6, 6,  '+383'),
(044789012, 7, 7,  '+383'),
(044901234, 8, 8,  '+383'),
(044567890, 9, 9,  '+383'),
(044234567, 10, 10, '+383'),
(044111222, 11, 11, '+383'),
(044333444, 12, 12, '+383'),
(044555666, 13, 13, '+383'),
(044777888, 14, 14, '+383'),
(044999000, 15, 15, '+383'),
(044123456, 16, 16, '+383'),
(044654321, 17, 17, '+383'),
(044987654, 18, 18, '+383'),
(044345678, 19, 19, '+383'),
(044876543, 20, 20, '+383'),
(044112233, 21, 21, '+383'),
(044445566, 22, 22, '+383'),
(044778899, 23, 23, '+383'),
(044991122, 24, 24, '+383'),
(044334455, 25, 25, '+383');


INSERT INTO Profesori (ID_STAFI_AKADEMIK, ID_Profesori, ID_DEPARTAMENTI_AKADEMIK, Ligjeratat_Doktorratures)
VALUES
(1, 1, 1, 'Ligjeratat per doktorature ne Matematike'),
(2, 2, 2, 'Ligjeratat per doktorature ne Mjekesi'),
(3, 3, 3, 'Ligjeratat per doktorature ne Shkencat Kompjuterike'),
(4, 4, 4, 'Ligjeratat per doktorature ne Inxhinieri Elektrike'),
(5, 5, 5, 'Ligjeratat per doktorature ne Arte Vizuale'),
(6, 6, 6, 'Ligjeratat per doktorature ne Gjuhe te Huaja'),
(7, 7, 7, 'Ligjeratat per doktorature ne Ekonomi'),
(8, 8, 8, 'Ligjeratat per doktorature ne Juridik'),
(9, 9, 9, 'Ligjeratat per doktorature ne Muzike'),
(10, 10, 10, 'Ligjeratat per doktorature ne Shkencat Politike'),
(11, 11, 11, 'Ligjeratat per doktorature ne Shkencave Matematikore'),
(12, 12, 12, 'Ligjeratat per doktorature ne Mjekesi'),
(13, 13, 13, 'Ligjeratat per doktorature ne Shkencat Kompjuterike'),
(14, 14, 14, 'Ligjeratat per doktorature ne Inxhinieri Elektrike'),
(15, 15, 15, 'Ligjeratat per doktorature ne Arte Vizuale'),
(16, 16, 16, 'Ligjeratat per doktorature ne Gjuhe te Huaja'),
(17, 17, 17, 'Ligjeratat per doktorature ne Ekonomi'),
(18, 18, 18, 'Ligjeratat per doktorature ne Juridik'),
(19, 19, 19, 'Ligjeratat per doktorature ne Muzike'),
(20, 20, 20, 'Ligjeratat per doktorature ne Shkencat Politike'),
(21, 21, 21, 'Ligjeratat per doktorature ne Shkencave Matematikore'),
(22, 22, 22, 'Ligjeratat per doktorature ne Mjekesi'),
(23, 23, 23, 'Ligjeratat per doktorature ne Shkencat Kompjuterike'),
(24, 24, 24, 'Ligjeratat per doktorature ne Inxhinieri Elektrike'),
(25, 25, 25, 'Ligjeratat per doktorature ne Arte Vizuale');



INSERT INTO DIPLOMA_PROGRAMIT_STUDIMOR (ID_INDEKSI_DIPLOMES, ID_Profesori, ID_STAFI_AKADEMIK, Emri_Diplomes, Programi_Studimor, Kredite_Akademike)
VALUES
(1, 1, 1, 'Diploma 1', 'Programi 1', 5),
(2, 2, 2, 'Diploma 2', 'Programi 2', 5),
(3, 3, 3, 'Diploma 3', 'Programi 3', 6),
(4, 4, 4, 'Diploma 4', 'Programi 4', 4),
(5, 5, 5, 'Diploma 5', 'Programi 5', 4),
(6, 6, 6, 'Diploma 6', 'Programi 6', 5),
(7, 7, 7, 'Diploma 7', 'Programi 7', 6),
(8, 8, 8, 'Diploma 8', 'Programi 8', 4),
(9, 9, 9, 'Diploma 9', 'Programi 9', 5),
(10, 10, 10, 'Diploma 10', 'Programi 10', 5),
(11, 11, 11, 'Diploma 11', 'Programi 11', 6),
(12, 12, 12, 'Diploma 12', 'Programi 12', 5),
(13, 13, 13, 'Diploma 13', 'Programi 13', 4),
(14, 14, 14, 'Diploma 14', 'Programi 14', 6),
(15, 15, 15, 'Diploma 15', 'Programi 15', 5),
(16, 16, 16, 'Diploma 16', 'Programi 16', 4),
(17, 17, 17, 'Diploma 17', 'Programi 17', 5),
(18, 18, 18, 'Diploma 18', 'Programi 18', 6),
(19, 19, 19, 'Diploma 19', 'Programi 19', 4),
(20, 20, 20, 'Diploma 20', 'Programi 20', 6),
(21, 21, 21, 'Diploma 21', 'Programi 21', 5),
(22, 22, 22, 'Diploma 22', 'Programi 22', 4),
(23, 23, 23, 'Diploma 23', 'Programi 23', 5),
(24, 24, 24, 'Diploma 24', 'Programi 24', 6),
(25, 25, 25, 'Diploma 25', 'Programi 25', 4);


INSERT INTO Asistenti (ID_STAFI_AKADEMIK, ID_Asistenti, ID_DEPARTAMENTI_AKADEMIK, Ligjeratat_Magjistratures, ID_ASISTENTI_SENIOR)
VALUES
(1, 1, 1, 'Ligjeratat per magjistrature ne Matematike', 101),
(2, 2, 2, 'Ligjeratat per magjistrature ne  Mjek\EBsi', 102),
(3, 3, 3, 'Ligjeratat per magjistrature ne Shkencat Kompjuterike',103),
(4, 4, 4, 'Ligjeratat per magjistrature ne Inxhinieri Elektrike',104),
(5, 5, 5, 'Ligjeratat per magjistrature ne Arte Vizuale',105),
(6, 6, 6, 'Ligjeratat per magjistrature ne Gjuhe te Huaja', 106),
(7, 7, 7, 'Ligjeratat per magjistrature ne Ekonomi', 107),
(8, 8, 8, 'Ligjeratat per magjistrature ne Juridik', 108),
(9, 9, 9, 'Ligjeratat per magjistrature ne Muzike', 109),
(10, 10, 10, 'Ligjeratat per magjistrature ne Shkencat Politike', 110),
(11, 11, 11, 'Ligjeratat per magjistrature ne Shkencave Matematikore', 111),
(12, 12, 12, 'Ligjeratat per magjistrature ne Mjekesi', 112),
(13, 13, 13, 'Ligjeratat per magjistrature ne Shkencat Kompjuterike', 113),
(14, 14, 14, 'Ligjeratat per magjistrature ne Inxhinieri Elektrike', 114),
(15, 15, 15, 'Ligjeratat per magjistrature ne Arte Vizuale', 115),
(16, 16, 16, 'Ligjeratat per magjistrature ne Gjuhe te Huaja', 116),
(17, 17, 17, 'Ligjeratat per magjistrature ne Ekonomi', 117),
(18, 18, 18, 'Ligjeratat per magjistrature ne Juridik', 118),
(19, 19, 19, 'Ligjeratat per magjistrature ne Muzike', 119),
(20, 20, 20, 'Ligjeratat per magjistrature ne Shkencat Politike', 120),
(21, 21, 21, 'Ligjeratat per magjistrature ne Shkencave Matematikore', 121),
(22, 22, 22, 'Ligjeratat per magjistrature ne Mjekesi', 122),
(23, 23, 23, 'Ligjeratat per magjistrature ne Shkencat Kompjuterike', 123),
(24, 24, 24, 'Ligjeratat per magjistrature ne Inxhinieri Elektrike', 124),
(25, 25, 25, 'Ligjeratat per magjistrature ne Arte Vizuale', 125);


INSERT INTO Lenda_Magjistratures (Numri_Kredive, ID_Asistenti, NUMRI_ASISTENTAVE)
VALUES
(5, 1, 3),
(4, 2, 8),
(1, 3, 10),
(3, 4, 7),
(2, 5, 9),
(7, 6, 6),
(9, 7, 4),
(10, 8, 1),
(8, 9, 5),
(6, 10, 2),
(11, 11, 11),
(20, 12, 13),
(12, 13, 15),
(19, 14, 12),
(13, 15, 14),
(18, 16, 19),
(14, 17, 18),
(16, 18, 17),
(15, 19, 20),
(17, 20, 16),
(20, 21, 21),
(21, 22, 22),
(23, 23, 24),
(24, 24, 25),
(25, 25, 23);


INSERT INTO Ndjeke (ID_Asistenti, Numri_Kredive, ID_STAFI_AKADEMIK)
VALUES
(1, 5, 1),
(2, 4, 2),
(3, 1, 3),
(4, 3, 4),
(5, 2, 5),
(6, 7, 6),
(7 ,9, 7),
(8, 10, 8),
(9, 8, 9),
(10, 6, 10),
(11, 11, 11),
(12, 20, 12),
(13, 12, 13),
(14, 19, 14),
(15, 13, 15),
(16, 18, 16),
(17, 14, 17),
(18, 16, 18),
(19, 15, 19),
(20, 17, 20),
(21, 20, 21),
(22, 21, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25);



INSERT INTO LLOGARIA (ID_Asistenti, ID_STAFI_AKADEMIK)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25);


INSERT INTO Studenti (ID_Fakultetit, ID_Studenti, Emri, Mbiemri, Nota_mesatara, Numri_Telefonit, Data_Lindjes)
VALUES 
(1, 1, 'Agon', 'Derguti', 8.5, 045456789, '2000-01-01'),
(2, 2, 'Ermira', 'Shehu', 7.2, 044654321, '1999-02-15'),
(3, 3, 'Erina', 'Hyseni', 6.8, 049111222, '2001-05-20'),
(4, 4, 'Yll', 'Gashi', 9.0, 044444555, '2000-11-10'),
(5, 5, 'Diella', 'Muriqi', 7.5, 045888999, '1998-07-03'),
(6, 6, 'Morea', 'Shabani', 8.2, 043222333, '1997-04-25'),
(7, 7, 'Drilon', 'Spahiu', 6.5, 044888777, '2002-09-15'),
(8, 8, 'Andi', 'Ibrahimi', 8.7, 049555444, '1999-12-05'),
(9, 9, 'Luljeta', 'Fazliu', 7.9, 045987456, '2001-03-12'),
(10, 10, 'Florent', 'Humolli', 9.5,044654321, '1996-08-28'),
(11, 11, 'Ardian', 'Makolli', 8.0, 044223344, '1998-06-17'),
(12, 12, 'Lum', 'Berisha', 7.3, 045667788, '2000-04-03'),
(13, 13, 'Dorina', 'Qorraj', 6.6, 049112233, '2002-01-22'),
(14, 14, 'Ardita', 'Aliu', 8.9, 045556677, '1997-10-14'),
(15, 15, 'Granit', 'Krasniqi', 7.7, 044789012, '1999-07-29'),
(16, 16, 'Albina', 'Dedaj', 8.4, 048990011, '1998-12-08'),
(17, 17, 'Fjolla', 'Miftari', 6.9, 045432109, '2001-02-19'),
(18, 18, 'Rron', 'Beqiri', 8.6, 043210987, '1997-09-05'),
(19, 19, 'Vjosa', 'Sylejmani', 7.8, 049876543, '2000-11-30'),
(20, 20, 'Gent', 'Domi', 9.2, 044111222, '1996-04-13'),
(21, 21, 'Anita', 'Lika', 6.7, 048765432, '2001-08-25'),
(22, 22, 'Naim', 'Gashi', 8.3, 045333444, '1999-03-07'),
(23, 23, 'Blerta', 'Jashari', 7.1, 044000111, '2002-06-10'),
(24, 24, 'Valon', 'Berbatovci', 9.1, 043999888, '1998-09-18'),
(25, 25, 'Drenusha', 'Mustafa', 7.4, 044666777, '1997-01-01');


INSERT INTO INTERNSHIP_STUDIME (ID_INTERNSHIP_STUDIME, PRAKTIKA_PROFESIONALE, MUNDESI_PUNESIMI)
VALUES 
(1, 'Praktika1', 'Mundesi1'), 
(2, 'Praktika2', 'Mundesi2'),
(3, 'Praktika3', 'Mundesi3'),
(4, 'Praktika4', 'Mundesi4'),
(5, 'Praktika5', 'Mundesi5'),
(6, 'Praktika6', 'Mundesi6'),
(7, 'Praktika7', 'Mundesi7'),
(8, 'Praktika8', 'Mundesi8'),
(9, 'Praktika9', 'Mundesi9'),
(10, 'Praktika10', 'Mundesi10'),
(11, 'Praktika11', 'Mundesi11'),
(12, 'Praktika12', 'Mundesi12'),
(13, 'Praktika13', 'Mundesi13'),
(14, 'Praktika14', 'Mundesi14'),
(15, 'Praktika15', 'Mundesi15'),
(16, 'Praktika16', 'Mundesi16'),
(17, 'Praktika17', 'Mundesi17'),
(18, 'Praktika18', 'Mundesi18'),
(19, 'Praktika19', 'Mundesi19'),
(20, 'Praktika20', 'Mundesi20'),
(21, 'Praktika21', 'Mundesi21'),
(22, 'Praktika22', 'Mundesi22'),
(23, 'Praktika23', 'Mundesi23'),
(24, 'Praktika24', 'Mundesi24'),
(25, 'Praktika25', 'Mundesi25');


INSERT INTO PROGRAMI_STUDIMOR_i_STUDENTIT (ID_Studenti, ID_INTERNSHIP_STUDIME, ID_Fakultetit)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25);


INSERT INTO Projekti (ID_Asistenti, ID_Studenti, ID_Fakultetit, ID_Stafi_Akademik)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6),
(7, 7, 7, 7),
(8, 8, 8, 8),
(9, 9, 9, 9),
(10, 10, 10, 10),
(11, 11, 11, 11),
(12, 12, 12, 12),
(13, 13, 13, 13),
(14, 14, 14, 14),
(15, 15, 15, 15),
(16, 16, 16, 16),
(17, 17, 17, 17),
(18, 18, 18, 18),
(19, 19, 19, 19),
(20, 20, 20, 20),
(21, 21, 21, 21),
(22, 22, 22, 22),
(23, 23, 23, 23),
(24, 24, 24, 24),
(25, 25, 25, 25);



INSERT INTO Monitorohet (ID_Asistenti, ID_Studenti, ID_Profesori, ID_Stafi_Akademik)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6),
(7, 7, 7, 7),
(8, 8, 8, 8),
(9, 9, 9, 9),
(10, 10, 10, 10),
(11, 11, 11, 11),
(12, 12, 12, 12),
(13, 13, 13, 13),
(14, 14, 14, 14),
(15, 15, 15, 15),
(16, 16, 16, 16),
(17, 17, 17, 17),
(18, 18, 18, 18),
(19, 19, 19, 19),
(20, 20, 20, 20),
(21, 21, 21, 21),
(22, 22, 22, 22),
(23, 23, 23, 23),
(24, 24, 24, 24),
(25, 25, 25, 25);




INSERT INTO PJESEMARRES (ID_Asistenti, ID_Studenti, ID_Profesori, ID_Fakultetit, ID_STAFI_AKADEMIK)
VALUES 
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3),
(4, 4, 4, 4, 4),
(5, 5, 5, 5, 5),
(6, 6, 6, 6, 6),
(7, 7, 7, 7, 7),
(8, 8, 8, 8, 8),
(9, 9, 9, 9, 9),
(10, 10, 10, 10, 10),
(11, 11, 11, 11, 11),
(12, 12, 12, 12, 12),
(13, 13, 13, 13, 13),
(14, 14, 14, 14, 14),
(15, 15, 15, 15, 15),
(16, 16, 16, 16, 16),
(17, 17, 17, 17, 17),
(18, 18, 18, 18, 18),
(19, 19, 19, 19, 19),
(20, 20, 20, 20, 20),
(21, 21, 21, 21, 21),
(22, 22, 22, 22, 22),
(23, 23, 23, 23, 23),
(24, 24, 24, 24, 24),
(25, 25, 25, 25, 25);



INSERT INTO Lenda (ID_Lenda, Emri_Lendes, Numri_Kredive, Numri_Ligjeratave)
VALUES 
(1, 'Hyrje_ne_Programim', 4, 2),
(7, 'Shkenca_Kompjuterike2', 5, 7),
(5, 'DataBaze', 5, 5),
(4, 'Web_Dizajn', 4, 2),
(6, 'Hyrje_ne_Algoritme', 6, 10),
(8, 'Strukture_Diskrete', 6, 6),
(3, 'DataBaze',5, 1),
(2, 'Shkenca_Kompjuterike1', 5, 4),
(9, 'Shkenca_Kompjuterike1', 5, 3),
(10, 'BIEE', 4, 2),
(11, 'Matematike Diskrete', 1, 11),
(12, 'Gjuhe e Huaj', 6, 12),
(13, 'Shkenca Kompjuterike 3', 5, 13),
(14, 'Inxhinieri Softuerike', 5, 14),
(15, 'Analiza Numerike', 1, 15),
(16, 'Teoria e Lojrave', 7, 16),
(17, 'Bazat e Teorise se Kodes', 6, 17),
(18, 'Kerkesat e Sistemeve Operative', 5, 18),
(19, 'Siguria e Te Dhenave', 5, 19),
(20, 'Rrjeta Kompjuterike', 3, 20),
(21, 'Artificial Intelligence', 2, 21),
(22, 'Grafika Kompjuterike', 4, 22),
(23, 'Softueri Ne Kombetare', 2, 23),
(24, 'Procesim Digjital e Sinjaleve', 3, 24),
(25, 'Projekt Integrues', 10, 25);


INSERT INTO Ndegjon (ID_Lenda, ID_Studenti, ID_Fakultetit)
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25);


INSERT INTO Ligjeron (ID_STAFI_AKADEMIK, ID_Lenda, Numri_Asistenteve, Numri_kredive, ID_DEPARTAMENTI_AKADEMIK)
VALUES 
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3),
(4, 4, 4, 4, 4),
(5, 5, 5, 5, 5),
(6, 6, 6, 6, 6),
(7, 7, 7, 7, 7),
(8, 8, 8, 8, 8),
(9, 9, 9, 9, 9),
(10, 10, 10, 10, 10),
(11, 11, 11, 11, 11),
(12, 12, 12, 12, 12),
(13, 13, 13, 13, 13),
(14, 14, 14, 14, 14),
(15, 15, 15, 15, 15),
(16, 16, 16, 16, 16),
(17, 17, 17, 17, 17),
(18, 18, 18, 18, 18),
(19, 19, 19, 19, 19),
(20, 20, 20, 20, 20),
(21, 21, 21, 21, 21),
(22, 22, 22, 22, 22),
(23, 23, 23, 23, 23),
(24, 24, 24, 24, 24),
(25, 25, 25, 25, 25);
       
INSERT INTO Lendet_VITI_III (ID_Lenda, ID_VITI3, Shkenca_Kompjuterike2, Strukture_Diskrete, BIEE)
VALUES 
(1, 3, 'Shkenca_Kompjuterike2 e avancuar', 'Strukture_Diskrete fillestare', 'BIEE e avancuar'),
(2, 2, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete e avancuar', 'BIEE standarde'),
(3, 4, 'Shkenca_Kompjuterike2 standarde', 'Strukture_Diskrete e avancuar', 'BIEE fillestare'),
(4, 5, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete e avancuar', 'BIEE e avancuar'),
(5, 8, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete fillestare', 'BIEE e avancuar'),
(6, 7, 'Shkenca_Kompjuterike2 standarde', 'Strukture_Diskrete standarde', 'BIEE standarde'),
(7, 9, 'Shkenca_Kompjuterike2 e avancuar', 'Strukture_Diskrete standarde', 'BIEE standarde'),
(8, 1, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete fillestare', 'BIEE e avancuar'),
(9, 10, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete standarde', 'BIEE e avancuar'),
(10, 6, 'Shkenca_Kompjuterike2 e avancuar', 'Strukture_Diskrete fillestare', 'BIEE fillestare'),
(11, 14, 'Shkenca_Kompjuterike2 e avancuar', 'Strukture_Diskrete fillestare', 'BIEE e avancuar'),
(12, 16, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete e avancuar', 'BIEE standarde'),
(13, 19, 'Shkenca_Kompjuterike2 standarde', 'Strukture_Diskrete e avancuar', 'BIEE fillestare'),
(14, 20, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete e avancuar', 'BIEE e avancuar'),
(15, 18, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete fillestare', 'BIEE e avancuar'),
(16, 12, 'Shkenca_Kompjuterike2 standarde', 'Strukture_Diskrete standarde', 'BIEE standarde'),
(17, 11, 'Shkenca_Kompjuterike2 e avancuar', 'Strukture_Diskrete standarde', 'BIEE standarde'),
(18, 13, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete fillestare', 'BIEE e avancuar'),
(19, 15, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete standarde', 'BIEE e avancuar'),
(20, 17, 'Shkenca_Kompjuterike2 e avancuar', 'Strukture_Diskrete fillestare', 'BIEE fillestare'),
(21, 21, 'Shkenca_Kompjuterike2 e avancuar', 'Strukture_Diskrete fillestare', 'BIEE e avancuar'),
(22, 22, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete e avancuar', 'BIEE standarde'),
(23, 24, 'Shkenca_Kompjuterike2 standarde', 'Strukture_Diskrete e avancuar', 'BIEE fillestare'),
(24, 23, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete e avancuar', 'BIEE e avancuar'),
(25, 25, 'Shkenca_Kompjuterike2 fillestare', 'Strukture_Diskrete fillestare', 'BIEE e avancuar');

INSERT INTO Lendet_VITI_II (ID_Lenda, ID_VITI2, Shkenca_Kompjuterike1, Web_Dizajn, DataBaze)
VALUES 
(1, 2, 'Shkenca_Kompjuterike1 e avancuar', 'Web_Dizajn fillestare', 'DataBaze standarde'),
(2, 3, 'Shkenca_Kompjuterike1 fillestare', 'Web_Dizajn standarde', 'DataBaze e avancuar'),
(3, 4, 'Shkenca_Kompjuterike1 standarde', 'Web_Dizajn standarde', 'DataBaze e avancuar'),
(4, 1, 'Shkenca_Kompjuterike1 standarde', 'Web_Dizajn fillestare', 'DataBaze fillestare'),
(5, 8, 'Shkenca_Kompjuterike1 fillestare', 'Web_Dizajn e avancuar', 'DataBaze standarde'),
(6, 9, 'Shkenca_Kompjuterike1 standarde', 'Web_Dizajn e avancuar', 'DataBaze standarde'),
(7, 7, 'Shkenca_Kompjuterike1 e avancuar', 'Web_Dizajn standarde', 'DataBaze standarde'),
(8, 5, 'Shkenca_Kompjuterike1 e avancuar', 'Web_Dizajn e avancuar', 'DataBaze standarde'),
(9, 10, 'Shkenca_Kompjuterike1 fillestare', 'Web_Dizajn standarde', 'DataBaze fillestare'),
(10, 6, 'Shkenca_Kompjuterike1 e avancuar', 'Web_Dizajn fillestare', 'DataBaze standarde'),
(11, 11, 'Shkenca_Kompjuterike1 e avancuar', 'Web_Dizajn fillestare', 'DataBaze standarde'),
(12, 12, 'Shkenca_Kompjuterike1 fillestare', 'Web_Dizajn standarde', 'DataBaze e avancuar'),
(13, 14, 'Shkenca_Kompjuterike1 standarde', 'Web_Dizajn standarde', 'DataBaze e avancuar'),
(14, 15, 'Shkenca_Kompjuterike1 standarde', 'Web_Dizajn fillestare', 'DataBaze fillestare'),
(15, 16, 'Shkenca_Kompjuterike1 fillestare', 'Web_Dizajn e avancuar', 'DataBaze standarde'),
(16, 17, 'Shkenca_Kompjuterike1 standarde', 'Web_Dizajn e avancuar', 'DataBaze standarde'),
(17, 18, 'Shkenca_Kompjuterike1 e avancuar', 'Web_Dizajn standarde', 'DataBaze standarde'),
(18, 19, 'Shkenca_Kompjuterike1 e avancuar', 'Web_Dizajn e avancuar', 'DataBaze standarde'),
(19, 20, 'Shkenca_Kompjuterike1 fillestare', 'Web_Dizajn standarde', 'DataBaze fillestare'),
(20, 13, 'Shkenca_Kompjuterike1 e avancuar', 'Web_Dizajn fillestare', 'DataBaze standarde'),
(21, 21, 'Shkenca_Kompjuterike1 fillestare', 'Web_Dizajn standarde', 'DataBaze e avancuar'),
(22, 23, 'Shkenca_Kompjuterike1 standarde', 'Web_Dizajn standarde', 'DataBaze e avancuar'),
(23, 25, 'Shkenca_Kompjuterike1 standarde', 'Web_Dizajn fillestare', 'DataBaze fillestare'),
(24, 22, 'Shkenca_Kompjuterike1 fillestare', 'Web_Dizajn e avancuar', 'DataBaze standarde'),
(25, 24, 'Shkenca_Kompjuterike1 standarde', 'Web_Dizajn e avancuar', 'DataBaze standarde');


INSERT INTO Lendet_VITI_I (ID_Lenda, ID_VITI1, Hyrje_ne_Programim, Hyrje_ne_Algoritme, Matematike)
VALUES 
(1, 5, 'Hyrje_ne_Programim e avancuar', 'Hyrje_ne_Algoritme fillestare', 'Matematike standarde'),
(2, 3, 'Hyrje_ne_Programim fillestare', 'Hyrje_ne_Algoritme standarde', 'Matematike e avancuar'),
(3, 1, 'Hyrje_ne_Programim standarde', 'Hyrje_ne_Algoritme standarde', 'Matematike e avancuar'),
(4, 9, 'Hyrje_ne_Programim standarde', 'Hyrje_ne_Algoritme fillestare', 'Matematike fillestare'),
(5, 8, 'Hyrje_ne_Programim fillestare', 'Hyrje_ne_Algoritme e avancuar', 'Matematike standarde'),
(6, 4, 'Hyrje_ne_Programim standarde', 'Hyrje_ne_Algoritme e avancuar', 'Matematike standarde'),
(7, 7, 'Hyrje_ne_Programim e avancuar', 'Hyrje_ne_Algoritme standarde', 'Matematike standarde'),
(8, 10, 'Hyrje_ne_Programim e avancuar', 'Hyrje_ne_Algoritme e avancuar', 'Matematike standarde'),
(9, 2, 'Hyrje_ne_Programim fillestare', 'Hyrje_ne_Algoritme standarde', 'Matematike fillestare'),
(10, 6, 'Hyrje_ne_Programim e avancuar', 'Hyrje_ne_Algoritme fillestare', 'Matematike standarde'),
(11, 11, 'Hyrje_ne_Programim e avancuar', 'Hyrje_ne_Algoritme fillestare', 'Matematike standarde'),
(12, 12, 'Hyrje_ne_Programim fillestare', 'Hyrje_ne_Algoritme standarde', 'Matematike e avancuar'),
(13, 14, 'Hyrje_ne_Programim standarde', 'Hyrje_ne_Algoritme standarde', 'Matematike e avancuar'),
(14, 15, 'Hyrje_ne_Programim standarde', 'Hyrje_ne_Algoritme fillestare', 'Matematike fillestare'),
(15, 16, 'Hyrje_ne_Programim fillestare', 'Hyrje_ne_Algoritme e avancuar', 'Matematike standarde'),
(16, 17, 'Hyrje_ne_Programim standarde', 'Hyrje_ne_Algoritme e avancuar', 'Matematike standarde'),
(17, 18, 'Hyrje_ne_Programim e avancuar', 'Hyrje_ne_Algoritme standarde', 'Matematike standarde'),
(18, 19, 'Hyrje_ne_Programim e avancuar', 'Hyrje_ne_Algoritme e avancuar', 'Matematike standarde'),
(19, 20, 'Hyrje_ne_Programim fillestare', 'Hyrje_ne_Algoritme standarde', 'Matematike fillestare'),
(20, 13, 'Hyrje_ne_Programim e avancuar', 'Hyrje_ne_Algoritme fillestare', 'Matematike standarde'),
(21, 21, 'Hyrje_ne_Programim fillestare', 'Hyrje_ne_Algoritme standarde', 'Matematike e avancuar'),
(22, 23, 'Hyrje_ne_Programim standarde', 'Hyrje_ne_Algoritme standarde', 'Matematike e avancuar'),
(23, 22, 'Hyrje_ne_Programim standarde', 'Hyrje_ne_Algoritme fillestare', 'Matematike fillestare'),
(24, 24, 'Hyrje_ne_Programim fillestare', 'Hyrje_ne_Algoritme e avancuar', 'Matematike standarde'),
(25, 25, 'Hyrje_ne_Programim standarde', 'Hyrje_ne_Algoritme e avancuar', 'Matematike standarde');




--FILLIMI I KOMANDAVE PER UPDATE
--(2 jon bo update qitu)
UPDATE Lendet_VITI_II 
SET Shkenca_Kompjuterike1 = 'Shkenca_Kompjuterike1 fillestare'
WHERE ID_Lenda = 1 or ID_Lenda = 2;

--(2 jon bo update qitu)
UPDATE Lendet_VITI_III 
SET Shkenca_Kompjuterike2 = 'Shkenca_Kompjuterik2 fillestare'
WHERE ID_Lenda = 2 or ID_Lenda = 6;

--(2 jon bo update qitu)
UPDATE Studenti 
SET Emri = 'Lind'
WHERE ID_Studenti = 1 or ID_Studenti = 3;

--(1 jon bo update qitu)
update Numri_Telefonit 
set Numri_Telefonit = 049438421
where Numri_Telefonit = 044445566

--(13 jon bo update qitu)	
update Lendet_VITI_III 
set BIEE = 'BIEE fillestare'
where BIEE = 'BIEE e avancuar'


------------------------------------------


--FILLIMI I KOMANDAVE PER DELETE
--(4 jon fshi qitu)
Delete from Lendet_VITI_I 
where Hyrje_ne_Programim = 'Hyrje_ne_Programim e avancuar'

--(1 oshte fshi qitu)
Delete from Ligjeron 
where ID_Lenda = 5

--(1 oshte fshi qitu)
Delete from Lendet_VITI_III 
where ID_VITI3 = 9


------------------------------------------


--Queries te thjeshta me nje tabele

--LIND GECI

--------------------------------------------
--1. Te pritohen emrat e stafit akademik pa u perseritur
SELECT DISTINCT  s.Emri
FROM STAFI_AKADEMIK s

--2.Te printohet numri i kredive per lendet me id 10
Select l.Numri_Kredive
from Lenda l
where l.ID_Lenda = 10

--3.Te printohen studentet te cilen numrin e telefonit e kane 045556677
select *
from Studenti s
where s.Numri_Telefonit = 045556677

--4.Te printohen asistentet te cilet lenden e magjistratures e kane Ligjeratat per magjistrature ne Matematike
select *
from Asistenti a
where Ligjeratat_Magjistratures = 'Ligjeratat per magjistrature ne Matematike'
--------------------------------------------

--Queries te thjeshta me nje tabele

--ALKETA RAMA

--------------------------------------------
--1.Të tregohen emrat e fakulteteve që ndodhen në qytetin e Prishtinës
SELECT Emri
FROM FAKULTETI 
WHERE Qyteti = 'Prishtine';

---2.Të printohen informacionet e kontaktit nga departamenti akademik
SELECT Info_kontaktuese 
FROM DEPARTAMENTI_AKADEMIK;

--3.Të tregohen  të gjitha kolonat për të gjitha të dhënat në tabelën 'Profesori'
SELECT *
FROM Profesori;

--4.Merr të gjitha rekordet nga tabela Asistenti ku fusha Ligjeratat_Magjistratures është 'Ligjeratat per magjistrature ne Inxhinieri Elektrike'
SELECT *
FROM Asistenti
WHERE Ligjeratat_Magjistratures = 'Ligjeratat per magjistrature ne Inxhinieri Elektrike';
--------------------------------------------

--Queries te thjeshta me dy e me shume tabela

--LIND GECI

--------------------------------------------
--1. Te paraqitet informacione rreth stafit akademik qe kane numer te telefonit 044345678
Select s.Departamentin_Punues, s.Emri, s.Mbiemrin, s.Titulli_Akademik, n.Numri_Telefonit, n.Prefixi
from STAFI_AKADEMIK s, Numri_Telefonit n
where s.ID_STAFI_AKADEMIK = n.ID_STAFI_AKADEMIK
and n.Numri_Telefonit = 044345678

--2.Te paraqiten informacione rreth profesoreve te cilet emrin e diolomes e kane Diploma 4
select p.ID_DEPARTAMENTI_AKADEMIK, p.Ligjeratat_Doktorratures, d.Kredite_Akademike
from Profesori p, DIPLOMA_PROGRAMIT_STUDIMOR d
where p.ID_Profesori = d.ID_Profesori
and d.Emri_Diplomes = 'Diploma 4'

--3.Te paraqiten informacione rreth asistenteve te cilet kane llogari dhe id  = 5
select a.ID_Asistenti, a.Ligjeratat_Magjistratures
from Asistenti a, LLOGARIA ll
where a.ID_Asistenti = ll.ID_Asistenti
and a.ID_Asistenti = 5

--4.Te paraqiten informacione rreth lendeve te vitit te 3 te cilat kane numer te kredive  5
Select l.Emri_Lendes, l.Numri_Kredive, l.Numri_Ligjeratave
from Lenda l, Lendet_VITI_III l3
where l.ID_Lenda = l3.ID_Lenda
and l.Numri_Kredive = 5
--------------------------------------------

--Queries te thjeshta me dy e me shume tabela

--ALKETA RAMA

--------------------------------------------
--1.Zgjidh të gjitha të dhënat për studentët, programet studimore të studentit dhe praktikat studimore 
--kur nota mesatare e studentit është mbi 8 dhe lloji i praktikës është 'Praktika1''
SELECT *
FROM Studenti S, PROGRAMI_STUDIMOR_i_STUDENTIT P, INTERNSHIP_STUDIME I
WHERE S.ID_Studenti = P.ID_Studenti AND P.ID_INTERNSHIP_STUDIME = I.ID_INTERNSHIP_STUDIME
AND S.Nota_mesatara > 8 AND I.PRAKTIKA_PROFESIONALE = 'Praktika1';

--2.Trego emrin e lëndës, emrin dhe mbiemrin e personave që janë 'Dr' dhe japin ligjerata në ato lëndë
SELECT L.Emri_Lendes, S.Emri, S.Mbiemrin
FROM Lenda L, Ligjeron LI, STAFI_AKADEMIK S
WHERE S.Titulli_Akademik = 'Dr' 
AND S.ID_STAFI_AKADEMIK = LI.ID_STAFI_AKADEMIK AND LI.ID_Lenda = L.ID_Lenda;

--3.Zgjidh emrin, mbiemrin, ID-në e asistentit, llojin e ligjeratave për magjistraturë dhe ID departamentit 
--për të gjithë asistentët që janë pjesë e një projekti dhe ky projekt ka një studen
SELECT s.Emri, s.Mbiemri, a.ID_Asistenti, a.Ligjeratat_Magjistratures, a.ID_DEPARTAMENTI_AKADEMIK
FROM Asistenti A, Projekti P, Studenti S
WHERE A.ID_Asistenti = P.ID_Asistenti
 AND P.ID_Studenti = S.ID_Studenti;

--4.Trego emrin, mbiemrin, ID e asistentit dhe ID e fakultetit për të gjithë studentët që janë pjesë e një projekti dhe ky projekt ka një fakultet me ID 3
SELECT s.Emri, s.Mbiemri, p.ID_Asistenti, p.ID_Fakultetit
FROM Studenti s, Projekti p
WHERE s.ID_Studenti = p.ID_Studenti
AND p.ID_Fakultetit = 3;
--------------------------------------------


--Queries te avancuara me dy e me shume tabela

--LIND GECI

--------------------------------------------
--1.Te paraqitet informacione rreth asistentit qe ndjeke lenden e magjistratures dhe ka id
--e asistentit senior 105
Select a.ID_Asistenti, a.ID_STAFI_AKADEMIK, a.Ligjeratat_Magjistratures
from Asistenti a full join Ndjeke n
on a.ID_Asistenti = n.ID_Asistenti inner join 
Lenda_Magjistratures l on n.ID_Asistenti = l.ID_Asistenti
where a.ID_ASISTENTI_SENIOR = 105


--2.Te paraqiten informacione rreth stafit akademit perkatsisht asistentit i cili ka mbiemrin Shehu
select s.Emri, s.Departamentin_Punues, a.ID_Asistenti
from STAFI_AKADEMIK s inner join Asistenti a
on s.ID_STAFI_AKADEMIK = a.ID_STAFI_AKADEMIK
where s.Mbiemrin = 'Shehu'

--3.Te paraqiten informacione rreth profesorit i cili nga diploma e programit studimor ka emrin
--e diplomes Diploma 1
select p.ID_Profesori, p.Ligjeratat_Doktorratures, d.Kredite_Akademike
from Profesori p left join DIPLOMA_PROGRAMIT_STUDIMOR d
on p.ID_Profesori = d.ID_Profesori
where d.Emri_Diplomes = 'Diploma 1'


--4.Te paraqiten te dhena rreth studentit i cili ndegjon lenden me emer siguria e te dhenave
select s.Emri, s.Mbiemri, s.Data_Lindjes, s.Nota_mesatara, l.ID_Lenda
from Studenti s right join Ndegjon n
on s.ID_Studenti = n.ID_Studenti inner join
Lenda l on l.ID_Lenda = n.ID_Lenda
where l.Emri_Lendes = 'Siguria e Te Dhenave'
--------------------------------------------

--Queries te avancuara me dy e me shume tabela

--ALKETA RAMA

--------------------------------------------------------------------
--1.Trego emrin, mbiemrin, ID e profesorit dhe ID e asistentit për secilin student që është monitoruar
SELECT s.Emri , s.Mbiemri, m.ID_Profesori, m.ID_Asistenti
FROM Studenti s INNER JOIN Monitorohet m
ON s.ID_Studenti = m.ID_Studenti;

--2.Paraqit ID e studentit, emrin, mbiemrin dhe ID e fakultetit për të gjithë studentët, duke përfshirë ata që nuk janë në lidhje me ndonjë fakultet
SELECT s.ID_Studenti, s.Emri, s.Mbiemri, f.ID_Fakultetit
FROM Studenti s RIGHT JOIN Fakulteti f ON s.ID_Fakultetit = f.ID_Fakultetit
WHERE s.ID_Studenti IS NOT NULL; 

--3.Trego ID e profesorit, ligjeratat për doktoraturë të profesorit dhe emrin e departamentit akademik 
--në të cilin profesori është përfshirë, duke përfshirë edhe departamentet pa profesor
SELECT p.ID_Profesori, p.Ligjeratat_Doktorratures, d.Emri_Departamentit
FROM Profesori p FULL JOIN Departamenti_Akademik d 
ON p.ID_DEPARTAMENTI_AKADEMIK = d.ID_DEPARTAMENTI_AKADEMIK;

--4.Zgjidh emrin e departamentit, kryetarin e departamentit dhe ID-në e stafit akademik në rastin kur stafi akademik ka titullin 'Msc'
SELECT d.Emri_Departamentit AS Emri, d.Kreu_Departamentit AS Mbiemri, s.ID_STAFI_AKADEMIK
FROM DEPARTAMENTI_AKADEMIK d
RIGHT JOIN STAFI_AKADEMIK s ON d.ID_DEPARTAMENTI_AKADEMIK = s.ID_DEPARTAMENTI_AKADEMIK
WHERE s.Titulli_Akademik = 'Msc';
--------------------------------------------

--Subqueries te thjeshta

--LIND GECI

--------------------------------------------
--1.Te paraqitet studenti i cili ka noten mesatare me te madhe se maeasarja e notave te studenteve
select s.Emri, s.Mbiemri, s.Numri_Telefonit, s.Nota_mesatara
from Studenti s 
where s.Nota_mesatara = (Select max(si.Nota_mesatara) from Studenti si)


--2.Te paraqitet te gjithe stafi akademik i cili numrin e telefonit e kane +383
select nr.ID_STAFI_AKADEMIK, nr.Numri_Telefonit
from Numri_Telefonit nr
where nr.Prefixi >all (Select ni.Prefixi from Numri_Telefonit ni
					where ni.Prefixi like '+383')


--3.Te paraqiten informacione rreth lendes ku numrin i kredive eshte me i vogel se mesatarja e 
--numrint te kredive te lendeve te tjera
Select l.Emri_Lendes, l.ID_Lenda, l.Numri_Kredive
from Lenda l
where l.Numri_Kredive < (Select AVG(li.Numri_Kredive) from Lenda li)
order by l.Numri_Kredive desc

--4.Te paraqiten informacione rreth diplomes te programit studimor kur numrin i kredive akademike
--eshte i barabarte me minimumin e kredive akademike
select d.Kredite_Akademike, d.Emri_Diplomes
from DIPLOMA_PROGRAMIT_STUDIMOR d
where d.Kredite_Akademike = (Select min(d.Kredite_Akademike) from DIPLOMA_PROGRAMIT_STUDIMOR d)
--------------------------------------------

--Subqueries te thjeshta

--ALKETA RAMA

--------------------------------------------
---1.Përshkruaj numrin e departamenteve të drejtuar nga një person me titullin akademik 'Dr' dhe sipas ID të fakultetit
SELECT s.ID_Fakultetit, COUNT(*) AS Kreu_Departamentit
FROM STAFI_AKADEMIK s
WHERE s.Titulli_Akademik = 'Dr'
GROUP BY s.ID_Fakultetit;

--2.Trego të dhënat e diplomës së një profesori që jep ligjerata për doktoraturë në matematikë
SELECT d.ID_INDEKSI_DIPLOMES, d.Emri_Diplomes, d.Programi_Studimor
FROM DIPLOMA_PROGRAMIT_STUDIMOR d
WHERE d.ID_Profesori = (SELECT d.ID_Profesori FROM Profesori d WHERE d.Ligjeratat_Doktorratures = 'Ligjeratat per doktorature ne Matematike');

--3.Paraqit të dhënat e diplomës së një profesori që jep ligjerata për doktoraturë në matematikë
SELECT *
FROM STAFI_AKADEMIK s
WHERE s.ID_STAFI_AKADEMIK = (SELECT s.ID_STAFI_AKADEMIK FROM Ligjeron s WHERE s.Numri_Asistenteve = (SELECT MAX(s.Numri_Asistenteve) FROM Ligjeron s));

--4.Paraqit të gjitha të dhënat për studentët që janë pjesëmarrës në një projekt dhe kanë ID të barabartë me 2 në tabelën PJESEMARRES
SELECT *
FROM STUDENTI s
WHERE s.ID_Studenti IN (SELECT s.ID_Studenti FROM PJESEMARRES s WHERE s.ID_Studenti = 2);
--------------------------------------------


--Subqueries te avancuara

--LIND GECI 

--------------------------------------------
--1.Te paraqiten informacione rreth stafit akademik ne lidhje me numrin e telefonit
--ku prefixi eshte ne prefixin e numrave te telefonit

Select s.Emri, s.Mbiemrin, s.Departamentin_Punues, nr.Prefixi
from STAFI_AKADEMIK s inner join
Numri_Telefonit nr on s.ID_STAFI_AKADEMIK = nr.ID_STAFI_AKADEMIK
where nr.Prefixi in (Select nr.Prefixi from Numri_Telefonit)


--2.Te paraqiten informacione rreth lendes ne pergjithesi me lendet e vitit te 3 kur numri
--i kredive eshte me i madh se mesatarja e numrit te kredive te te gjithe lendeve

Select l.ID_Lenda, sum(l.Numri_Kredive) as 'Numri i kredive'
from Lenda l inner join Lendet_VITI_I li
on l.ID_Lenda = li.ID_Lenda
group by l.ID_Lenda
having sum(l.Numri_Kredive) > (Select avg(l.Numri_Kredive)
								from Lenda l inner join Lendet_VITI_I li
								on l.ID_Lenda = li.ID_Lenda)


--3.Te selektohet studentet te cilet kane note me te madhe se mesatarja dhe note me te madhe se 7
SELECT p.ID_Studenti,  s.Emri, (SELECT avg(s.Nota_mesatara) FROM Studenti s WHERE s.ID_Studenti = p.ID_Studenti and s.Nota_mesatara>7) AS mesatarja 
FROM PJESEMARRES p INNER JOIN Studenti s ON p.ID_Studenti = s.ID_Studenti;

--4.Te selektohen te pjesemarrsit te dilet kane noten mesatare
select *
from PJESEMARRES  p, (Select si.ID_Studenti, avg(si.Nota_mesatara) as mesatarja
from Studenti si
group by si.ID_Studenti) as nota
where p.ID_Studenti = nota.ID_Studenti
--------------------------------------------

--Subqueries te avancuara

--ALKETA RAMA

--------------------------------------------
--1.Trego ID e personave akademikë me titullin "Dr.Sc" që janë edhe profesorë me ligjëratat e doktoratës
SELECT s.ID_STAFI_AKADEMIK
FROM Stafi_Akademik s WHERE s.Titulli_Akademik = 'Dr.Sc' AND ID_STAFI_AKADEMIK IN (
SELECT s.ID_STAFI_AKADEMIK 
FROM Profesori p 
WHERE p.Ligjeratat_Doktorratures IS NOT NULL);


--2.Trego ID e profesorëve, ligjeratat e doktoratës dhe kreditet akademike për diplomën me emrin 'Diploma 1'
SELECT p.ID_Profesori, p.Ligjeratat_Doktorratures, d.Kredite_Akademike
FROM Profesori p
LEFT JOIN (
    SELECT ID_Profesori, Kredite_Akademike
    FROM DIPLOMA_PROGRAMIT_STUDIMOR d
    WHERE d.Emri_Diplomes = 'Diploma 1') d ON p.ID_Profesori = d.ID_Profesori;


--3.Paraqit ID e asistentëve, ligjeratat për magjistraturë dhe numrin e stafeve akademike ku ata janë marrin pjesë
SELECT a.ID_Asistenti, a.Ligjeratat_Magjistratures, COUNT(d.ID_STAFI_AKADEMIK) AS Numri_Stafeve_Akademike
FROM Asistenti a
LEFT JOIN STAFI_AKADEMIK d ON a.ID_Asistenti = d.ID_STAFI_AKADEMIK
GROUP BY a.ID_Asistenti, a.Ligjeratat_Magjistratures;

--4.Paraqit ID e diplomave, emrin e diplomave dhe programin studimor për profesorët që japin ligjerata për doktoraturë në matematikë
SELECT d.ID_INDEKSI_DIPLOMES, d.Emri_Diplomes, d.Programi_Studimor
FROM DIPLOMA_PROGRAMIT_STUDIMOR d
WHERE d.ID_Profesori IN (
    SELECT p.ID_Profesori
    FROM Profesori p
    WHERE p.Ligjeratat_Doktorratures = 'Ligjeratat per doktorature ne Matematike'
);
--------------------------------------------




--8 query/subquery me algjeber relacionare

--LIND GECI 

--------------------------------------------
--1. Te shfaqen studentet te cilet kane ndegjuar lenden e Analize Numerike dhe po ashtu lenden e Artificial Intelligence
create view VIEW1 as (
select n.ID_Studenti
from Ndegjon n inner join Lenda l
on n.ID_Lenda = l.ID_Lenda
where l.Emri_Lendes like 'Analiza Numerike'
union
select n.ID_Studenti
from Ndegjon n inner join Lenda l
on n.ID_Lenda = l.ID_Lenda
where l.Emri_Lendes like 'Artificial Intelligence'
)
select *
from Studenti s
where s.ID_Studenti in (select * from VIEW1)


--2.--1. Te shfaqen studentet te cilet kane ndegjuar lenden e Analize Numerike dhe jo Artificial Intelligence
create view VIEW2 as (
select n.ID_Studenti
from Ndegjon n inner join Lenda l
on n.ID_Lenda = l.ID_Lenda
where l.Emri_Lendes like 'Analiza Numerike'
except
select n.ID_Studenti
from Ndegjon n inner join Lenda l
on n.ID_Lenda = l.ID_Lenda
where l.Emri_Lendes like 'Artificial Intelligence'
)
select *
from Studenti s
where s.ID_Studenti in (select * from VIEW2)


--3. Te shfaqen studentet te cilet kane ndegjuar lenden e Shkenca_Kompjuterike1 dhe Shkenca_Kompjuterike1
create view VIEW4 as (
select n.ID_Studenti
from Ndegjon n inner join Lenda l
on n.ID_Lenda = l.ID_Lenda
where l.Emri_Lendes like 'Shkenca_Kompjuterike1'
intersect
select n.ID_Studenti
from Ndegjon n inner join Lenda l
on n.ID_Lenda = l.ID_Lenda
where l.Emri_Lendes like 'Shkenca_Kompjuterike1'
)
select *
from Studenti s
where s.ID_Studenti in (select * from VIEW4)

--4. Te shfaqen studentet te cilet kane numrin e kredive 5 dhe ndjekin lenden Shkenca_Kompjuterike1
create view VIEW5 as (
select n.ID_Studenti
from Ndegjon n inner join Lenda l
on n.ID_Lenda = l.ID_Lenda
where l.Numri_Kredive  = 5
intersect
select n.ID_Studenti
from Ndegjon n inner join Lenda l
on n.ID_Lenda = l.ID_Lenda
where l.Emri_Lendes like 'Shkenca_Kompjuterike1'
)
select *
from Studenti s
where s.ID_Studenti in (select * from VIEW5)
--------------------------------------------

--Subqueries te avancuara

--ALKETA RAMA

--------------------------------------------
--1.Trego profesorët që janë pjesëmarrës dhe kanë ID_STAFI_AKADEMIK '12' dhe '13'
CREATE VIEW VIEW8 AS (
    SELECT p.ID_Profesori
    FROM Profesori p  INNER JOIN PJESEMARRES pm 
    ON p.ID_STAFI_AKADEMIK = pm.ID_STAFI_AKADEMIK
    WHERE p.ID_STAFI_AKADEMIK = '12'
    UNION
    SELECT p.ID_Profesori
    FROM Profesori p  INNER JOIN PJESEMARRES pm 
    ON p.ID_STAFI_AKADEMIK = pm.ID_STAFI_AKADEMIK
    WHERE p.ID_STAFI_AKADEMIK = '13'
)


SELECT *
FROM Profesori p
WHERE p.ID_Profesori IN (SELECT* FROM VIEW8);

--2.Trego profesorët që janë pjesëmarrës dhe kanë ID_STAFI_AKADEMIK '12' e jo '13'
CREATE VIEW VIEW9 AS (
    SELECT p.ID_Profesori
    FROM Profesori p INNER JOIN PJESEMARRES pm 
    ON p.ID_STAFI_AKADEMIK = pm.ID_STAFI_AKADEMIK
    WHERE p.ID_STAFI_AKADEMIK = '12'
    EXCEPT
    SELECT p.ID_Profesori
    FROM Profesori p INNER JOIN PJESEMARRES pm 
    ON p.ID_STAFI_AKADEMIK = pm.ID_STAFI_AKADEMIK
    WHERE p.ID_STAFI_AKADEMIK = '13'
)


SELECT *
FROM Profesori p
WHERE p.ID_Profesori IN (SELECT* FROM VIEW9);


--3.Trego profesorët që janë pjesëmarrës dhe kanë ID_STAFI_AKADEMIK '12' me '13'
CREATE VIEW VIEW10 AS (
    SELECT p.ID_Profesori
    FROM Profesori p INNER JOIN PJESEMARRES pm 
    ON p.ID_STAFI_AKADEMIK = pm.ID_STAFI_AKADEMIK
    WHERE p.ID_STAFI_AKADEMIK = '12'
   INTERSECT
    SELECT p.ID_Profesori
    FROM Profesori p INNER JOIN PJESEMARRES pm 
    ON p.ID_STAFI_AKADEMIK = pm.ID_STAFI_AKADEMIK
    WHERE p.ID_STAFI_AKADEMIK = '12'
)


SELECT *
FROM Profesori p
WHERE p.ID_Profesori IN (SELECT* FROM VIEW10);

--4.Trego ID e profesorëve të cilët japin ligjerata për diplomën me emër 'Diploma 2' dhe 'Diploma 3
CREATE VIEW VIEW12 AS (
    SELECT p.ID_Profesori
    FROM Profesori p INNER JOIN DIPLOMA_PROGRAMIT_STUDIMOR dp 
    ON p.ID_Profesori = dp.ID_Profesori 
    WHERE dp.Emri_Diplomes LIKE 'Diploma 2'
    UNION
    SELECT p.ID_Profesori
    FROM Profesori p INNER JOIN DIPLOMA_PROGRAMIT_STUDIMOR dp 
    ON p.ID_Profesori = dp.ID_Profesori 
    WHERE dp.Emri_Diplomes LIKE 'Diploma 3'
)

SELECT *
FROM Profesori p
WHERE p.ID_Profesori IN (SELECT* FROM VIEW12);

---------------------------------------------------



--8 Proceduara të ruajtura

--LIND GECI

---------------------------------------------------
--1.Te paraqitet informacion rreth studentit me programin studimor ku te caktohet nje id si parameter
--dhe ne baze te saj te paraqitet studenti
create procedure p2(@id int)
as
begin
	select s.Emri, s.Mbiemri, s.Data_Lindjes
	from Studenti s inner join PROGRAMI_STUDIMOR_i_STUDENTIT p
	on s.ID_Studenti = p.ID_Studenti
	where s.ID_Studenti = @id;
end
EXEC p2 @id = 5;


--2.Te caktohet kushti me ane te case per noten e studentit rreth programit studimor
select
	CASE
	when s.Nota_mesatara>=8.5 then  'Student i mire'
	when s.Nota_mesatara <= 8 then 'Student jo i mire'
	else 'Nuk ka hyre ne provim'
	END as 'Nota'
from Studenti s inner join PROGRAMI_STUDIMOR_i_STUDENTIT p
on s.ID_Studenti = p.ID_Studenti


--3.Duke perdorur while te printohen numrat nga 1 deri 5
declare @count int = 0
while(@count <=5)
begin
	
	set @count = @count + 1
	print @count
end
---------------------------------------------------

----Proceduara të ruajtura

--ALKETA RAMA

---------------------------------------------------
--1.Të gjendet lista e studentëve që janë të regjistruar në një lëndë të caktuar.
CREATE PROCEDURE StudentiLenda
    @p_Id INT
AS
BEGIN
    SELECT s.*
    FROM Studenti s
    JOIN Ndegjon n ON s.ID_Studenti = n.ID_Studenti
    WHERE n.ID_Lenda = @p_Id;
END;

EXEC StudentiLenda @p_Id = 5;

--2.Shfaq numrat nga 1 deri në 20 duke përdorur while
declare @count int = 0
while(@count <=20)
begin
	
	set @count = @count + 1
	print @count
end

--3. Kërkon të përditësoj numrin e telefonit të një studenti të caktuar
CREATE PROCEDURE NumriStudenti (@studentID INT, @newNumri_Telefonit INT)
AS
BEGIN
    UPDATE Studenti
    SET Numri_Telefonit = @newNumri_Telefonit
    WHERE ID_Studenti = @studentID;
END;
EXEC NumriStudenti @studentID = 3, @newNumri_Telefonit = 44223254;


--4.Kërkon të përditësoj info kontaktues për një staf akademik të caktuar.

CREATE PROCEDURE StafiInfo (@ID_Stafi_Akademik INT, @newInfo_kontaktuese VARCHAR(255))
AS
BEGIN
    UPDATE STAFI_AKADEMIK
    SET Info_kontaktuese = @newInfo_kontaktuese
    WHERE ID_STAFI_AKADEMIK = @ID_Stafi_Akademik;
END;

EXEC StafiInfo 16, N'mberisha@gmail.com';






