# Optimisation multi-critères:

## Principe et informations générales:
### Acronymes:
MCDM: Multiple Criteria Decision Making
MCDA: Multiple Criteria Decision Analysis


### Définition générale:
Il n’existe pas une solution optimale mais un ensemble de meilleures alternatives
dans un ensemble d’alternatives disponibles.
Il faut alors définir les solutions non dominées.
***Solution non-dominées:*** Impossible de choisir une autre solution sans sacrifier un
critère au moins.
L’ensemble de ces solutions est trop grande pour être utilisées pour faire un choix
et doivent donc être traitées.


### Typologie:
Il y a différentes classification (solution définie explicitement or implicitement).

***Multiple criteria evaluation problems: MCEP***
Nombre défini d’alternatives explicitement connus dès le début.

***Multiple criteria design problems: MCDP***
Alternatives non explicitement connus. Les solutions sont alors trouver en utilisant
un modèle mathématique.

***Methodes:***
Certaines nécessite les préférence de décision en début de processus (méthode opérant
par `prior articulation of preferences`)

D’autres nécessite les préférences durant le processus (intéractive méthodes or
méthodes qui requiert une `progressive articulation of preferences`).
Elle a été largement développée pour les deux classifications.

Les MCDP nécessitent la solution a une série de problèmes mathématiques.


### Representation:
On cherche à minimiser ou maximiser l’ensemble des critères. On obtient alors
un ensemble de solutions faiblement non dominés qui inclut l’ensemble non-dominé
et certains dominés spéciaux. Ces points (de l’ensemble) sont localisé ou sur
l’áxe vertical ou sur l’horizontale.

***Point idéal:*** Represent the best des chaque fonction objectif correspodant
sous d’un cas non réalisable.

***Point de Nadir:*** Represente le point le plus défavorale (appartient aux points
domines)


### Biliométrie au cours du temps de leur évolution:
Bragge, Korhonen, H. Wallenius and, J. Wallenius 2010


## Méthode mathématique d'analyse multicritère:
L’énsemble des méthodes sont sujettent à l’`explosion combinatoire`. On peut limiter
cet effet en limitant les varaitions autorisées sur les critères et en utilisant
un buffer pour garder en mémoire le résultat des calculs déja réalisés.

Il existe de nombreuses méthodes que l’on peut classer en deux catégories:
    - Agrégation a priori de critères en un critère unique
    - Apprcohe fonfé sur le surclassement

### Définition:
Atteindre un objectif parmis un grand nombre de variations.

`Critère:` Fondction définie sur l’ensemble des actions possibles pour atteindre
           un ojectif.
`Poids:` Importance d’un critère par rapport aux autres (point de vue décideur).

### Agrégation de critères en un critère unique:

Voir wikipédia: https://fr.wikipedia.org/wiki/M%C3%A9thode_math%C3%A9matique_d'analyse_multicrit%C3%A8re

***Somme pondérée:*** On `normalise l’ensemble des poids (somme == 1).
Pour utiliser des fonction à minimiser il faut reécrire le poids par soustraction
au plus gros poids pour ce critère du poids de chaque variante:
    ---> max(poids_critere) - poids_critere
On normalise ensuite l’ensemble des critère puis leur poids.

***Analyse multicritère hierarchique : méthode de Saaty***:
Limitée lorsque de nombreux critères entre en compte.
Fait la comparaison de toutes les comparaisons possible (ce qui n’est pas
forcement le cas).


***Methode ELECTRE:***
Accès aux variantes les plus performantes plus complexe et nécessitant une autre
méthode d’analyse multicritères.


## Bibliographie
### Livres:
Multicriteria optimization, Matthias Ehrgott, 2005


### Cours:
Cours des méthodes de résolution exactes heuristiques et metaheuristiques, 2010

### Thèses:
Optimisation multicritère : fondements et concepts, Imed Othmani, 2004


### Publications:
A multi-criteria system design optimization for net zero energybuildings under uncertainties, Yongjun Suna, 2015

