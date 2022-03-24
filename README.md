# FSBtex

FSB LaTeX template za završne, diplomske, seminarske radove i projekt.

## Potrebni programi:

Za operacijski sustav Windows:
1. [MiKTeX](https://miktex.org/)
2. [Texmaker](https://www.xm1math.net/texmaker/)

Za operacijski sustav Ubuntu:
1. sudo apt install texlive-full
2. [Texmaker](https://www.xm1math.net/texmaker/) - linux verzija

Dodatni cross-platform program za uređivanje literature [JabRef](https://www.jabref.org/)

# Kako koristiti FSBtex LaTeX stil
<p>
Potrebno je sa GitHub repozitorija skinuti najnoviju verziju klase kao zip datoteku te iz nje kopirati FSBtex.cls i slike u direktorij unutar kojeg će se pisati seminar, završni ili diplomski rad.
Nakon toga potrebno je napraviti glavnu <span style="color:#00579e"><b><i>tex</i></b></span> datoteku unutar koje će se pozvati FSBtex klasa.
Inicijalizacija klase vrši se na slijedeći način:
</p>

```latex
\documentclass[tip_rada, jezik, *dodatne_opcije]{FSBtex}
```
</br>
gdje ulazni argument <span style="color:#00579e"><b><i>tip_rada</i></b></span> može bititi jedna os slijedećih opcija:

* seminar,
* zavrsni,
* diplomski,
* projekt,
* skripta,
* zadatak.
<p>Za svaku od opcija moguće je definirati varijablu <span style="color:#00579e"><b><i>jezik</i></b></span> koja može poprimiti vrijednosti <b><i>hrvatski</i></b> i <b><i>engleski</i></b>.
Ukoliko se ne definira jezik rada smata se da se piše na hrvatskom jeziku.
</P>
<p>
Dodatnu opciju moguće je definirati samo za skriptu i njen naziv je <b><i>fancy</i></b>.
Ona omogućuje da se u naslov poglavlja stavi slika te se preko nje napiše naslov tog poglavlja.
</p>

## Naredbe definirane unutar FSBtex klase

+ <code>\AKgodina{2021/2022.}</code> &#8594; akademska godina za seminarski rad
+ <code>\author{Marko Markić}</code> &#8594; ime autora rada
+ <code>\kolegij{Pneumatski i hidraulički servo sustavi}</code> &#8594; naziv kolegija za tekst seminarskog zadatka
+ <code>\LiteraturaPostavke</code> &#8594; postavlja postavke za ispis literature
+ <code>\NaslovnaStrana</code> &#8594; generira sve naslovne strane rada
+ <code>\mentor{prof. dr. sc. Pero Perić}</code> &#8594; mentora rada
+ <code>\mentorDva{prof. dr. sc. Pero Perić}</code> &#8594; komentor rada
+ <code>\title{...}</code> &#8594; naslov rada
+ <code>\titleENG{...}</code> &#8594; naslov rada na engleskom jeziku
+ <code>\keywords{...}</code> &#8594; ključne riječi rada na engleskom jeziku
+ <code>\kljucnerijeci{...}</code> &#8594; ključne riječi rada na hrvatskom jeziku
+ <code>\zahvala{...}</code> &#8594; zahvala za diplomski i završni rad
+ <code>\zadatak{...}</code> &#8594; učitava pdf datoteku završnog, diplomskog ili seminarskog rada

## Okoline definirane unutar FSBtex klase
<p>Okolina se definira na sljedeči način i moguće joj je dodijeliti dodatne argumente:</p>

```latex
\begin{ime_okoline}[dodatni_argumenti]
Sve što želimo da se nalazi unutar okoline
\end{ime_okoline}
```
<p>Predefinirane okoline:</p>

+ <code>abstract</code> &#8594; sažetak rada na engleskom jeziku
+ <code>sazetak</code> &#8594; sažetak rada na hrvatskom jeziku
+ <code>SeminarskiZadatak</code> &#8594; definira izgled seminarskog zadatka; dodatni argument je ime studenta
  <hr>

+ <code>theorem</code> &#8594; okolina za pisanje matematičkog teorema; dodatni argument ime teorema
+ <code>definition</code> &#8594; okolina za pisanje definicije; dodatni argument ime definicije
+ <code>remark</code> &#8594; okolina za pisanje napomene
+ <code>proof</code> &#8594; okolina za pisanje dokaza; dodatni argument ime dokaza
+ <code>exercise</code> &#8594; okolina za pisanje zadatka; dodatni argument ime zadatka
+ <code>example</code> &#8594; okolina za pisanje primjera; dodatni argument ime primjera

<p><b>Napomena: sve okoline mogu se definirat sa i bez dodatnog argumenta!</b></p>

## Primjeri tipova rada
### Tip rada: seminar
```latex
\documentclass[seminar]{FSBtex}

% postavke dokumenta
\author{Marko Markić}
\mentor{prof. dr. sc. Pero Perić, dip. ing.}
\title{Optimalna sinteza mehanizma tlačnog cilindra}
\zadatak{slike/zadatak.pdf}

\begin{document}
\NaslovnaStrana

% pocetak brojanja rada od prve stranice
\pagebreak
\setcounter{page}{1}
\pagenumbering{arabic}

%-------------------------------------------
% ovdje ide ostatak rada
%-------------------------------------------

\LiteraturaPostavke
\bibliography{literatura}

%-------------------------------------------
%	ovdje idu prilozi
%-------------------------------------------
%\appendix
%\chapter{Prilog matematička notacija}
% Prvi dodatak

\end{document}
```

### Tip rada: završni i diplomski rad
<p>Ukoliko se radi o diplomskom radu ili projektu onda je opcije diplomski i projekt.</p>

```latex
\documentclass[zavrsni]{FSBtex}

% postavke rada
\author{Marko Markić}
\mentor{prof. dr. sc. Miki Mikić, dip. ing.}
\mentorDva{dr. sc. Pero perić, dip. ing.}

\zahvala{
Izjavljujem da sam ovaj rad izradio samostalno koristeći stečena znanja tijekom studija i navedenu literaturu.\\

Zahvaljujem se svom mentoru \textbf{prof. dr. sc. Peri Periću} što mi je omogućio da napišem ovaj rad......
}

\zadatak{slike/zadatak.pdf}

\kljucnerijeci{PID; LQR; hidraulika}
\keywords{PID; LQR; hydraulics}

\begin{document}
\NaslovnaStrana

% u slucaju enegleske verzije potrebno obrnut redoslijed sazetaka
\begin{sazetak}
Ovdje ide sažetak rada na hrvatskom\\
\end{sazetak}

\begin{abstract}
Ovdje ide sažetak rada na engleskom jeziku\\
\end{abstract}

%-------------------------------------------
%	OVDJE IDE OSTATAK RADA I SVA POGLAVLJA
%-------------------------------------------
\pagebreak
\setcounter{page}{1}
\pagenumbering{arabic}

%-------------------------------------------
% ovdje ide ostatak rada
%-------------------------------------------

\LiteraturaPostavke
\bibliography{literatura}

%-------------------------------------------
%	ovdje idu prilozi
%-------------------------------------------
%\appendix
%\chapter{Prilog matematička notacija}
% Prvi dodatak

\end{document}
```

### Tip rada: seminarski zadatak

```latex
\documentclass[zadatak]{FSBtex}

\author{prof. dr. sc. Pero Perić}
\AKgodina{2021/2022.}
\kolegij{Pneumatski i hidraulički servo sustavi}

\begin{document}
\FootHeadSeminarZadatak

% primjer sa imenom studenta i slikom zadatka
\begin{SeminarskiZadatak}[Marko Markić]
Ovdje ide tekst zadatka seminarskog za tog i tog studenta
\end{SeminarskiZadatak}


\begin{SeminarskiZadatak}[]
Ovdje ide tekst zadatka seminarskog rada bez imena studenta
\end{SeminarskiZadatak}

\end{document}
```

### Tip rada: skripta
```latex
\documentclass[skripta, fancy]{FSBtex}

\author{Marko Markić}
\title{Skripta}
%\titleENG{Skripta engleski naslov}	% ako je na engleskom onda treba ovaj naslov


%-------------------------------------------
% za fancy opciju slika svakog poglavlja
%-------------------------------------------
% sve opcije se mogu mijenjati za zvako poglavlje pozivanje pojedine opcije
\chapterimage{naslovna1.jpg} % slika poglavlja
\chapterspaceabove{6.5cm} % razmak od vrha stranice do naslova poglavlja
\chapterspacebelow{6.75cm} % razmag ot gornje margine do pocetka teksta

\begin{document}
\NaslovnaStrana	% ova naredba ukljucuje sve naslovne strane rada ovisno o tipu rada, te sadrzaj i popise slika i tablica

% pocetak brojanja rada od prve stranice
\setcounter{page}{1}
\pagenumbering{arabic}

%-------------------------------------------
% ovdje ide ostatak rada
%-------------------------------------------

\chapterimage{naslovna2.jpg}
\chapterspaceabove{5.5cm} 
\chapterspacebelow{6.75cm}
\chapter{Naziv poglavlja}

% literatura
\LiteraturaPostavke
\bibliography{literatura}

%-------------------------------------------
%	ovdje idu prilozi
%-------------------------------------------
\appendix
\chapter{Prilog matematička notacija}

\end{document}
```

## Naredbe za generiranje datoteke:

* pdflatex main.tex
* bibtex main
* makeindex -s nomencl.ist -o main.nls main.nlo
* makeglossaries-lite main
* pdflatex main.tex
* pdflatex main.tex
