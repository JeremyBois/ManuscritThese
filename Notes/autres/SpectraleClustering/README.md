# Clustering spectral.

***Notes sur les éléments en lien avec le clustering spectral.***

***Mise à jour: 20160112***


<!-- --------------------------------------------------------------------------- -->
## Vocabulaire:
### Matrices:
#### Matrice laplacienne: Laplacian matrix

 - https://fr.wikipedia.org/wiki/Matrice_laplacienne
 - Notée `L`, elle est définie comme `L = D - A (ou W)`
 - Symétrique si graphe non orienté et positive semi-definie


#### Matrice diagonale des degrées: Degree matrix

 - https://fr.wikipedia.org/wiki/Matrice_des_degr%C3%A9s
 - Notée `D`, elle est diagonale

*Soit une matrice M m_ij (i==j) est définie comme la somme des branches reliant le noeud i à un autre noeud.*


#### Matrice d’adjacence: Adjacency matrix

 - https://fr.wikipedia.org/wiki/Matrice_d'adjacence
 - Notée `A` ou `W`, elle est symétrique si le graphe est non-orienté

*Soit une matrice M m_ij est définie comme 1 si les noeuds i et j sont connecté 0 sinon*


#### Matrice auto-adjointe positive:  Hermitian positive matrix

 - https://fr.wikipedia.org/wiki/Matrice_autoadjointe_positive
 - M = transconjuguée(M) et carré et inversible dont les valeurs propres sont >= 0


#### Matrice positive: Positive-definite matrix

 - https://fr.wikipedia.org/wiki/Matrice_d%C3%A9finie_positive
 - C’est une matrice positive et inversible dont les valeurs propres sont >=0
 - Matrice carré symétrique M tel que: `transpose(M) * L * M >= 0` (scalaire)
 - Matrice hermitienne tel que:`transconjugée(M) * L * M >= 0` (scalaire)

*Note:*
Semi-définie positive est une alternative à positive


#### Matrice Hermitienne: Hermitian matrix

 - https://fr.wikipedia.org/wiki/Hermitien#Matrice_hermitienne
 - Matrice carré avec des éléments complexe tel que M == conjuguée(transposée(M))

*Note:*
auto-adjointe est une alternative à hermitienne


#### Matrice transconjugée: Transconjugate matrix
C’est le conjugué de la transposée

*Note:*
La transposée revient à inverser les colonnes et les lignes.


#### Matrice conjuguée: Conjugate matrix

 - https://fr.wikipedia.org/wiki/Matrice_conjugu%C3%A9e
 - Matrice dont on conserve la partie réelle des éléments associés à l’opposée
   de la partie imaginaire des éléments

*Exemple:*
L’élément `3 + 2i` deviendra `3 - 2i`.


#### Multiplicity algébrique et géométrique: Algebraic and geometric multiplicity

 - http://math.stackexchange.com/questions/324427/how-to-find-the-multiplicity-of-eigenvalues#324437
 - algébrique: Nombre d’occurence d’une valeur propre dans le polynome caractéristique
 - Géométrique: Nombre de valeurs propres linéairement indépendantes

*Notes:*
Soit une matrice A, on repère les valeurs propres avec le déterminant: `Det(xI - A) = polynome(A)`
Il est de la forme suivante: `(x + lambda_1)**m_1(x + lambda_2)**m_2`
Le `m` représente la multiplicité algébrique.


#### Spectre d’une matrice: Matrix Spectrum

 - https://fr.wikipedia.org/wiki/Le_spectre_d'une_matrice
 - C’est l’ensemble des valeurs propres de la matrice


#### Marche aléatoire: Random walk

 - https://en.wikipedia.org/wiki/Random_walk#Random_walk_on_graphs
 - Choix aléatoire d’un voisin connecté (noeud j dont une branche i->j existe)


#### Valeur/Vecteur propres/Espace propre: Eigenvalues/eigenvectors/eigenspace

 - https://en.wikipedia.org/wiki/Eigenvalues_and_eigenvectors
 - https://fr.wikipedia.org/wiki/Valeur_propre,_vecteur_propre_et_espace_propre
 - Av = lambda * v (lambda == `valeur propre`, v == `vecteur propre`, A == matrice carré)
 - L’ensemble des vecteurs propres se trouvent dans l’`espace propre`



<!-- --------------------------------------------------------------------------- -->
### Graphes:
#### Graphe connexe: Connected graph
Soit un graphe A. Si il est possible de connecter deux noeuds en utilisant seulement
des noeuds dans A, alors il est connexe.


#### Composantes connexes: Connected component
Soit `B un sous-ensemble de `A un graphe (`B⊂A`). On dit que `B` est une composante connexe si
il n’y a aucune connection (chemin) entre les noeuds de `B` et de `B barre` (`A-B`), on le note
`A∩B = Ø`. `B` doit être un sous-ensemble strict et `B∪(A-B) = A`


#### Spectre d’un graphe: Graph spectra
C’est l’ensemble de ces valeurs propres


#### Graphe biparti: Bipartite graph

 - https://fr.wikipedia.org/wiki/Graphe_biparti
 - Un graphe est dit biparti s'il existe une partition de son ensemble de sommets
   en deux sous-ensembles `U` et `V` telle que chaque branche ait une extrémité dans
   `U` et l'autre dans `V`.


#### Centralité de vecteur propre: Eigenvector centrality

 - https://fr.wikipedia.org/wiki/Centralit%C3%A9#Centralit.C3.A9_de_vecteur_propre
 - Mesure proposée par Bonacich
   (http://leonidzhukov.net/hse/2014/socialnetworks/papers/Bonacich-Centrality.pdf)
 - Prend en compte la structure générale du graphe
 - Les centralités sont données le vecteur propre associée à la plus grande valeur
   propre (si graphe connexe alors multiplicité de 1)
 - Le Perron–Frobenius theorem assure que seule la plus grand valeur propre fournit
   la mesure de centralitée souhaitée

*Le score de centralité vérifie l’équation suivante: Av = lambda * v (lambda == `valeur propre`, v == `vecteur propre`, A == matrice carré)*


#### Perron–Frobenius theorem:

 - https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Perron-Frobenius



<!-- --------------------------------------------------------------------------- -->
## Sources documentaires:
Généralité sur les graphes:

 - Graphes, réseaux, réseaux sociaux -  vocabulaire et notation_Laurent Beauguitte.pdf
   https://halshs.archives-ouvertes.fr/docs/00/54/18/98/PDF/fmr1_vocabulaire_notation.pdf


Spectre de graphe:

 - Power and Centrality A Family of Measures_Phillip Bonacich.pdf
   http://leonidzhukov.ru/hse/2012/socialnetworks/papers/Bonacich-Centrality.pdf



Clustering spectral:

 - A Tutorial on Spectral Clustering_Ulrike von Luxburg_2007.pdf
   http://www.kyb.mpg.de/fileadmin/user_upload/files/publications/attachments/Luxburg07_tutorial_4488%5b0%5d.pdf
