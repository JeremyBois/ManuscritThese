# Notes :
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
  - Construction de deux méta-modèles : Chauffage et ECS
    - Construire `simulator` adapté : revient à juste virer le surplus du simulateur solaire
    - Etude paramétrique sur modèle de référence (500 - 1000 simulations)
    - Création des méta modèles


**--> Faire une étude paramétrique supplémentaire pour chaque climat**
**--> Inutile pour sensibilité car on perdrait des informations**



***



# À faire :
## Rapport :

  - (Fait) Dépôt algorithme
  - (Fait) Résumé thèse



## chapitre 1 :
### Rédaction :

  - (Fait) Mettre au propre



## chapitre 2 :
### Rédaction :

  - (Fait) Envoyé mail à Aurélie pour questions
  - Décrire débit moyen des pompes avec moyenne et écart type
  - Parlé du modèle de puisage utilisé
  - Parlé du modèle de capteur
  - Décrire pour les autres modèles le composant utilisé
  - Corriger algo chauffage
  - Mieux décrire les onOff et hystérésis
  - Expliciter l’initialisation
  - (Fait) Ajouter comparaison avec autres logiciels
  - Introduire nouveau algorithme
    - Activation indirect et directe en fonction de Tin échangeur
    - Comparer avec ancien algorithme



## chapitre 3 :
### Simulations

  - Convergence algorithme


### Rédaction :

  - Détailler plus méta-modèles
  - Convergence algorithme
  - Citation sur importance initialisation (Théo)



## chapitre 4 :
### Rédaction :

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


### Simulations:

  - Production PV
    - (Fait) Bordeaux (500)
    - (Fait) Strasbourg (500)
  - Sensibilité
    - (Fait) Bordeaux (500)
    - (Fait) Strasbourg (500)
  - Paramétrique
    - (Fait) Ref Bordeaux (1000)
    - (En cours) Ref Strasbourg (1000)
    - (Fait) Bordeaux (1000)
    - Strasbourg (1000)
  - Test performance méta (optionnel)
    - Bordeaux (+1000)
    - Strasbourg (+1000)
  - Optimisation
    - Construction 5 méta-modèles
    - Objectifs : FsavCH, FsavECS, Production PV, Nbr capteur PV
    - Contraintes : abs(Consommation totale) <= 300
    - Consommation de : Chauffage, ECS, Électroménager, Éclairage
