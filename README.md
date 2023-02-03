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
\documentclass[tip_rada, jezik, prikaz, stil, stil_naslova, stil_teorema]{FSBtex}
```
gdje su ulazni argument:

| tip_rada  |   jezik  | prikaz |  stil |   stil_naslova   | stil_teorema |
| --------- | ---------| ------ | ----- | ---------------- | ------------ |
| seminar   | hrvatski | web    | plain | titleplain       | theoremplain |
| zavrsni   | engleski | print  | alter | titplealter      | theoremalter |
| diplomski |          |        | fancy | titlefancy       | theoremfancy |
| projekt   |          |        |       | titlefancyfigure |              |
| skripta   |          |        |       |                  |              |
| zadatak   |          |        |       |                  |              |


<p>Početne postavke klase su <b><i>seminar</i></b>, <b><i>hrvatski</i></b>, <b><i>web</i></b> i <b><i>plain</i></b>.
Prilikom pisanja rada potrebno je odabrati jedino opciju tip rada, dok su sve ostale opcije dodatne opcije za razlicite stilove rada.
</P>

## Naredbe definirane unutar FSBtex klase sa ulaznim argumentima

+ `\Acknowledgment{...}` &#8594; zahlava za diplomski i završni rad
+ `\AcademicYear{...}` &#8594; akademska godina
+ `\Author{...}` &#8594; ime autora rada
+ `\Assignment{...}` &#8594; zadatak u pdf-u za seminar, projekt, diplomski i završni rad
+ `\chapterimage{...}` &#8594; slika u pozadini ispod imena poglavlja
+ `\chapterspaceabove{...}` &#8594; razmak od vrha stranice do početka naslova
+ `\chapterspacebelow{...}` &#8594; razmak od donje margine do pocetka teksta
+ `\CoMentorHR{...}` &#8594; ime komentora na hrvatskom jeziku
+ `\CoMentorEN{...}` &#8594; ime komentora na engleskom jeziku
+ `\CourseHR{...}` &#8594; ime kolegija za seminarski zadatak
+ `\KeywordsHR{...}` &#8594; ključne riječi na hrvatskom jeziku
+ `\KeywordsEN{...}` &#8594; ključne riječi na engleskom jeziku
+ `\MentorHR{...}` &#8594; ime mentora na hrvatskom jeziku
+ `\MentorEN{...}` &#8594; ime mentora na engleskom jeziku
+ `\TitleHR{...}` &#8594; naslov rada na hrvatskom jeziku
+ `\TitleEN{...}` &#8594; naslov rada na engleskom jeziku

## Naredbe definirane unutar FSBtex klase bez ulaznih argumenata

+ `\LiteratureSettings` &#8594; postavljanje postvaki za popis literature
+ `\PageNumberingArabic` &#8594; postavlja brojanje strana pomoću brojki
+ `\titlepage` &#8594; kreira sve naslovne strane rada

## Okoline definirane unutar FSBtex klase
<p>Okolina se definira na sljedeči način i moguće joj je dodijeliti dodatne argumente:</p>

```latex
\begin{ime_okoline}[dodatni_argumenti]
Sve što želimo da se nalazi unutar okoline
\end{ime_okoline}
```
<p>Predefinirane okoline:</p>

+ <code>AbstractEN</code> &#8594; sažetak rada na engleskom jeziku
+ <code>AbstractHR</code> &#8594; sažetak rada na hrvatskom jeziku
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
\Author{Marko Markić}
\MentorHR{prof. dr. sc. Pero Perić, dip. ing.}
\TitleHR{Optimalna sinteza mehanizma tlačnog cilindra}

% odvje se dodaje zadatak u pdf-u ako on postoji
\Assignment{slike/zadatak.pdf}

\begin{document}
\titlepage

% pocetak brojanja rada od prve stranice
\PageNumberingArabic

%-------------------------------------------
% ovdje ide ostatak rada
%-------------------------------------------

\LiteratureSettings
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
\Author{Marko Markić}
\MentorHR{prof. dr. sc. Miki Mikić, dip. ing.}
\CoMentorHR{dr. sc. Pero perić, dip. ing.}
\Assignment{slike/zadatak.pdf}

\Acknowledgment{
Izjavljujem da sam ovaj rad izradio samostalno koristeći stečena znanja tijekom studija i navedenu literaturu.\\

Zahvaljujem se svom mentoru \textbf{prof. dr. sc. Peri Periću} što mi je omogućio da napišem ovaj rad......
}

\KeywordsHR{PID; LQR; hidraulika}
\KeywordsEN{PID; LQR; hydraulics}

\begin{document}
\titlepage

% u slucaju enegleske verzije potrebno obrnut redoslijed sazetaka
\begin{AbstractHR}
Ovdje ide sažetak rada na hrvatskom\\
\end{AbstractHR}

\begin{AbstractEN}
Ovdje ide sažetak rada na engleskom jeziku\\
\end{AbstractEN}

% pocetak brojanja rada od prve stranice
\PageNumberingArabic

%-------------------------------------------
% ovdje ide ostatak rada
%-------------------------------------------

\LiteratureSettings
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

\Author{prof. dr. sc. Pero Perić}
\AcademicYear{2021/2022.}
\CourseHR{Pneumatski i hidraulički servo sustavi}

\begin{document}

% primjer sa imenom studenta i slikom zadatka
\begin{SeminarAssignment}[Marko Markić]
Ovdje ide tekst zadatka seminarskog za tog i tog studenta
\end{SeminarAssignment}

\begin{SeminarAssignment}[]
Ovdje ide tekst zadatka seminarskog rada bez imena studenta
\end{SeminarAssignment}

\end{document}
```

### Tip rada: skripta
```latex
\documentclass[skripta, fancy, titlefancyfigure]{FSBtex}

\Author{Marko Markić}
\TitleHR{Skripta}


%-------------------------------------------
% za titlefancyfigure opciju slika svakog poglavlja
%-------------------------------------------
\chapterimage{naslovna1.jpg} % slika poglavlja
\chapterspaceabove{6.5cm} % razmak od vrha stranice do naslova poglavlja
\chapterspacebelow{6.75cm} % razmag ot gornje margine do pocetka teksta

\begin{document}
\titlepage	

% pocetak brojanja rada od prve stranice
\PageNumberingArabic

%-------------------------------------------
% ovdje ide ostatak rada
%-------------------------------------------

\chapterimage{naslovna2.jpg}
\chapterspaceabove{5.5cm} 
\chapterspacebelow{6.75cm}
\chapter{Naziv poglavlja}

\LiteratureSettings
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
