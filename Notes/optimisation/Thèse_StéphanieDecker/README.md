# Réunion avec Stéphanie Decker 2016-03-29:

***Mise à jour: 20160329***

Impossible de coupler les meta-modèles de ma maison et les systèmes à cause des
trop grosses variations de composition/génération.

Pour la partie d’aide à la décision, il est intéressant de regarder du coté des methodes

 - ELECTRE tri (réduction du nombre de solution)
 - ELECTRE 3   (Classement des solutions)

`Stéphanie` a utilisé un logiciel disponible gratuitement sur internet (voir avec elle).

Limitation de la méthode de epsilon-dominance:

 - Selection d’une unique solution dans chaque boîte pouvant entrainer la suppression
.. de solution équivalentes (même performance mais avec des critères différents)

*

*

*

# PRESENTATION: Développement d’une méthode d’optimisation multi objectifs pour la construction bois.

***Mise à jour: 20160325***

## Etat de l’art: Conception multicritère

    - Attia 2013
    - Evins 2013
    - Nguyen 2014
    - Machairas 2014


## Optimisation incrémentale:
Utilisation d’un cas de base puis variation des paramètres par objectifs traités
indépendamment et successivement:
--> ce limite à l’ámélioration d’un cas précis.


## Ce que l’on cherche:
Trouver les solutions optimales
---> Front de Pareto


## Approches:

    - Pareto PUIS optimisation
    - optimisation PUIS pareto (choix retenu)
    - cumulative

## Méthode d’optimisation:

    - Énumération exhausive ou optimisation aléatoire
        ---> Temps de calcul élevé
    - Optimisation approchée (choix retenu)
        ---> Méthode déterministe
        ---> Méthode méthaheuristiques (choix retenu)

`Wolpert et Macready 1997`: "No free lunch theorem"
---> Optimisation par essaim particulaire (choix retenu) (second plus utilisé derrière les
     algorithmes génétiques)

    - Intuitif
    - Rapide à programmer
    - Faible nombre de paramètre

---> Adapté au monde professionnel (Ingénieur).


## Identification:
Utilisation de la méthode de Sobol (Bibliothèque `OpenTurns`) (choix retenu)
(Voir scripts et thèse `Rania Merheb` et notes sur polynomes chaos)

    - Définition de coefficient entre 0 et 1 (la somme devant faire 1 pile)
    - Obtention des indice de niveau 1 puis totaux:
        + Faible intéractions == indices 1 et totaux similaire

Vérification par la méthode de Morris de la cohérence des résultats (autre approche
pour l’identification).


## Modélisation des fonctions objectifs:

    - Pondération au m2 des impact environnementaux
    - Polynômes du chaos (voir Sobol pour les obtenir) afin d’accélérer la "simulation"
      du bâtiment (On réduit le bâtiment à un ensemble de coefficient pondérateur)
      (Voir `Identification`)
      ---> Obtention d’un méta-modèle représentant le bâtiment.

## Mise en oeuvre:

    - Validation du méta-modèle en simulant des combinaisons aléatoires avec Énergie +
      ---> Obtient des résultats similaire (spécialement pour la tranche de performance
           requise)
Le validation utilise les indicateurs de fiabilité suivant:

    - RMSE: Erreur quadratique moyenne.
    - MAE: Erreur absolue maximale.

## Multi-objectif:
Utilisation du logiciel gratuit (`XDAT`) afin d’offrir un contrôle
sur le choix de la solution au deamndeur final.


## Autres:
Limitation du nombre d’objectifs possibles (`Hisao Ishibuchi 2008`)


## Questions:
Quel est votre niveau de confiance dans les simplifications/modèles retenues ?

Quelle est votre contribution scientifique et dans le domaine d’étude ?

Pourquoi il n’y a que de faibles intéractions entre les critères ?
---> Énergie + prend en compte l’intéraction entre orientation/protections solaires/chape
pour l’inertie ?


## Notes:
Vérifier les informations des encadrants (le monde est contre vous !!)
Présenter et mettre en valeur l’originalité de la thèse.



*

*

*



# Thèse: Développement d’une méthode d’optimisation multi-objectifs pour la construction bois.

***Mise à jour: 20160329***

## Chapitre 2: Méthodes adoptées en conception multicritère de bâtiment
### La conception multicritère d’un bâtiment : un problème d’optimisation multiobjectif
`P.52`
La conception multi-critère du bâtiment et traditionnellement est un processus itératif.
On améliore souvent l’idée de base.


### Formulation des problèmes d’optimisation multiobjectif dans le bâtiment
`P.54`
Classification des problèmes multi-critères: **Roy et al., 2008**
Formulation du problème: **Wright et al., 2002**

`P.55`
Objectifs les plus utilisés:

 - Construction durable: **Evins, 2013** (comparatif complet sur l’optimisation)
 - Bâtiment Zéro Énergie: **Attia et al. 2013**

`P.56`
Les types de variables de décision: **Eric Brunelle 2008**

`P.57`
Description des méthodologies d’optimisation: **Horn 1996** et **Colette et Siarry 2002**
*Optimisation précède l’aide à la décision:*
 - Recherche d’un front de Pareto
 - Aide à la décision à partir de ces solutions
Jeu de solution sans caractère subjectif

*Optimisation succède à l’aide à la décision:*
 - Agrégation des objectifs en un objectif unique
Solution unique pour chaque jeu de paramètres et pas d’information de comparaisons
entre les solutions.
Intégration de critères subjectif en amont

*Optimisation continue*
Similaire à la dernière. Processus itératif permettant d’obtenir une solution unique
à la fin.

`P.64`
Description des méthodes d’optimisation multi-critères existantes.

`P.66`
Choix d’une méthode d’optimisation approchée: **Nguyen et al., 2014**

`P.74`
Récapitulatif sur le processus d’optimisation

## Chapitre 3: Choix des objectifs pertinents et sélection des variables significatives
Définition des objectifs et du choix des variables

`p.119`
Choix de la méthode d’étude de sensibilité (À lire avec doc **Stéphanie Bontemps**)


## Chapitre 4: Explicitation des liens entre variables et objectifs et modélisation des fonctions-objectif
Détail des méthodes employées pour chaque objectifs et sa mise en équation.
Meta-modèle pour la partie thermique + détail du processus complet.
Réalisation du graphe d’influence pour évaluer l’impact visuellement de chaque critère
sur les différents objectifs.
Description des contraintes liées au dimensionnement et à la structure.


## Chapitre 5: Choix d’une méthode d’optimisation adaptée au problème:
Comparaison avec les algorithmes existants et plus particulièrement dans ce domaine.
Description de la méthode:

 - Fonctionnement
 - Mise à jour des variables (discrètes et continues)
 - Paramètres nécessaires au fonctionnement du meta-heuristique
