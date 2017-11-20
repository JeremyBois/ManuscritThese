# Notes sur le manuscrit

**Mise à jour: 20171120**

## PDF A:
```gs -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dCompressFonts=true -dSubsetFonts=true -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=outputPdf.pdf -c ".setpdfwrite <</NeverEmbed [ ]>> setdistillerparams" -f original.pdf```


## Notes:

  - Virer la voie passive au maximum
  - Ajouter citation de Matplotlib / pandas / numpy
  - Vérifier que les noms exotiques soit correctement écrits
  - Abréviation en mode math ($$)
  - Nom Logiciel en italique (\textit)
  - Légende tableau en haut
  - Légende figure en bas

## Potentiel (BS 2017)

Impact du fichier météo :

  - Jisoo Shim : Effect of the Typical Weather Data on Building Energy Simulation

Impact du calcul de l’irradiation :

  - Alexssandro Prada / G. Pernigotto : Influence of solar irradiance models of optimal refurbishment measures
  - Haowei Xing : Effect of application between Anisotropic and Isotropic Diffuse Radiation
    Model on Building Diffuse Radition Heat Gain
    - Déviation entre les deux due à la direction

Optimisation multi-objectif :

  - Nicolas Perez : optimisation multi-objectif à l’échelle du quartier avec DymoSim

## Latex:

**Ajouter des notes:**
Permet de mettres des notes et de créer une table des matières pour celles-ci.
[todonotes)](http://ctan.org/pkg/todonotes)

**Ajouter des annotations:**
Permet de faire pop une bulle avec plus d’informations pour facilement décrire
une équation, rapeler la définition d’un acronyme, ...
Nécessaire d’avoir une version plus récente que la `2.3a` pour éviter des bugs
d’affichage et une meilleur compatibilité auprès des divers lecteurs pdf.
[pdfcomment](http://www.ctan.org/pkg/pdfcomment)

**Erreurs de Biblatex:**
L’ajout de référence croisé (crossref) empêche la compilation du fichier latex.
La référence d’un article vers un autre est donc maintenant dans le champs note.

Le mode math dans un fichier `.bib` doit être compris entre des crochets : `{$\epsilon_{rr}$}`


## Nomenclature :


**Optimisation:**

  - Énumération :

    - objectifs : $m$ ---> $M$
    - égalités : $c$ --> $C$
    - inégalités : $q$ --> $Q$
    - sources / solutions : $i$ ---> $N$

  - Sélection :

    - objectifs : $f$, $\tilde{f}$ (normalisée), $F$ (avec contrainte)
    - égalités : $h$
    - inégalités : $g$
    - source /solution : $a$ $b$
    - position : $\vec{x}$ ($x_{i}$)
    - nouvelle position : $\vec{x}'$ ($x_{i}'$)


**OBL:**

  - borne dynamique $c$ et $d$
  - position opposée : $\check{\vec{x}}$


**ABC:**

  - taille population $NP$
  - Essai max $MaxEchec$

**Contraintes:**

  - distance : $d$ ($d_{m}(\vec{x})$)
  - objectif : $F_{m}(\vec{x})$
  - ratio réalisable : $r_{f}$
  - pénalité : $z$

**Marche aléatoire:**

  - pas $w$ --> $W$
  - taille du pas $\omega$
  - apprentissage $\Phi$
  - tirage aléatoire $\sigma_{u}$ et $\sigma_{v}$
  - $\alpha$, $\beta$, $k$, et $s$
  - temps $t$
  - factorielle poiur complexe $\Gamma$
  - facteur d’échelle $\omega$
  - Indicateur d’apprentissage $\Phi$
  - Tirage ditribution Lévy $T_{L}$

**Morris:**

  - niveaux : $p$
  - trajectoires : $r$  --> $R$
  - pas : $\delta$
  - moyenne : $\mu$
  - écart type : $\sigma$
  - moyenne absolue : $\mu^{*}$
  - effet élémentaire : $EE$
