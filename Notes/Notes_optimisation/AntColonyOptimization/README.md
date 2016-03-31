# Thèse: Multi Objectives Combinatorial Optimization Problem (MOCOP)


***Mise à jour: 20151106***


## Vocabulaire:
    fourmi      = Solution en construction
    heuristique = Règle utilisé pour guider la recherche
    phéromone   = Information stigmergique (https://fr.wikipédia.org/wiki/Stigmergie)
    nœud       = Critère de construction
    branche     = Représente une passerelle autorisé entre deux nœuds
    chemin      = Combinaison de la sélection d’une branche puis une autre, ...
    nid         = Nœud utilisé à l’initialisation
    évaporation = Dépreciation d’une solution
    tau_ij      = Quantité de phéromone entre nœud i et nœud j
    TSP         = Problème du voyageur de commerce (Traveling Salesman Problem)
    QAP         = Quadratic Assignment Problem


## Acronymes:
    ACS   = Ant Colony System
    MMAS  = Min-Max Ant System
    MOCOP = Multi Objectives Combinatorial Optimization Problem


## Ant Colony System (ACS):
C’est un méta-heuristique basé sur le comportement des fourmis. En effet les fourmis
secrètent une substance appelée `phéromone` pour communiquer. L’algorithme utilise
ce principe pour construire une solution à un problème donné.
En plus de l’information déposée par les fourmis, un `heuristique` est utilisé.
Cet heuristique permet de guider la recherche dans l’ensemble des `critères` utilisés
pour construire une solution. Afin d’éviter la convergence trop rapide de l’algorithme
chaque étape de la construction de la solution est soumis à une loi probabiliste.
Chaque choix est influencé par le niveau de phéromone et l’heuristique qui augmente
les chances de choisir un critère plutôt que un autre.
L’algorithme peut donc être représenté par un `graphe`. Un graphe est une structure
permettant d’organiser les données en utilisant des nœuds (node ou vertex) reliés
par des branches (edges). On a donc l’ensemble des critères représentés par des
nœuds et chaque branches contiennent les informations de phéromones et de l’heuristique.
On a donc un graphe avec poids `weight-graph`.
Ainsi le problème à résoudre doit pouvoir s’écrire sous forme de graphe afin
de pouvoir utilisé ce méta-heuristique et cherche à trouver le plus court cycle
hamiltonien.

Le premier (combi opti)

### Description de la méthode:
***Initialisation:***

 - On définit un `nid` (nœud de départ)
 - On défini l’heuristique utilisé pour guider la recherche
 - On initialise la quantité de phéromone (dépendant de la variante de l’algorithme)

***Itération***

 - Chaque fourmis construit la solution en fonction de la loi probabiliste.
 - On réalise une recherche locale (optionnelle)
 - On autorise plus ou moins de fourmis à déposer des phéromones
   (dépendant de la variante de l’algorithme)
 - Évaporation pour oublier les mauvais choix (exponentielle)
   Choisir un coefficient faible ralenti l’évaporation (coef entre 0 et 1)


## Min-Max Ant System (MMAS):
Cette approche est une amélioration de l’algorithme de base sur plusieurs point:

***Utilisation de borne pour la quantité de phéromone***
On limite ainsi le risque de converger trop vite vers un optimum local
En effet les fourmis la probabilité de suivre un chemin augmente si la quantité
de phéromone augmente. Si on ne borne pas cette quantité, on finit par avoir
l’ensemble de la population qui suit le même chemin.

***On ne dépose des phéromones que sur la solution optimale pour l’itération***
Ce choix permet de concentrer la recherche vers les combinaisons de critères
prometteurs mais peuvent

***Initialisation des phéromones pour chaque branche à la borne maximale***
On initialise la quantité de phéromone  `tau` à la valeur maximale.

***On peut réinitialiser les pistes de phéromones***


## Améliorations de la recherche
Afin d’améliorer encore la recherche de la solution optimale plusieurs propositions
peuvent être utilisés.

***Sources:***
The Max-Min ANT System and Local Search for Cominatorial Optimization Problems
Thomas Stützle, Holger  H. Hoos_2000_Future generation computer systems

### Initialisation des pistes de phéromones:
On choisit une valeur très grande pour toutes les pistes (supérieure à tau_max)
pour la première itération de façon à ce que l’évaporation ne limite pas l’itération
suivante. Tous les chemins à l’itération 2 ont donc une valeur tau_max.

### Réinitialisation
Réinitialisation lorsque le système converge (plus d’évolution).
Lorsque toutes les branches ne contenant pas les critère de la solution optimale
ont un niveau de phéromone proche de tau_min et qu’il n’y a plus d’amélioration
de la solution depuis `x` nombre d’itération.
`x` et `proche de tau_min` étant à définir.

### Choix du maximum et du minimum
Le choix des bornes (minimum et maximum) est un facteur de convergence vers la
meilleur solution.
Tau_max doit être proche de la valeur de la meilleur solution de l’objectif.
On l’approche asymptotiquement à partir de la loi probabiliste qui influence
le prochain choix d’une fourmis.
Tau_min est fonction du nombre de choix pour chaque critère et de la valeur de Tau_max
***Plus d’informations dans la publication***


### Mise à jour des phéromones
Le choix de la solution à mettre à jour est déterminée par la meilleure solution
à l’itération en cours. Choisir des fois de mettre à jour la meilleure solution
globale peut améliorer la qualité des solutions trouvées.

### Lissage des phéromones
Lorsque l’algorithme commence à converger ou converge, il est intéressant de lisser
les pistes de phéromones afin que les fourmis continuent à explorer de nouvelles
solutions. On affaibli la solution vers laquelle on a convergé en utilisant un
facteur entre 0 et 1.

    Tau_ij = Tau_ij + facteur_réducteur * (Tau_max - Tau_ij)

*Tau_ij la quantité de phéromone entre le nœud i et le nœud j*
*0 < facteur_réducteur < 1*

### Ajout d’une recherche locale
Certain problèmes NP-hard obtiennent de meilleurs résultats avec l’ajout d’une
recherche local:

 - 2-opt
 - 3-opt / reduced 3-opt
 - LK local search
 - Robust tabu search



## Multi Objectives Combinatorial Optimization Problem: Approche Pareto
La section précédente traite de l’approche pour un seul objectif et les améliorations
des ACO au fur et à mesure du temps.
Depuis des adaptations aux problèmes multi-critères ont été étudiés et c’est ce
qui est présenté dans ce chapitre.





# Articles:
***
<img src="article.jpg"/>
***


# Multiobjective Max-Min Ant System. An application to Multicast Traffic Engineering
**Auteurs:** Diego Pinto, Benjamím Barán
**Année:** 2008

## Citations:

 - [3] D.A.V Veldhuizen et G.B Lamont 2000 `Multiobjective Evolutionary Algorithms: Analyzing the State of the Art`
 - [6] S. Iredi et al. 2001 `Bi-Criterion Optimization  with Multi Colony Ant Algorithm`
 - [8] T Stützle et H.Hoos 2000 `MAX-MIN Ant System`


## Résumé:
### 1 | Introduction:
Introduit l’historique des premières optimisations multi-objectifs avec les algorithmes
de colonies de fourmis sans ajout de caractères subjectifs.
[6]: Première approche sans classement des objectifs
[8]: Description de la variante d’ACO la plus performante --> MMAS

Présentation d’une variante de MOACO par recherche de front de Pareto (M-MMAS ou M3AS).
Aucunes introductions de données à priori. Génération d’un front de Pareto à chaque
boucle, et mise à jour des nouvelles solutions non dominées de ce set.
Évaluation de la performance de l’algorithme sur le `Multicast Routing Problem`
en l’opposant à un autre développé specifiquement pour ce problème.

### 2 | Formulation:
Description de la formulation d’un problème multi-critère très bien faite.
Voir le papier lors de la rédaction

### 4 | Ant Colony Optimization Approach:
Description succincte de la forme générale de l’algorithme.
Description de la varainte MMAS avec l’introduction des modifications de l’approche
M3AS.

### 7 | Result:
Petites instances: M3AS plus performant
Grandes instances: M3AS plus performant à 320s mais un peu en dessous à 160s
M3AS globalement meilleur sur le nombre de solutions trouvée et la couverture des
solutions possibles.
Enfin les solutions trouvées par M3AS domine une plus grosse part des solutions
de MMA que l’inverse.
M3AS est donc une meilleure alternative pour ce problème.


# MAX-MIN Ant System
**Auteurs:** Thomas Stützle et Holger H. Hoos
**Année:** 2000

## Citations:

 - [9] M. Dorigo et al. 2000 `Ant algorithms and stimergy`
 - [10] M. Dorigo et al. 1999 `The Ant colony optimization meta-heuristique`
 - [11] M. Dorigo et al. 1999 `Ant algorithms for distributed discrete optimization`
 - [41] T. Stützle 1998 `Local search algorithms for combinatorial problems`


## Résumé:
### 1 | Introduction:
La matrice de phéromone pêut être vu comme la représentation de l’expérience des
fourmis sur un problème donné.
La recherche autour des meilleures solutions apporte les meilleurs résultats.
Il explique aussi que l’ajout de recherche local renforce la performance de ces
méthodes (voir [5, 12, 19, 28, 41-43]).
MMAS est l’algorithme le plus performant sur les cas tests, parmis les différents
algorithmes de fourmis.

### 2 | Ant Colony Optimization:
Ce Meta-Heuristique peut être appliqué à n’importe quel problème combinatoire
(voir [10, 11]).
Explication du meta-heuristique appliqué au problème du voyageur de commerce (TSP).
**Stagnation:** Situation ou les différentes fourmis construisent le même chemin encore et encore. (voir [14])


### 4 | MAX-MIN Ant System:
Description détaillée de l’algorithme, et plus particulièrement la méthode utilisée
pour la mise à jour des traces de phéromones. Il explique l’alternance entre la
meilleure solution du tour et la meilleur au globale.

**Choix des bornes sur la matrice de phéromone:**
**Borne max:**
La solution optimale n’étant pas connue la borne max (`Tau_max`) est mise à jour dynamiquement
en utilisant l’approximation que la meilleure solution actuelle est la solution optimale.
Le taux de phéromone maximum correspond alors à la normalization de l’approximation
de la solution optimale pondérée par l’évaporation.
`[1 / (1 - rho)] * [1 / meilleure solution globale]`

**Borne min:**
La borne `Tau_min` est elle définie en utilisant une estimation de `rho_best`
qui permet ensuite de définir `rho_dec`. Ces critères sont déterminants pour
la vitesse de convergence du système. Important de définir correctement les bornes
de la matrice de phéromone (voir eq. 8-->11).


**Initialisation:**
Au premier tour la matrice de phéromone doit être initialisée à une valeur assez grande pour
que au second tour l’ensemble de la matrice de phéromone soit toujours à Tau_max.
Permet d’améliorer l’espace de recherche.

**Évaporation:**
Choisir un coefficient d’évaporation faible accélère la convergence mais risque
de converger vers un optimum local. `0 < rho < 1`
Pour le TSP problème le choix d’une évaporation très forte et d’une sélection élitiste
donne de bon résultats

**Defauts for TSP:**
beta=2, alpha=1, m=n=nombre de fourmis=nombre de choix à faire, rho=0.98, prob_best=0.05
On remarque que avec beta=0 (exclusion de l’heuristique) la qualité de la solution ne
varie que faiblement (**voir partie 6**).

**Sélection de la solution optimale:**
Amélioration du jeu de solution en alternant entre le choix de la meilleur au tour et globale.
Au fur et à mesure, il est intéressant d’augmenter la probabilité de choisir de mettre à
jour la meilleure solution globale pour converger plus rapidement.
Une meilleure convergence a été observée si on ne choisi pas de mettre à jour la
meilleure entre solution globale et de l’itération mais si on applique l’alternance
progressive décrite ci-dessus (**voir résultats partie 6**).

Afin d’améliorer la performance de la solution, il peut être intéressant d’ajouter
un `pheromone trail smoothing (PTS)`. Le principe est le suivant: On va favoriser
la recherche de solution avec une faible trace de phéromone.
À montré son efficacité pour le TSP.


### 6 | Experimental results for the QAP:

** Recherche locale
La recherche locale étant coûteuse en temps de calcul, un faible nombre de fourmis
on été sélectionnée. Le faible nombre de fourmis est compensé par la qualité des
solution après la recherche locale.
Il est aussi observée que pour des instances "réelles" une recherche locale simple
suffit pour avoir de très bon résultats.







# Ant Colony Optimization for Multi-objective Optimization Problems
**Auteurs:** Ines Alaya
**Année:** 2007

## Citations:

 - [6] M. Dorigo 1992 `Optimization, Learning, Natural Algorithm, PhD thesis`
 - [7] M. Dorigo 2004 `Ant Colony Optimization, MIT Press`
 - [20] T. Stützle 2000 `MAX-MIN Ant System`

## Résumé:
### 1 | Introduction:
L’algorithme proposée est paramétrable par le nombre de colonies et le nombre de
matrice de phéromones.
Le problème multi-objectif test est le suivant: `Knapsack problem`

### 3 | A Generic ACO algorithm for multiobjective problems
Proposition de plusieurs algorithmes m-ACO (m étant le nombre d’objectifs).
Un heuristique est définie pour chaque objectif. Ces algorithmes étant basés sur
`MMAS` une borne min et max est définie pour éviter de la concentration trop
rapide vers un optimum local.
L’évaporation est définie par un facteur constant.

**m-ACO1 (m+1 colonies, m structures de phéromones):**
La colonie supplémentaire optimise les deux objectifs en sélectionnant de façon
aléatoire à chaque itération un objectif à optimiser.
Chaque colonies à un objectif, un heuristique, et une trace de phéromone.
La mise à jour de la trace est réalisé pour la meilleure solution pour chaque
objectif (chaque colonie) et la quantité dépend de la meilleure solution globale.
Enfin la mise à jour est réalisée sur chaque matrice de phéromones.

**m-ACO2 (m+1 colonies, m structures de phéromones):**
Similaire à `m-ACO1` avec comme différence l’agréation des valeurs de phéromone de
chaque solution. Agrégation par `sum-weigthed-values`.

**m-ACO3 (1 colonie, 1 structure de phéromone):**
L’heuristique est définie comme la somme des heuristique associés à chaque objectif.
La mise à jour du set de Pareto est réalisée par l’ensemble des solutions non-dominées
avec une valeur constante sans cumul possible.

**m-ACO4 (1 colonie, m structures de phéromones):**
À chaque itération un objectif est sélectionné aléatoirement.
L’heuristique est définie comme la somme des heuristique associés à chaque objectif.
`m` solutions sont sélectionnées pour la mise à jour et la quantité de phéromone
est définie comme pour `m-ACO1` et `m-ACO2`, elle est relative à la meilleure solution
actuelle.

### 6 | Experimental results:
`m-ACO4` toujours meilleur que `m-ACO1` et `m-ACO2`. `m-ACO3` semble par contre
n’être ni meilleur ni moins bon selon les cas.






# Bi-Criterion Optimization with Multi Colony Ant Algorithms
**Auteurs:** Stephen Iredi, Daniel Merkle, Martin Middendorf
**Année:** 2001

## Citations:

 -


## Résumé:
### 1 | Introduction:
Proposition d’un algorithme de colonie de fourmis utilisant plusieurs colonies
hétérogènes ayant chacune deux matrice de phéromone (une par objectif).
Il est ensuite testé sur `Single Machine Total Tardiness problem`.
Cette méthode a été développée pour les cas où il n’est pas possible de classer
entre eux les objectifs selon leur importances.


### 4 | Ant Algorithm for Bi-Criterion Optimization Problems:
Il utilise deux traces de phéromones, une pour chaque objectif. Pour obtenir un
jeu de solution Pareto optimale sur l’ensemble de solution, chaque fourmis prend
en compte les deux objectifs mais avec une importance qui varie. Par exemple la fourmi
`A` aura un poids de 0.2 sur l’objectif 1 et de 0.5 sur le 2. Une autre fourmi `B`
quand à elle pour porter les poids (0, 1), etc...
On note donc un cas particulier si on a un jeu de poids (1, 0) ou (0, 1); ce cas
correspond à ne considérer que l’un des objectifs.
Pour l’agrégation des phéromones, une combinaison entre évaluation des ancienne
décision et de la somme des solution actuelles. Des coefficient permettent de
pondérer l’impact de l’un ou l’autre.
Enfin l’évaporation est réalisée par l’ensemble des solutions non-dominées de
l’itération et ce pour chaque matrice. La quantité de phéromone est fonction
décroissante du nombre de fourmis qui mettent leur solution à jour.
T_ij = T_ij + 1/N^a.

### 5 | The Multi Colony Approach:
Chaque colonie à le même nombre de fourmis.
Soit `p` colonies et `m` le nombre total de fourmis, on a donc pour chaque colonie
`m/p` fourmis.

Contrairement à la plupart des approches, les colonies coopèrent entre elles
en partageant le même front de Pareto global. Ainsi les solutions dominées sont
exclues par coopération. Seule les fourmis ayant trouvées une solution non-dominées
dans le front global sont autorisés à mettre à jour leur piste.
*Le raisonnement est le suivant:* Une solution optimale localement a plus de chance
de l’être globalement si peu de solutions ont été trouvées dans cette région. On
permet ainsi aux fourmis trouvant des solutions dans des régions moins dense du front
de Pareto global de mettre à jour leur solution. Cette technique permet ainsi de
mieux couvrir l’espace de Pareto.

#### Pheromone Update
Il est proposé deux méthodes pour choisir dans quelle colonie la fourmi doit mettre à jour sa trace de phéromone.

 - `update-by-origin`: Une fourmi ne met à jour que sa propre colonie
 - `update-by-region`: L’ensemble de solutions non-dominées sont splittées en
    `i` parties avec `i` le nombre de colonie. Les fourmis ayant trouvées une solution
    dans le `i` partie mettent à jour leur trace de phéromone dans dans la colonie `i`.
    Les solutions sont triées selon le premier objectif.

**Critique de la mise à jour:** Il est acceptable de trier les solutions selon le premier
critère si on a deux objectifs mais si le nombre d’objectif augmente il est alors
moins trivial de définir comment trier les solutions.
L’auteur indique cependant que le choix du critère n’est pas important, le but étant
de disperser les fourmis pour élargir l’espace de recherche.


#### Heterogeneous Colonies:
Comme dans la version à colonie unique les fourmis utilisent un facteur pondérateur
pour prendre en compte de manières différentes les objectifs.
**Règle 1:** Répartition des poids entre les différentes colonies,
**Règle 2: Intervalles disjointes - ** Répartition des poids entre les fourmis d’une même colonie en définissant
             des sous-groupes de fourmis.
** Règle 3: Intervalles superposées - Chaque colonies partagent 50% de leur intervalle.

### 7 | Results:
L’algorithme est testé sur le problème suivant: `Single Machine Total Tardiness problem`.
L’auteur montre la supériorité de l’approche multi-colonie sur la grande majorité
du front de Pareto.
Il est aussi mis en avant la performance des deux méthode proposées pour la mise à
jour de la piste de phéromone qui permet d’obtenir un meilleur front sur l’ensemble
de l’espace de recherche.
Ensuite la méthode d’agrégation est étudiée. Il apparaît que la méthode `disjoint`
permet d’obtenir une meilleure couverture des extrêmes mais est pauvre dans l’espace
central. Par contre l’approche par `Overlapping` permet d’obtenir un front de Pareto
convexe performant sur l’ensemble du front (l’infériorité sur les extrêmes et
faible si on augmente le nombre de colonies).
La différence est réduite en augmentant le nombre de colonies.
Enfin il est aussi montré que l’utilisation de deux matrice de phéromone par colonie
est plus performant.

### 8 | Conlusions and Future Work:
Coopération entre colonies permet d’améliorer la recherche de solutions Pareto
optimales. Enfin il est nécessaire d’avoir `n` matrices de phéromone par colonies,
avec `n` le nombre d’objectifs.

Une question ouverte est finalement posé sur la sélection par région si on a plus
de deux objectifs. Quelle région utiliser dans le front de solutions non dominées.


# The automatic Design of Multiobjective Ant Colony Optimization Algorithms
**Auteurs:** Manuel López Ibánez, Thomas Stützle
**Année:** 2012

## Citations:

 - [7] S.Iredi 2001 `Bi-criterion oprimization with multicolony ant algorithms`
 - [14] M. López Ibánez 2010 `An analysis of algorithmic components for multiobjective ant colony optimization: A case study on the biobjective TSP`
 - [15] M. López Ibánez 2010 `The impact of design choice of multiobjective ant colony optimization: A case study ...`
 - [17] M. López Ibánez 2010 `Automatic configuration of multiobjectives ACO algotithms`
 - [25] E.Zitzler 2002 `SPEA2: Improving the strengh Pareto evolutionnary algorithm for multi-objective optimization`
 - [33] M. Birrattari 2010 `F-race and iterated F-race: An overview`

### 1 | Introduction:
Ce papier présente un Multi-objective Ant Colony Opimization (MOACO) framework.
En plus d’offrir un outil pour réaliser de l’optimisation, il propose aussi un outil
d’auto-configuration des algorithmes en fonction du problème afin d’avoir la meilleure
performance de celui-ci pour un problème donné.
Il est important de garder à l’esprit que ce framework a été développé pour regrouper
les algorithmes de fourmis par approche Pareto avec en focus les problèmes bi-objectifs.
Il présente d’abord les algorithmes existant [14, 15] pour ensuite détailler le framework et
expliquer comment chaque algorithme a été implémenté.
L’approche utilisée pour configurer automatiquement l’algorithme utilise des indicateurs
de qualité comme l’`hypervolume` et l’`epsilon measure` grâce à l’outil I/F Race [17, 33]
Leur approche par configuration automatique permet d’améliorer grandement le front de Pareto
de l’ensemble de solutions.


### 2 | Preliminaries:
Présentation de l’optimization multi-objectif.
Présentation du problème utilisé comme benchmark (bTSP).
Présentation de la forme générale des algorithmes de fourmis.


### 3 | Configurable MOACO Framework:
Le framework implémente une interface abstraite qui est ensuite complété par les
caractéristique de l’algorithme de fourmis qui sont supposée être des approches
performantes.

**Single/Multiple phéromone/heuristique matrices:**
Il est important de noter que la définition de la matrice de phéromone et de la
matrice heuristique est un des critères les plus important pour la performance de
l’algorithme.
Le choix du nombre de matrice est donc laissé comme choix à l’utilisateur.

**Agrégation:**
Trois méthodes sont disponibles afin de définir une valeur unique à chaque noeud:

 - *Weighted sum:* Somme pondérée par l’importance des objectifs
 - *Weighted product:* Produit pondérée par l’importance des objectifs
 - *Random:* À chaque itération la fourmi selon une loi aléatoire uniforme sélectionne
           une des matrices.

Afin de pouvoir couvrir l’ensemble des algorithmes l’agrégation pour chaque colonies
est pondérée par des coefficient. Chaque fourmis porte un jeu de coefficient.
Le choix des coefficients de pondération est définie selon deux méthodes:

 - *one-weight-per-iteration:* Toute les fourmis utilisent les même poids à une certaine
                             itération.
 - *all-weight-per-iteration:* Les fourmis se répartissent les poids au sein d’une
                             même colonie.
Il est important de noter que les poids sont distribuées équitablement afin de ne pas
favoriser un objectif `à priori`.
Dans le cas de colonies multiples, la répartition des poids peut être définie de
deux manières différentes [7]:

 - *Intervalles disjointes:* Répartition des poids entre les fourmis d’une même colonie en définissant
                               des sous-groupes de fourmis.
 - *Intervalles superposées:* Chaque colonies partagent 50% de leur intervalle.

Dans les deux cas, la première étapes est de générer le nombre correct de poids
distribués équitablement sur l’intervalle `[0, 1]`. Par exemple dans le cas
de l’algorithme `Bi-Criterion_Ant` on aura pour chaque colonies autant de poids
que de fourmis. On doit donc générer un set de poids de longueur `nbr_ant * nbr_col`
et ensuite les répartir selon les deux méthodes décrites ci-dessus.


**Mise à jour des traces de phéromones:**
À chaque itération de l’algorithme, on obtient un ensemble de solutions candidates.
Un nombre maximum de solution doit être définis (`N_upd`). Si il y a plus de solution retenues
que le maximum autorisé alors une troncation est appliquée [25] avant de mettre à
jour les matrices de phéromones.

Trois méthodes sont proposées pour sélectionner quelles solutions sont retenues:

 - *Non-dominées:* On sélectionne les solutions non-dominées pour la mise à jour
 - *Meilleur pour l’objectif:* On Conserve les `N_upd` meilleurs pour les différents objectifs
Si il y a plusieurs matrices de phéromones, chaque matrice est mise à jour par les
`N_upd` solutions associées à cet objectif. Si il y a une unique matrice de phéromone
alors `2 * N_upd` solutions sont mis à jour dans la matrice.

 - *Meilleur selon leur poids:* Pour chaque poids et chaque objectifs il y a `N_upd` meilleurs solutions
Dans les cas spéciaux de poids 0 et 1, seule l’objectif 2 et 1 sont conservé respectivement.
Si on utilise seulement deux poids pour l’agrégation alors on a le même comportement que
pour la méthode 2 (*Meilleur pour l’objectif*).

Il est important de noter que l’ensemble de solutions candidates est définie par
l’algorithme lui-même et que ces méthode ne sont appliquées que ensuite.

Dans le cas d’un algorithme multi-colonies, l’ensemble des solutions générées à chaque
itération est stockée dans une archive commune permettant de supprimer les solutions
dominées par coopération des colonies. Ensuite le jeu de solutions candidates est
construit en utilisant les solutions non-dominées restantes à l’itération ou globalement.
Une fois le nombre de solutions à mettre à jour est définie, les solutions sont
renvoyées à chaque colonies pour la mise à jour.
On a ici deux méthode pour la distribution des solutions proposée par [7]:

 - *update-by-origin:* On renvois les solutions à leur colonie d’origine
 - *update-by-region:* On échange des solutions entre les colonies en part égales
                       de tel manière que chaque set corresponde à une région du front
Enfin on fait appel à une des trois méthode de mise à jour décrites plus haut.

** Algorithme complet:**
Dans la publication l’algorithme complet est disponible avec un détail par étape.
Ici on traduit rapidement les étapes principales

 A. Initialisation des phéromones et des poids pour chaque colonie
 B. Initialisation unique des heuristiques car partagées par l’ensemble des colonies
 C. Initialisation du front de Pareto global et du compteur d’itération

 1. À chaque itération chaque fourmi:
  - Construit une solution selon une pondération des objectifs
  - Recherche localement (optionnelle)
  - Réduction du front de Pareto de l’itération en cours par coopération

 2. Mise à jour du front de Pareto global
 3. Pour chaque colonie:
  - Sélection et assignation des traces à mettre à jour (`origin` ou `region`)
  - Mise à jour des pistes de phéromones

 4. Incrémentation du compteur


### 4 | Design of MOACO Algorithms:
Description des différentes approches utilisées pour représenter les algorithmes
existants dans le framework. Un table récapitulatif permet de voir l’ensemble des
algorithmes. Enfin un autre tableau récapitulatif permet de voir l’ensemble des
paramètres pouvant être modifiés pour créer son propre algorithme ...

*Note:* Certains algorithmes ont été modifiés afin d’être adaptable dans le framework.
La modification vise les méthodes d’agrégation pour `COMPETants` qui permet de
mieux exploré l’espace de solution. Pour `P-ACO` le nombre de matrice de phéromone
est ajustée à 2 (une par objectif) afin d’éviter un front de Pareto trop étroit.
Enfin `mACO-3` limite le nombre de mise à jour à 1, peu importe le nombre de solution
le contenant, ce qui n’est pas le cas de l’implémentation dans le framework.

Le principal ajout du framework réside dans la méthode d’initialisation automatique
qui permet de définir rapidement la combinaison la plus adaptée à notre problème.
C’est une méthode dite `offline` basée sur une extension de `iterated F-Race (I/F Race)`
aux problèmes multi-objectifs en utilisant la méthode d’ `unary quality measure` [15].

### 5 | Automatic configuration of the MOACO framework:

Pour ce faire, il est nécessaire de lui donner un jeu de problèmes d’entrainements.
représentatif du problème à étudié.
Deux `unary measure` sont utilisées.

**Hypervolume:**
Volume de l’espace de l’objectif dominé par un set de solution non-dominées et
restreint par un point de référence strictement dominées par les solutions Pareto
optimales. Un hypervolume large est donc une bonne chose, car il indique une large
évaluation de l’espace de recherche.

**Epsilon measure:**
La valeur minimale qui soustraite à l’ensemble des solutions non-dominées fait que
ce set domine faiblement un set de référence. Plus cette valeur est faible mieux c’est.


**L’implémentation du framework est séquentielle.**

#### A | Configuration if Multiobjective Components:
Comparaison entre les algorithmes existant et ceux auto-définies.
L’ensemble des résultats est disponible en complément [38].
Les résultats obtenues avec `Hypervolume` ou `Epsilon measure` sont similaires et
seuls ceux avec le premier sont reportés.
Ils montrent que les algorithmes auto-initialisés sont plus performant que les
existant.
Il est aussi montré que même si on utilise les meilleurs paramètres trouvés pour
l’ACO (ici le meilleur étant `BiCriterionAnt`), les algorithmes définies automatiquement
restent supérieurs que l’on configure que le design ou bien les paramètres de l’ACO ou
encore les deux.


