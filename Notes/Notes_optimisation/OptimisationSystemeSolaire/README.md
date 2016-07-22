# Approche multi-objectifs pour le dimensionnement d’un système solaire combiné

## Introduction:
Il est important de penser multi-zone lors de la lecture des algorithmes.
En effet si on considère un cas mono-zone, on simplifie grandement la partie algorithmique
mais on s’éloigne aussi du comportement d’une vraie installation. De plus la logique mono-zone
n’est pas forcement extrapolable à une approche multi-zone.
L’exemple le plus marquant est la consigne de température de soufflage si on a des pièces
avec des consignes différentes.

### Cas de l’air:
La complexité réside dans l’optimisation de l’apport solaire à l’air par l’intermédiaire
de la batterie chaude. En effet en fonction du choix de la pièce la plus défavorable ou la
plus favorable pour définir la température de soufflage, ... on risque de créer
respectivement de l’inconfort (trop chaud), ou augmenter la part électrique terminale.
De même pour les temporisations.  
Le système comporte alors une partie [hydraulique](air_hydraulique.pdf) et une
partie aéraulique ([monozone](air_aeraulique_mono.pdf) et [multi-zone](air_aeraulique_multi.pdf)).
La partie hydraulique n’étant pas impactée par le niveau de détail au niveau de la maison.


### Cas de l’eau:
Dans cette [approche](eau_hydraulique.pdf) la complexité est moindre car l’appoint et les solaire alimentent
le même émetteur contrairement à l’approche sur l’air.
Seul le vecteur eau rentre en jeu obligeant un système sur l’air indépendant.

## Établir une liste de critère à priori:
**Modifcation de l’enveloppe:**

  - Épaisseur isolant
  - Choix matériaux structurels
  - Proportion de vitrage par orientation
  - Performance vitrage (FS, U, TL)
  - Mode constructif (ITE, ITI, ITR)

**Modification des composants du système solaire:**

  - Nombre de capteurs solaires thermiques / photovoltaïques
  - Proportion de capteur par pan de toiture
  - Caractéristiques des capteurs (rendement optique, a1, a2, slope, ...)
  - Caractéristiques des ballons (volume, hauteur, isolant, type d’échangeur)
  - Caractéristiques des échangeurs
  - Caractéristiques du fluide dans le ballon de stockage
  - Caractéristiques des émetteurs (rendement, courbe de charge, ...)
  - Position des équipements: extérieur, intérieur, combles
  - Isolation des canalisations

**Modification par bloc système:**

  - Type d’émetteur (radiateurs, plancher chauffant, ventilo-convecteur)
  - Type d’appoint (Électrique, chaudière Gaz, chaudière Bois)

**Modification algorithmique:**

  - Delta T solaire (différence de température minimale entre capteurs et besoin)
  - Temporisation sur l’électrique
  - Temporisation le passage `Mode température --> Mode débit`
  - Autorisation surchauffe diurne ou non
  - Débit des pompes (faire varier le coefficient proportionnel au nombre de capteur):  
    - S2
    - S5
    - S6
  - Temporisation de l’arrêt des pompes
  - Autorisation d’ouverture de la vanne solaire en fonction des besoins en chauffage ou non

**Modification bloc vecteur AIR:**

  - Régulation registre (ON/OFF, 3 positions, variable)
  - Régulation pour la couverture des besoins:  
    - Modulation température puis débit
    - Température fixe et modulation débit
    - Débit fixe et modulation de la température
  - Modulation du débit:  
    - $min(T_{ext} + PID * (T_{consigne}^i - T_{ext}^i)$ (Fonction de la pièce la moins défavorable)
    - $max(T_{ext} + PID * (T_{consigne}^i - T_{ext}^i)$ (Fonction de la pièce la plus défavorable)
    - $\sum_{i}^{nbrPiece} (\frac{T_{cons}^{i} - T_{amb}^{i}} {Volume_{piece}^{i}})$ (Fonction de l’ensemble des besoins par pondération)
  - Caisson de mélange (consigne mélange, débit extérieur modulable)
  - Caisson de mélange (contrôle des registres):  
    - $Registre_{airExtrait} = min(\frac{Q - Q_{min}}{Q_{max} - Q_{min}}, 1 - \frac{Q_{min}}{Q_{max}})$
      et
      $Registre_{airRepris} = 1 - Registre_{airExtrait}$
    - $Registre_{airNeuf} = ...$ (Dépendant de la règle sur le débit d’air neuf)
  - Modulation de la température de soufflage:  
    - Basé sur le cas le plus défavorable
    - Basé sur le cas le plus favorable
    - Basé sur la moyenne

**Modification propre au bloc vecteur EAU:**

  - ?? D’abord validé la méthode sur le cas Air ??



## Détail des algorithmes:
### Caisson de mélange:
```
                    (1)
Air Extrait --<----\\---|--------<----- Air repris (Débit == Q, Débit mini = Q_min)
                        |
            Caisson     |
            de          \\ (2)
            Mélange     |
                        |
Air Neuf ----->----\\---|------->------ Air Soufflé (Débit == Q, Débit mini = Q_min)
                    (3)
```
Dans cette configuration, il est possible de faire varier les 3 débits (neuf, repris, soufflé)
du moment que le débit d’air neuf minimal est respecté.

**Prenons le cas d’un débit d’air neuf fixe comme c’est le cas dans le système actuel (2016-07-12)**
Dans ce cas on cherche à moduler l’ouverture de `(1)` est de `(2)`, `(3)` étant fixe.
$Registre_{airExtrait} = min(\frac{Q - Q_{min}}{Q_{max} - Q_{min}}, 1 - \frac{Q_{min}}{Q_{max}})$
$Registre_{airRepris} = 1 - Registre_{airExtrait}$

*Explications:*
Si on demande un débit minimal --> $Q == Q_{min}$, alors on aura l’ensemble du débit
de renouvelé.
Si on est dans le cas du débit maximal ---> $Q == Q_{max}$, alors on ré-utilise
le maximum du débit vicié et le minimum d’air neuf (assurée par $1 - \frac{Q_{min}}{Q_{max}}$).


### Registre terminaux:
Dans le cas d’un fonctionnement réel, le débit d’air est répartie dans les différentes
pièces. Il est alors nécessaire d’installer des registres pour moduler le débit injecté
dans chaque pièce. Afin de pouvoir comparer l’application mono-zone et multi-zone
il faut penser multi-zone pour la partie algorithme sur le mono-zone.
Comme décrit plus haut dans le bloc `Modification bloc vecteur AIR`, certaines variations
dépendent de la répartition des besoins dans les pièces et si on considère le cas le
plus défavorable ou plus favorable, ou encore une moyenne, ...
Dans tous les cas il est nécessaire d’assurer un débit minimal en sortie lorsque
il n’y a plus de besoin dans la pièce.



## Modélisation:
### Questions ouvertes:

  - Batterie de préchauffage pour éviter le gel à prendre en compte ?
    Possible en solaire si disponible ou par l’électrique ?
  - `Buildings.Fluid.HeatExchangers.DryEffectivenessNTU` pour une meilleure prise
    en compte de l’échange Eau/Air après choix de l’échangeur --> Méthode NTU
  - Prise en compte de la consommation des pompes (électrique) ?
  - Remplacer le caisson de mélange par un échangeur pour préchauffer l’air extérieur ?


#### Objectif coût:
Les paramètres pouvant être pris en compte sont les suivants:

  - Coût initial (matériaux + main d’œuvre)
  - Coût de maintenance (équipement, glycol, contrat d’entretien)
  - Coût d’usage électrique ou gaz (avec projection des prix)
  - Valeur verte de la maison (avec projection de la valeur ajoutée à la maison)
  - Déductions des aides disponibles

#### Objectifs Taux de couverture chauffage et ECS:
Le taux de couverture est calculé sur la production d’énergie solaire est n’est
donc pas représentatif de la performance du système solaire car une partie de l’énergie
est perdue (pertes des canalisations et des ballons).
**Pour mieux orienté la recherche durant l’optimisation, il est plus intéressant de tenir compte de ces pertes**


#### Objectif Confort intérieur:
Les modifications de l’algorithme et des équipements ont un effet direct sur l’occupant.
Augmenter la temporisation avant de laisser la main à l’électrique par exemple peut
augmenter l’inconfort.
**Perspective ou ajout possible après validation du fonctionnement de la méthode ?**

### Projection:
Après choix et confirmation des paramètres variables, les différents modèles peuvent
être réalisé pour pouvoir faire varier l’ensemble des paramètres définie à-priori.
Il faut donc:

  - Finalise le code pour faire tourner l’optimisation
  - Tester sur des cas connus pour évaluer la performance et vérifier le fonctionnement
  - Modéliser les différents blocs de modèles pour simplifier le lancement de simulation
    sans avoir à créer du code `Modelica` à la volée.
