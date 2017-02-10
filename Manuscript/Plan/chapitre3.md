# Vers un outil d’aide à la décision : Plan chapitre 3

## Introduction du chapitre

## Choix d’une méthodologie adaptée
### 1) Méthodologies existantes
  - Formulation
      - Définition des objectifs
      - Introduction des type de variables (discrètes, continues, qualitatives)
      - Definition des contraintes
  - Différentes approches
      - Optimisation puis décision (à posteriori)
      - Décision puis optimisation (à priori --> agrégation)
      - Décision + Optimisation (combinée, itératif)
  - Bilan et sélection d’une approche

_Armand-Decker2015_, _Rivallain2013_

<br/>

### 2) Les méthodes d’optimisation pour les problèmes mixtes
#### L’optimisation multi-objectif
  - Définition et définition
      - Optimisation
      - Dominance
      - Front de Pareto
      - Points de référence
      - Convexité
  - Description des approches existantes
      - Méthodes continues
          - Impossible avec variables discrètes
          - Nécessite d’être dérivable, d’utiliser un gradient
      - Méthodes exactes
          - Problème de cardinalité
          - Limiter par le temps de simulation
      - Méthodes utilisant un heuristic
          - Spécialisés
          - Parallel
          - Meta
      - Arbre des méthodes pour le bilan
      - Sélection d’une méthode adaptée

_Basseur200639_, _Armand-Decker2015_, _Rivallain2013_

#### Les Méta-heuristiques
_Généralités_

  - Définition, différence heuristique et méta-heuristique, utilité, limites, ...
  - Introduire intelligence artificielle
  - Décrire existant : Évolutionnaires / Essaim / Autres
  - Comment choisir ? Nombre de paramètres / Applicabilité / Subjectivité

_Approches basées sur les essaims_

  - Décrire les caractéristiques des essaims
  - Décrire les différents algorithmes existants avec des applications

_Aboul-EllaHassanien2015_, _Bonabeau1999_, _optimisation-multiobjectif_2002_

<br/>

### 3) Réduire la cardinalité du problème
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

_Iooss2011_, _Saltelli2004_, _Campolongo199975_


## Construction d’un Méta-heuristique
### 1) Générateur de solutions
#### Motivations
  - Nécessite peu de paramètre à tuner
  - Respecte les règles caractéristiques des essaims
  - Simplicité de fonctionnement / implémentation
  - Équilibre entre exploitation et exploration
  - Capacité à s’extraire des optimums locaux
  - Limiter le nombre d’évaluations nécessaires (vitesse de convergence)
  - Irace package pour initialiser le meta-heuristique

#### Artificial Bee Colony (ABC)
  - Décrire son histoire
  - Décrire le fonctionnement de l’algorithme
    - Les phases (exploitation / recherche locale / exploration)
    - L’apprentissage par la mise en commun
    - Recherche stochastique
    - Sélection par roulette (vs proportionelle, rang, ...)
  - Extension aux problèmes multi-objectif
  - Améliorations
    - Existantes
    - Vol de Lévy pour les Scouts (_Mantegna19944677_)
    - Apprentissage par vecteur opposés pour l’initialisation (_Tizhoosh2005695_)
  - (Faire propagande avec des articles montrant qu’il se comporte mieux !)

_Camazine1991547_, _Akbari201239_, _Karaboga2005_

<br/>

### 2) Stockage des solutions optimales
#### Motivations
  - Garder en mémoire l’évolution du front (multi-objectif)
  - Assurer l’élitisme
  - Fournir une base d’apprentissage (mémoire) pour progresser dans la recherche
  - Éviter la redondance
  - Assurer la convergence

#### Epsilon-Archive ($\epsilon$-archive)
  - Introduire les techniques de convergence (Dominance rank, Dominance depth, Dominance account)
  - Introduire les techniques de diversité existantes (Kernel, nearest, hist)
  - Décrire le fonctionnement de cette approche
  - Comparer avec les autres approches existantes
    - Mettre en exergue l’élitisme nécessaire à la convergence
    - Mettre en exergue la rapidité de l’approche
    - Mettre en exergue la diversité qu’il apporte
    - Mettre en exergue la robustesse lorsque le nombre d’objectif augmente
    - Réduction du problème de redondance


_Laumanns2002263_, _Deb2005501_
_37_, _47_, _141_

<br/>


### 3) Prendre en compte les contraintes
  - Décrire les méthodes existantes
    - Pénalité (diverses approches avec des poids)
    - Exclusion (ne considère pas du tout les solutions sous contraintes)
    - Deb rules (priorité aux solutions respectant les contraintes)
  - Décrire la méthode retenue
    - Accepte des solutions avec contraintes
    - Permet d’explorer des espaces contraints
    - Capacité à contrôler / limiter le nombre de solution sous contraintes
  - Cas spécifique de l’archivage
    - Comportement stricte pour les solutions dans l’archive
    - Conserver que des solutions possibles / voulues / plausibles

_Woldesenbet20073077_, _Deb2000311_

<br/>

### 4) Description globale du Méta-heuristique
  - Décrire algorithme graphiquement (fonctionnement global)
  - Décrire implémentation (rapide)
    - Description macro de l’architecture
    - Choix de la parallélisation des évaluations
        - Temps de simulation grand (temps création thread non impactant)
        - Temps de simulation cours (temps création thread impactant)
    - Lien vers bibliothèque : pyMOABC
  - Validation
    - Benchmark importants (Autres en annexes)
    - Autres algorithmes

_Deb2005105_, _Zitzler2000173_

## Que retenir ?
  - Faire un récapitulatif
  - Ouvrir le prochain chapitre
