# Aide à la décision pour la réhabilitation énergétique séquentielle des bâtiments existants.

Mise à jour: 20151002

## Espace de décision et espace des objectifs.
`Page 29`
Définir un espace représentatif de l’ensemble des solutions potentielles du
problème.

On a une solution dépendant des variables choisies qui est évaluable dans l’espace
des objectifs suivant les fonctions objectifs.

Cet espace de décision est à motiver (biblio, retour modélisation, retour expérimental, ...).

Utiliser la recherche bibliographique pour montrer le caractère multi-critère de
l’optimisation.
## Approche de recherche.
`Page 53`
Exclusion des approches d’agrégation car impossible avec l’analyse de cycle de
vie. De plus une compensation implicite sera induite par cette approche orientant
la décision en amont, ce qui n’est pas son but. Il souhaite laisser les compromis
à la disposition des dévideurs.

### Modèle utilisés.
#### Écologique.
`Annexe 5 et Page 51`
Détail du modèle utilisé pour le calcul de l’impact écologique.
Références `Page 43-44`

`Page 55`
Méthodologie de l’analyse de cycle de vie:

    - LCCA: Life Cycle Cost Analysis (ou LCC)  --> coût
    - LCCF: Life Cycle Carbon Footprint        --> Énergie grise

`Page 67`
Implémentation du modèle de cycle de vie.

    1- Récupérer les données structurelles du bâtiment.
    2- Collecter les infos sur la base de données de l’INIES (service web dispo)
    3- Définir les quantitées:
        + Production
        + Fin de vie
        + Usage

Développé sous Delphi.

#### Économique.
`Page 52`
Détail des facteurs économiques retenus avec formules correspondantes.
Voir aussi:

    - Bullier 2011: Valeur Verte.
    - Chabit 2005: Méthode TEC.

#### Autres:
`Page 63-65`
Calcul rendement chaudière selon règle TH.
`Page 66`
Modèle ECS avec température d’eau froide constante.
Estimation des consommations des auxiliaires.
`Page 74`
Équation pour passer du I4 au n50 (infiltrations).
`Page 75`
Scénarios d’occupation/apports internes simplifiés

### Couplage
Couplage Comfie avec Delphi pour le scripting.


## Aide à la décision
`Page 89`
MCDA: Multi Criteria Décision Analysis
Sélection d’une ou plusieurs solutions dans un ensemble non-dominé (voir Pareto).
On a donc besoin d’introduire des informations subjectives.
`Page 90`
Référence vers détail des choix préférentiels inter et intra critère
Différentes approches possibles:
Approche par critère de synthèse. Les poids étant subjectifs et la solution étant
fortement dépendante de ces poids on atteint la limite de cette méthode.
`Page 92`
Approche par modèle relationnel. On évalue chaque couple de solution par des
méthodes de surclassement.
`Page 94`
Ces méthode nécessitent:

    - D’avoir un ensemble de solutions non-dominées
    - De pouvoir estimer les pondérations
    - D’ajouter un caratère subjectif au choix
On a donc une méthode trop dépendante des intervenants mais qui pourrait être
appliquée en aval de l’optimisation pour réduire les choix.


## Optimisation
`Page 85`
Choix de dominance au sens de Pareto pour limiter la complexité. Récupération
uniquement du front qui correspond aux solution dominantes.
`Page 94`
Description des deux approches.

### Approche par préférence:
`Page 97`
Différentes méthodes:

    - Pondération
    - E-contrainte
    - min-max
Les 3 nécessite une iteration de la méthode. Les 3 consistent à transformer en
mono-critère le problème multi-critère.
La pondération est sensible à la convexité/concavité du front les deux autres non.
`Page 100`
Description des autres méthodes

Ces méthodes nécessitent une connaissance du problème en amont car le choix des
coefficient/contraintes influencera le résultat. On a donc une implication d’un
choix préférenciel en amont.


### Pareto de génération
`Page 103`
Methodes exactes:

    - A*
    - Programmation dynamique
    - Séparation/évaluation
    - Énumérative

`Page 104`
Méthodes approchées:

    - Heuristiques
    - Méta-heuristiques

Le terme heuristique est à comprendre comme algorithme fournissant des solutions
approchées en temps de calcul polynomial contrairement aux méthodes exactes.

On distigue les méta-heuristiques de voisinage (ex: recuit simulé) qui ne font progresser que une solution
à la fois et les méta-heuristiques distribuées (ex: algo génétiques, colonnies de fourmis,
essaim particulaire) qui construisent des solutions en manipulant en parallèle
toute la population de solution.

`Page 109`
Conclusion sur l’optimisation.
Écartement des solution basées sur la préférence car on cherche à proposer une
plage de solution et non quelles solutions isolées.
Étude de deux solutions:

    - Algo génétique
    - Programmation dynamique


# Optimisation multicritère et algorithme génétique pour la réhabilitation énergétique des bâtiments existants
