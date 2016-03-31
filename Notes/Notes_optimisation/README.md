# Thèse: Choix de l’approche multi-objectif.


Mise à jour: 20151002

***


<img src="Classification_optimisations_start.png"/>
L’identification d’une maison 100% solaire est une problématique complexe
d’aide à la décision multi-critère.

Nous n’avons pas un ensemble connu de solution non-dominées nécessaire aux
méthode d’aide à la décision (MCDA).
En effet ces méthode ne ciblent pas la génération de solution mais la sélection
de solutions dans un ensemble grâce à des informations subjectives complémentaires
afin de les classer.


***


<img src="Classification_optimisations_approche.png"/>
Il y a deux approches permettant de réaliser l’optimisation multi-critère.

La première étant basé sur les préférences et introduisant ainsi une information
préférentielle en amont de la recherche de solution. De plus une bonne connaissance
est nécessaire dans le choix des coefficients qui influenceront le résultat.

La seconde approche est l’approche par génération de Pareto permettant de trouver
une surface de compromis sur l’espace des objectifs.


***


<img src="Classification_optimisations_natureVar.png"/>
L’approche préférentielle revient alors a définir le problème multi-critère
sous la forme d’un problème mono-critère afin de pouvoir utiliser les outils
d’optimisation monocritère. On peut citer par exemple les méthodes:

    - Min-max
    - Pondérations
    - E-contraintes

Ces 3 méthode nécessitant une approche itérative.

L’approche de génération elle se divise en deux grande familles:

    - Continue
    - Combinatoire

Notre problème est de type combinatoire et la transformation en modèle
mono-critère impliquant une introduction de préférence en amont de la phase
d’optimisation.
Nous optons donc pour une approche de génération de la famille combinatoire.


***


<img src="Classification_optimisations_disponible.png"/>
L’ensemble des critères n’étant pas connus et étant implicites, nous n’aborderons
pas l’approche de génération de critère continues non-linéaire ou linéaire

Nous concentrons donc nos efforts sur les deux méthodes combinatoire.

    - Exactes: Plus lent mais permet de caractériser les solutions
    - Approchées: Plus adaptées pour un ensemble de recherche de grande cardinalité


***


<img src="Classification_optimisations_exacte.png"/>
Nous détaillons ici les methodes exactes disponibles.

***Énumératives:***
Elles reposent sur l’évaluation de toutes les solutions d’un espace de recherche
finis ou discrétisé. Ce type de méthode demande une faible cardinalité dans l’espace
de recherche sous peine de voir exploser le nombre de solutions.

***A star:***
Nous avons aussi les méthode utilisant l’algorithme A* mais celle-ci bien que rapide
nécessite de connaître l’état que l’on veut atteindre.
Voir `Mandow et Millan, 1996 (1-)`.


***Séparation/Évaluation:***
Nous avons aussi les méthodes de séparation/évaluation qui cherche à réduire le
nombre de solutions en supprimant les solutions partielles. On fabrique alors
un arbre binaire et on stop toute exploration de celui-ci ci la solution optimale
ne sera jamais atteinte par cette branche. On réduit ainsi le nombre de solutions
à tester.
Voir `Ehrgott et Gandibleux, 2000 (2-)`.

***Programmation Dynamique:***
La seule solution envisageable dans notre cas pour ces méthode est donc la
programmation dynamique.
Utilisant l’équation récursive de Bellman pour rechercher le chemin optimal à
partir des sous chemins optimaux trouvés au appels récursifs précédents.
Cette solution semble donc intéressant de part sa rapidité (Polynomial) pour un
ensemble de cardinalité élevé.
Voir `Bellman, 1940 (3-)`.


***


<img src="Classification_optimisations_lineaire.png"/>
Comme décrit ci-dessus ce groupe de méthode ne sera que rapidement décrites car
non utilisable dans notre cas.
Les approches utilisant le gradiant nécessite de connaître l’expression analytique
ou/et la régularité ou/et le gradiant des critères de décision. Ceux-ci étant
implicites nous n’avons pas ces informations.


***


<img src="Classification_optimisations_approchee.png"/>
Le dernier ensemble de méthodes correspond aux méthodes approchées.
Elle sont plus rapide que les méthodes exactes mais ne garantissent pas de trouver
**la meilleure solution**.

    - Elles sont d’origine combinatoire.
    - Elles peuvent s’adapter aux problèmes continus.
    - Elles sont directe (pas de gradient --> pas d’expression analytique).
    - Utilise une analogie du vivant ou de phénomènes physiques.

***


<img src="Classification_optimisations_final.png"/>
Enfin dans les méta-heuristiques on note deux familles:

    - De voisinage faisant progresser une seule solution à la fois.
    - Distribués construisant des solution en manipulant en parallèle
      une population de solution.


Il existe différentes approches de voisinage:

    - Recuit simulé (Berthiau, 1994 (4-)| Siarry, 1986 (5-))
    - Recherche Tabou (Glover et Laguna, 1997 (6-) | Gendreau et al., 1994 (7-))

On note que la méthode du recuit simulé est diffile à initialiser et que la
recherche tabou demande beaucoup de mémoire car on stocke l’ensemble des solutions
déjà explorées dans une ensemble (set).

Il existe aussi différentes approches distribuées:

    - Colonies de fourmies
    - Essaims particulaires (Stéphanie Decker, 2015 (8-) | Coello et Lechuga, 2002 (9-))
    - Algorithmes génétiques (le plus utilisé)
    - Reseaux de neurones (Sun et al., 1996 (10-))
    - Greedy random adaptative search procedure (Gandibleux et al., 1998 (11-))


<img src="Classification_metaheuristiques.png"/>

Les algorithmes relatifs à ces approches peuvent être consultés:

    - Berthiau et Siarry, 2001 (12-)
    - Dréo et al., 2003 (13-)
    - Cours de methode et résolution exactes heuristiques et métaheuristiques
      Université Mohammed V, Rabat (14-)

***


<img src="Classification_optimisations_restantes.png"/>
L’ensemble des méthodes retenues peuvent ainsi être réduites à cet arbre.


***Programmation Dynamique:***
On notera que la programmation dynamique est appropriée dans le cas où on a une
opimisation séquentielle recherchant sur des solutions communes. Par principe on
stocke un ensemble de chemin afin d’aller plus vite la prochaine fois que l’on veut
explorer ces chemins.

***De voisinage:***
La difficulté de l’initialisation et le problème de mémoire de ces approches
rendent ces solutions difficiles à mettre en place dans un problème multicritères
qui complique déjà l’optimisation et la quantité de solution.

***Thomas: À vérifier***
Notre cas d’étude génère que des solutions différentes et donc l’algorithme n’est
pas adapté. À l’inverse de la thèse de Mathieu Rivalain qui réalisé  une optimisation
sur la rénovation en plusieures étapes utilisant donc cette approche de manière
adaptée.

***Meta-Heuristique:***
Le choix d’un méta-heuristique ne suivant aucunes règles théoriques le choix est
alors subjectif.
L’approche ayant retenue mon attention est l’approche des ***colonies de fourmis***.


***


<img src="Classification_optimisations_ACS.png"/>
On fait ainsi le choix de l’approche par colonie de fourmis.
On note que les approches ***MinMax*** et ***Ant Colony System*** sont les plus performantes
pour une recherche globale dans les solutions en évitant les optimums locaux.
Une évaluation de cette approche est disponible dans:
`Manuel López-Ibàñez Infante. Multi-objectives Ant Colony Optimization`.

***MinMax***
La valeur de chaque piste est bornée par un min et un max.
Seule la meilleure fourmi met à jour une piste de phéromones.
La mise à jour ce fait de manière inversement proportionnelle:

    - On initialise au max tous les chemins.
    - On diminue que la meilleure solution.

Cette approche permet d’éviter les optimums locaux et favorise lintensification
des solution prometeuses.

***Ant Colony System***
Chaque fourmis met à jour localement la piste de phéromone.
La mise à jour globale est part contre uniquement mise à jour par la meilleur.
Enfin on sélectionne la prochaine destination de la fourmis selon une liste de
candidats et si cette liste et vide selon un tirage aleatoire uniforme.
Cette approche cherche à obtenir une balance entre intensification et
diversification.




***



***



***


# Formulation d’un problème multi-objectifs:
La phase prélimimaire consiste à formuler le problème afin de choisir une méthode
d’optimisation adaptée. On doit ainsi choisir les objectifs, les variables de décisions,
et les contraintes de conception.
Les fonctions objectifs peuvent être quantitatives ou qualitative. Le résultat de simulation
pouvant être une fonction quantitative.
Les variables de décisions sont l’ensemble des paramètres que le constructeur
peut exploiter pour optimiser le système solaire et son bâtiment.
Il existe des variables qualitatives (nominales et ordinales) et quantitative (discrètes et continues)
`Voir thèse Stéphanie p.56`
Il est aussi nécessaire de limiter le nombre de variables étudiées sous peine de
faire exploser le nombre de simulations nécessaires (grande cardinalité).
`Nguyen A-T, Reiter S, Rigo P (2014) A review on simulation-based optimization methods applied to building performance analysis. Appl Energy 113:1043-1058`

De plus les développements précédent montre que la recherche doit donner des solutions de bonne qualité
mais aussi explorer de façon large l’espace de recherche. Ceci se traduit par un ensemble de solutions
respectant les contraintes et objectifs pour un espace de compromis le plus large possible.
Il convient aussi de définir la "performance" d’un solution au regard des objectifs afin de caractériser
la convergence vers un ensemble pareto optimal des différentes générations.
Un des critère de performance évident est donc la valeur maximale/moyenne pour chaque objectifs de génération en génération.
`Mathieu Rivallain, (2013) Étude de l’aide a la décision par optimisation multicritère des programmes de réhabilitation énergétique séquentielle des bâtiments existants, thesis`

On rappelle que l’approche choisie permet de faire évoluer une population donnée (pareto optimale à l’iteration) vers
un ensemble de solution pareto optimales (pareto optimales théorique). Les méthodes de meta-heuristique ne permettent pas
de garantir d’obtenir ce front théorique optimal mais permettent de tendre vers.
Les méthodes étant approchées, il est intéressant d’évaluer la reproductibilité de
l’optimisation ou du moins de la suggérer en faisant plusieurs fois l’optimisation.
La stabilisation de l’espace de solution permet aussi de montrer que des itérations
supplémentaires sont non nécessaires car ne feront pas/peu progresser le front de pareto.
L’évaluation par groupe de solutions permet de mieux voir l’impact des variations d’un critère.
Par exemple, on peut voir les deux front de pareto si on modifie la température de consigne
de 19 à 20°C.


**Objectifs:**
On cherche à définir une maison avec la plus forte couverture solaire pour un coût
le plus faible possible.
Nous avons donc les objectifs suivants:

    - Augmenter le taux de couverture solaire (ECS, Chauffage)

    - Réduire le coût de la solution.

Les objectifs ci-dessous ont été exclu afin de limiter les facteurs/combinaisons à évaluer:

    - Confort acoustique
    - Confort air intérieur (QAI)
    - Aspect sociaux
    - Confort lumineux

**Évaluation des objectifs:**
Les objectifs seront évalué en utilisant les résultats du chauffage et de la couverture
ECS par mois et non seulement la valeur annuelle. Une séparation entre couverture chauffage
et ECS est faite car il a déjà été observée que la modification des volumes des ballons
n’affectent pas les deux de la même façon. Dans notre étude l’amélioration de la
couverture en chauffage sera alors mieux valorisée afin d’orienter la recherche
vers des solutions performante en chauffage solaire qui est aujourd’hui la limite
des systèmes solaires. Ce choix introduit un critère **à priori** permettant de
construire des solutions performante pour le chauffage solaire.

En effet il est intéressant de voir l’impact en fonction du mois pour ensuite
construire un indicateur annuelle par pondération pour favoriser les solutions
qui améliore les performances durant les mois les plus rudes ?

**Il est donc nécessaire de définir une méthode d’agrégation ou bien de définir
deux objectifs distincts (chauffage solaire et ECS solaire)**

**Contraintes:**
Le bâtiment devra être MEPOS au sens de COMEPOS. Ainsi la consommation du bâtiment
devra être faible et compensé par les apports sur site.
Nous avons ainsi les contraintes suivantes:

    - Atteindre une consommation énergétique faible (MEPOS selon COMEPOS) (intervalle à définir)
    - Compensé l’énergie nécessaire et l’énergie produite
    - Partage de la surface de toiture entre les énergies solaires
    - Espace disponible en intérieur (contrainte constructeur ou à introduire dans l’optimisation??)

La seule vraie contrainte au niveau de l’optimisation est la compensation de l’énergie
produite et consommée. En effet l’espace disponible peut être contraint en amont en limitant
la taille de variation des systèmes. De même la surface de toiture étant connue la
répartition des surfaces de toiture est aussi définie en amont.
Cependant les deux premières qui sont en fait liées ne peuvent être définie en amont
et il est donc nécessaire de réaliser une optimisation sous contrainte.
L’optimisation sous contrainte diffère sur la sélection des solutions non-dominés.
En effet une fonction contrainte (pouvant prendre une valeur allant de 0 à 1) doit être
définie. 0 signifiant que aucunes contraintes n’a été violées et 1 que l’ensemble des
contraintes le sont. Afin de ne pas trop limité l’espace de recherche et donc les
solutions potentielles il est intéressant de ne pas négliger les solutions qui
violent faiblement la fonction contrainte ( 0 < valeur < 1). Une solution optimale
et respectant les contraintes pourrait émergé à partir d’une solution violant
la fonction contrainte.



**Variables de décision:**
L’ensemble des variables de décisions se compose de variables quantitatives discrètes
et continues.

Variables discrètes:
    - Surface de capteur thermiques
    - Surface photovoltaïque
    - Orientation capteurs (possible d’avoir des variations)
    - Inclinaison capteurs (si terrasse sinon imposée par la toiture)
    - Mode constructif
    - Répartition surface vitrée
    - Surface totale vitrée
    - Performance vitrage (facteur solaire, Uw)
    - Épaisseur isolant
    - Volume ballon stockage `force variation de la hauteur/largeur`
    - Volume ballon ECS `force variation de la hauteur/largeur`
    - Appoint (Électrique, gaz, fioul)
    - Terminaux (Plancher chauffant, radiateurs, convecteur)
    - Débit solaire
    - Débit chauffage
    - Température de soufflage `propre aux systèmes air`
    - Débit de soufflage `propre aux systèmes air`
    - Inertie des équipements internes
    - Profil de puisage (scénario, volume puisé, débit de puisage, ...)
    -
    -

Variables continues:
    -

    -


**Notes:**

 - Ne pas se limiter à une orientation pour tous les capteurs mais à faire des groupes
   avec une orientation pour chaque...


Il peut aussi être intéressant de regarder de ce que a fait Antoine Leconte et
Philippe Papillon pour l’ ISES (International Solar Energie Society).
Ils apportent des modifications de la méthode de calcul du facteur `Fractionnal
Energy Saving`. Ils proposent aussi une approche permettant de vérifier la performance
des systèmes solaire en monitoring sans avoir à attendre une année complète.

***



***



***



# Thèse: Les systèmes envisageables.

Afin d’obtenir le niveau de performance envisagé en utilisant un maximum le
solaire, nous avons pré-sélectionné les solutions suivantes:

***Photovoltaïque:***

    - auxilaire
    - électroménager

***Solaire thermique:***

    - Chauffage
    - ECS

***Appoint:***

    - Chaudière Gaz
    - Résistance électrique
    - PAC gaz
    - PAC élec


La PAC gaz (absorption) a de nombreux avantages:

    - Pas de compresseur:
        + Fonctionnement silencieux
        + Réduction consommations électriques
    - Faible entretien (juste le bruleur) et durée de vie importante
    - Fluide frigorigènes moins couteux et moins dangereux
    - Investissement plus faible que pour une PAC classique

La question qui se pose cependant et de savoir si le couplage solaire/PAC absorption
est éfficace (coût + consommation + écologie). On notera aussi la nécessité d’un
stockage pour éviter les cycles courts.
Le niveau de température nécessaire au fonctionnement de ces systèmes est cependant
limitant avec de simple capteurs solaires (non-concentration).


La résistance électrique elle représente la solution simple au vue des faibles
demandes de chauffage que la maison demandera.

La solution avec PAC et chaudière semble les plus prometteuses:

    - préchauffage de l’eau pour maintenir un haut rendement PAC / chaudière
      (voir publication japonaise IBPC Turin)
    - Plus faible investisement pour la solution gaz si disponible.
    - Très bon rendement pour les deux.

On a cependant de lourds coût d’entretien coté PAC.


***



***



***



# Thèse: Bibliographie Optimisation

## Thèse de Mathieu Rivalain:

    1-) Mandow, L., Millan, E. (1996). Goal programming and heuristic search. In R. Caballero, F. Ruiz, and
        R. Steuer, editors, Secont Int. Conf. on multi-objective programming and goal programming MOP
        GP’96, pp.48-56. Torremolinos, Spain.

    2-) Ehrgott, M., Gandibleux, X. (2000). A survey and annotated bibliography of multiobjective combinatorial
        optimization. OR Spektrum, 22, pp.425–460.

    3-) Bellman, R. (1954). The Theory of Dynamic Programming. Bull. Amer. Math. Soc., pp.503-515.
        Bellman, R. (1957). Dynamic Programming. Princeton University Press, New Jersey.

    4-) Berthiau, G. (1994). La méthode du recuit simulé pour la conception des circuits électroniques : adaptation
        et comparaison avec d’autres méthodes d’optimisation. Thèse de Doctorat de l’Ecole Centrale
        de Paris.

    5-) Siarry, P. (1986). La méthode du recuit simulé : application à la conception de circuits électroniques.
        Thèse de Doctorat de l’Université Pierre et Marie Curie, Paris 6.

    6-) Glover, F. (1977). Heuristics for integer programming using surrogate constraints. Decision Sciences,
        8(1), pp.156–166.

    7-) Gendreau, M., Hertz, A., Laporte, G. (1994). A Tabu Search Algorithm for the Vehicle Routing Problem.
        Management Sci., 40, pp.1276-1290.

    9-) Coello Coello, C.A., Lechuga, M.S. (2002). MOPSO: a proposal for multiple objective particle swarm
        optimization. In Proceedings of the 2002 Congress on Evolutionary Computation, 2002. CEC '02.

    10-) Sun, M., Stam, A., Steuer, R. (1996). Solving multiple objective programming problems using feedforward
         artificial neural networks: The interactive FFANN procedure. Management Science, 42(6),
         pp.835–849.

    11-) Gandibleux, X.,Vancoppenolle, D.,Tuyttens, D. (1998) A first making use of GRASP for solving
         MOCO problems. Technical report. University of Valenciennes, France. Paper presented at MCDM
         14, Charlottesville,VA.

    12-) Berthiau. G., Siarry, P. (2001). Etat de l’art des méthodes d’optimisation globale. RAIRO-Operations
         Research, tome 35, n°3, pp.329-365.

    13-) Dréo, J., Petrowski, A., Siarry, P., Taillard, E. (2003). Métaheuristiques pour l’optimisation difficile.
         Recuit simulé, recherché avec tabous, algorithmes évolutionnaires et algorithmes génétiques, colonies
         de fourmis. Eyrolles.

***


## MultiObjective Ant Colony Optimization:

### Globales:

    - Manuel López-Ibàñez Infante. Multi-objectives Ant Colony Optimization.


### Ant Colony Optimization (ACO):

    - M. Dorigo and T. Stïutzle. Ant Colony Optimization. MIT Press, Cambridge,
      MA, 2004.

***Ant Colony System:***

    - M. Dorigo and L. M. Gambardella. Ant colony system: A cooperative
      learning approach to the traveling salesman problem. IEEE Transactions
      on Evolutionary Computation, 1(1):53–66, April 1997.

    - L. M. Gambardella and M. Dorigo. Solving symmetric and asymmetric
      TSPs by ant colonies. In Proceedings of the IEEE International Conference
      on Evolutionary Computation (ICEC’96), pages 622–627, Piscataway,
      USA, 1996. IEEE Press.

***Max Min Ant system (MMAS):***

    - T. Stützle and H. H. Hoos. MAX-MIN ant system. Future Generation
      Computer Systems, 16(8):889–914, 2000.


## MultiObjective Bee Colony Optimization:

### Global:

    - http://www.scholarpedia.org/article/Artificial_bee_colony_algorithm


### Optimisation:

    - Hao Zhang et al., Multi-Objective Optimization_2012.pdf
    - SeyedSaleh Rastkhadiv et al., Multi-Objective Clustering using Artificial Bee Colony_2013.pdf
    - Reza Akbari, A multi-objective artificial bee colony algorithm_2012.pdf
