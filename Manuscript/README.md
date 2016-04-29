# Notes sur le manuscrit

**Mise à jour: 07042016**


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
Les champs `@InProceedings` lèvent l’erreur `Undefined control sequence. []`.
L’ajout de référence croisé (crossref) empêche la compilation du fichier latex.
La référence d’un article vers un autre est donc maintenant dans le champs note.

