# Vers un outil d’aide à la décision : Plan chapitre 3

## Introduction du chapitre

## Choix d’une méthodologie adaptée
### 1) Méthodologies existantes
  - Formulation / Définition
  - Optimisation puis décision (à posteriori)
  - Décision puis optimisation (à priori --> agrégation)
  - Décision + Optimisation (combinée, itératif)
  - Introduire partie suivante

<br/>

### 2) Réduire la cardinalité du problème
#### Principe de l’analyse de sensibilité
  - Définir l’ensemble des facteurs influents à priori et les objectifs
  - Limiter la variation en fonction des objectifs
  - Décrire méthodes existantes :
    - Quand les utiliser ?
    - Quels limites ?

#### Méthode de criblage : Morris
  - Décrire principe
  - Décrire améliorations
  - Limites (variables continues)

<br/>

### 3) Les méthodes d’optimisation
#### L’optimisation
  - Définition + vocabulaire
    - Exemples d’application
  - Introduction des type de variables (discrètes, continues)
  - Extension au cas multi-objectif
    - Description des approches (arbre des méthodes)
    - Description des méthodes
      - Pareto (approches de dominance, techniques de diversité)
        - Dominance rank
        - Dominance depth
        - Dominance account
      - Non Pareto / Non scalaire
      - Scalaire
    - MOCO vs Continuous optimization

_Basseur200639_, _Armand-Decker2015_

#### Les Méta-heuristiques

_Généralités_

  - Définition, différence heuristique et méta-heuristique, utilité, limites, ...
  - Introduire intelligence artificielle
  - Décrire existant : Évolutionnaires / Essaim / Autres
  - Comment choisir ? Nombre de paramètres / Applicabilité / Subjectivité

_Approches basées sur les essaims_

  - Décrire les caractéristiques des essaims
  - Décrire les différents algorithmes existants avec des applications



## Construction d’un Méta-heuristique
### 1) Générateur de solutions
#### Motivations
  - Nécessite peu de paramètre à tuner
  - Respecte les règles caractéristiques des essaims
  - Simplicité de fonctionnement / implémentation
  - Équilibre entre exploitation et exploration
  - Capacité à s’extraire des optimums locaux
  - Limiter le nombre d’évaluations nécessaires (vitesse de convergence)

#### Artificial Bee Colony (ABC)
  - Décrire son histoire
  - Décrire le fonctionnement de l’algorithme
    - Les phases (exploitation / recherche locale / exploration)
    - L’apprentissage par la mise en commun
    - Recherche stochastique
  - Extension aux problèmes multi-objectif
  - Améliorations
    - Existantes
    - Vol de Lévy pour les Scouts
    - Apprentissage par vecteur opposés pour l’initialisation
  - (Faire propagande avec des articles montrant qu’il se comporte mieux !)

<br/>

### 2) Stockage des solutions optimales
#### Motivations
  - Garder en mémoire l’évolution du front (multi-objectif)
  - Tenir compte de problèmes à objectifs multiples
  - Assurer l’élitisme
  - Fournir une base d’apprentissage (mémoire) pour progresser dans la recherche
  - Limiter le nombre de solutions retenues

#### Epsilon-Archive ($\epsilon$-archive)
  - Introduire les techniques de diversité existantes (Kernel, nearest, hist)
  - Décrire le fonctionnement
  - Comparer avec les autres approches existantes
    - Mettre en exergue l’élitisme nécessaire à la convergence
    - Mettre en exergue la rapidité de l’approche
    - Mettre en exergue la diversité qu’il apporte
    - Mettre en exergue la robustesse lorsque le nombre d’objectif augmente

<br/>

_Laumanns2002263_, _Deb2005501_

### 3) Prendre en compte les contraintes
  - Décrire les méthodes existantes
    - Pénalité (diverses approches avec des poids)
    - Exclusion (ne considère pas du tout les solutions sous contraintes)
    - Deb rules (priorité aux solutions respectant les contraintes)
  - Décrire la méthode retenue
    - Accepte des solutions avec contraintes
    - Améliore l’exploration
    - Capacité à contrôler / limiter le nombre de solution sous contraintes
  - Cas spécifique de l’archivage
    - Comportement stricte pour les solutions dans l’archive
    - Conserver que des solutions possibles / voulues / plausibles

<br/>

### 4) Description globale du Méta-heuristique
  - Décrire algorithme
  - Décrire graphiquement
  - Décrire implémentation
    - Description macro de l’architecture
    - Lien vers bibliothèques



## Que retenir ?
  - Faire un récapitulatif
  - Ouvrir le prochain chapitre
