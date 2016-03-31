# Plan de thèse:

**Mise à jour: 2016-03-25**



# Introduction


********************************************************************************
# I) Contexte des travaux
## Contexte énergétique:
*État de l’art sur:*

 - Évolution de la performance des bâtiments
 - Danger du réchauffement climatique
 - Augmentation de la population


## Systèmes solaires et performance:
*État de l’art sur les modélisation solaires:*

 - Le détail des modèles existants
 - Le détail du contrôle des modèles existants
 - Les travaux déjà réalisés sur le couplage bâtiment/systèmes


Montrer que ces modèles sont très génériques et souvent très simplifiés.
De plus l’algorithme de contrôle est non évalué/optimisé.

Montrer que aujourd’hui peu de travail a été fait sur l’optimisation couplée
et que par conséquent ce sujet est innovant dans son approche du problème


## Le bâtiment à énergie positive:

*Description des approches:*

 - Passivhaus
 - NZEB
 - MEPOS

Sélection d’une approche: MEPOS

Montrer que le solaire thermique n’a pas la côte dans la construction à énergie positive.
Problème de coût, de confiance, ou de performance ?

Montrer que l’innovation passe par le neuf avant d’être intégré à la rénovation.


********************************************************************************
# II) Modélisation:
## Outils utilisés:
*Décrire les outils utilisés:*

 - Modelica
 - Dymola


Pourquoi ces outils ?


## Partie système:
*Quel niveau de détail:*

 - Le niveau choisie et pourquoi ?
 - Le choix d’un modèle existant, pourquoi ?


*Détail des systèmes modélisés:*

 - Liste des systèmes et leur origine
 - Fonctionnement de chaque système
 - Explication de la partie algorithmie plus en détail


## Partie bâtiment:
### Approche mono-zone:

Décrire cette approche et ses limites.

### Approche multi-zone:

*Outils nécessaires:*

 - Energy Plus
 - FMU
 - Python
 - Sketchup
 - Open Studio


Décrire les outils puis les modifications que cela engendre au niveau de la modélisation
des systèmes.

## Premiers résultats
*Analyse paramétrique / premiers résultats:*

 - Identification de l’impact de certains paramètres
 - Résultats de la comparaison mono-zone, multi-zone


********************************************************************************
# III) Validation expérimentale:
*Validation expérimentale des modèles:*

 - Description de l’expérimentation
 - Mise en place
 - Vérification du modèle



********************************************************************************
# IV) Un outil d’aide à la décision:
## Description générale

*Définition:*

 - Formulation
 - Algorithmes existants
 - Application


## Multi-critère

*Description des méthodologies:*

 - Formulation
 - Optimisation puis décision
 - Décision puis optimisation
 - Combinée


*Description des méthodes existantes:*

 - Graphe des possibilités
 - Exactes
 - Approchées


*Les type de variables:*

 - Quantitative
 - Qualitative (combinatoire, continue)


*Approches Pareto:*

 - Comparaisons de solution
 - Front de Pareto
 - Critère de performance (Hyper-volume, répartition, convergence, rapidité)
 - Les méthode de sélection de Front de Pareto


```
Sources:

 - thèse Stéphanie Decker
 - thèse Mathieu Rivalain
```


********************************************************************************
# V) Optimisation du dimensionnement d’un système solaire:
## Pourquoi/comment une optimisation ?

*Rappeler ce qui différencie cette approche des autres issues de la littérature:*

 - Approche couplée système/enveloppe
 - Optimisation complète systèmes/contrôle/enveloppe


*Aide à la décision nécessite en set de solutions optimales:*

 - Génération d’un jeu de solutions optimales

## Description du cas d’étude
### Hypothèses:

*Description du site étudié:*

 - Climat
 - Données météos
 - ...

*Description de la maison:*

 - Composition de base
 - Surface
 - ...

*Descriptions des paramètres fixes:*

 - L’occupation
 - La température de consigne
 - Charges internes
 - ...


## Formulation du problème d’optimisation
*Choix des variables de décisions:*

 - Propre au bâtiment
 - Propre au système
 - Propre au contrôle

*Définir chaque variables:*

 - Type
 - Plage de variation
 - Unité
 - Description


*Définition des objectifs:*

 - Couverture solaire chauffage
 - Couverture solaire ECS
 - Coût de l’installation


*Définition des contraintes:*

 - Surface de toiture à partager (Photovoltaïque)
 - Équilibre entre production/consommation (Primaire)


*Réduction du nombre de variables par l’étude de sensibilité:*

 - Méthodes locales
 - Méthodes globales
 - Screening (Morris)

Nécessiter de limiter le nombre de variables à évaluer pour réduire la cardinalité
du problème.


## Méthode d’optimisation retenue:
Faire un comparatif des solutions existantes et des performances de celles-ci.
Mettre en avant le faible nombre de paramètres nécessaires (bien pour un outil bureau d’étude)
No-free-lunch-theorem est aussi un argument
Mettre en exergue le **problème de temps de calcul** qui sera le facteur influant
sur le choix de l’approche d’optimisation.

*Description du Meta-heuristique choisi:*

 - Origine de l’algorithme (inspiration des abeilles):
Décrire l’origine de cet algorithme. Décrire les recherches qui ont été faites sur
les abeilles et ensuite les conclusions tirées par l’inventeur pour formuler ce
meta-heuristique.
Les sources suivantes non pas encore été lues: `9780674953765`, `10.1016/S0022-5193(05)80098-0`
mais traitent du comportement des abeilles.

 - Formulation théorique:

    + Description des différentes étape de résolution de la méthode:
      Détails pour **onlookers**, **employed**, **scout**, ...
      Détails pour les paramètres nécessaires au fonctionnement de l’heuristique.

    + Description de la mise à jour de la position d’une source:
      Dans le cas de variables continues la formulation de base est applicable et sera
      donc conservée. Dans le cas de variables discrètes on utilisera une méthode alternative
      développée dans `10.1177/0021998308097681` et `tel-01234197, version 1`.

*Description de la mise à jour de l’archive choisie:*

 - Formulation théorique
 - Graphiquement

*Analyse de sensibilité retenue:*

 - Formulation théorique
 - Graphiquement

Ajouter une vision globale du processus d’optimisation sous forme de graphique
servant de résumé du chapitre.


********************************************************************************
# VI) Analyse des résultats du cas d’étude:

## Étude de sensibilité:
*Bénéfice de la méthode:*

 - Rappel des critères en amont de l’étude
 - Sélection des critères en aval de l’étude de sensibilité


## Optimisation
*Discussion sur le front de Pareto obtenu:*

 - Analyse de la répartition des solutions
 - Analyse de la convergence
 - Analyse des résultats


********************************************************************************
# Conclusion
Oui c’est la fin, le grand final !!

## Ouverture
Évaluer la pertinence des fichiers météos pour un dimensionnement solaire
Aide à la décision par des méthodes plus poussées
Méthode de **clustering** pour évaluer le comportement hivernal et estival sur une
longue période.


********************************************************************************
# Sources:
Les différentes sources sont indexées avec leur `DOI` ou `ISBN`.

 - **10.1177/0021998308097681**: Meta-heuristic Methods Applied to the Design of Wood–Plastic Composites, with Some Attention to Environmental Aspects
 - **9780674953765**: http://www.hup.harvard.edu/catalog.php?isbn=9780674953765
 - **10.1016/S0022-5193(05)80098-0**: A model of collective nectar source selection by honey bees: Self-organization through simple rules
 - **tel-01234197, version 1** Développement d’une méthode d’optimisation multiobjectif pour la construction bois : prise en compte du confort des usagers, de l’impact environnemental et de la sécurité de l’ouvrage
