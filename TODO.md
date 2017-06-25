## Optimisation :

### Modifier algorithme solaire :

  - (Fait) Tester (new_ref)
  - (Fait) Inclure nouvelles variables : DeltaT_col et DeltaT_buffer
  - (Fait) Tester sur la période de simulation complète

### Faire fonctionner reference elec :

  - (Fait) Tester
  - (Fait) Limiter le nombre de sorties
  - (Fait) Tester sur la période de simulation complète


### Check :

  - (Fait) Puisage
  - (Fait) Pertes négative et positives
  - (Fait) Effets antagoniste des DeltaT sur chauffage et ECS
  - (Fait) Tank convection
  - (Fait) Harmoniser m_flow mini + Tester différence rapidité (Rien)
  - (Fait) Simulation annuelle Ref, solaire DeltaLow, solaire DeltaHigh


### Conclusions :

**--> Faire optimisation suivant nouveaux indicateurs F_sav**

    - DeltaLow impactant
    - Mini ECS impactant
    - Nouvel algorithme plus performant



## Nouveaux indicateurs :

### FSC = Solaire utile / consommation référence

  - Solaire utile = sum(min(conso_ref, solar_captee) for each month)
  - Nécessite d’ajouter un calcul mensuel des gains solaires

**--> À réaliser uniquement sur les solutions du front final car très contraignant**


### Fsav-aux = 1 - conso / conso_ref

    - Nécessite une consommation de référence pour Bordeaux et Strasbourg

**--> Faire une étude paramétrique supplémentaire pour chaque climat**
**--> Inutile pour sensibilité car on perdrait des informations**





# Rédaction :

## chapitre 2 :

  - Envoyé mail à Aurélie pour questions
  - Décrire débit moyen des pompes avec moyenne et écart type
  - Parlé du modèle de puisage utilisé
  - Parlé du modèle de capteur
  - Décrire pour les autres modèles le composant utilisé
  - Corriger algo chauffage
  - Mieux décrire les onOff et hystérésis
  - Expliciter l’initialisation
  - Ajouter comparaison avec autres logiciels
  - Introduire nouveau algorithme
    - Activation indirect et directe en fonction de Tin échangeur
    - Comparer avec ancien algorithme




## chapitre 4 :

  - Décrire les variations de l’algorithme considéré : contrôle du chauffage
  - Description du calcul de FSC et Fsav
  - Introduire 3 variables pour Morris
    - DeltaLow buffer     (0-30)
    - DeltaLow collecteur (0-30)
    - Mini Temp ECS       (15-40)
  - Ne pas faire Fsav pour Morris
  - Expliciter FsavCH et FsavECS comme objectifs
  - Calculer FSC sur les solutions du front de Pareto uniquement
    - Mettre en exergue par les couleurs qu’elle solution utilise le mieux le sytème (FSC)



## chapitre 1 :

  - Mettre au propre


## chapitre 3 :

  - Détailler plus méta-modèles
  - Convergence algorithme

## Rapport :

  - Dépôt algorithme

  - Résumé thèse
