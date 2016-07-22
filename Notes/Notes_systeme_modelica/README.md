# Notes sur le système solaire modélisé avec Modelica


## Description de l’état actuel (modèle `IGC_airVectorRecyclePassive_solar17`):

### Eau chaude sanitaire:
La température du ballon ECS est maintenue à 55 °C en accord avec la réglementation
en vigueur.

 - [Infos](http://conseils.xpair.com/consulter_parole_expert/reglementation_temperature_ecs.htm)
 - [Arrêté](https://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000000423756&dateTexte=)

La température de puisage est de 40°C, en considérant un débit de puisage de 33 $l/h/pers$ (60°C),
soit 275 litres pour 5 personnes ou 220 pour 4 personnes.

### Ventilation:
Le débit de ventilation est considéré en fonction du nombre de pièce selon la réglementation
en vigueur.

 - [Infos](http://www.aldes.fr/contents/fiches-pratiques-1/ventilation/les-debits-reglementaires)
 - [Arrêté](https://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000000862344)

### Consigne de chauffage:
La consigne de chauffage est dorénavant de 19°C en occupation (jour), 18°C en occupation (nuit)
et 16°C en inoccupation selon un profil hebdomadaire.
La maison est considéré complètement occupé le Mercredi après-midi et le week-end.

### Maison et limitations:
L’isolation est considérée intérieure limitant/supprimant l’effet de stockage par
sur chauffage solaire en journée.

### Réseau hydraulique:
Présence de glycol dans les canalisations à l’exception du ballon tampon et ECS
ne présentant aucuns risques de gel.


### Algorithme:
La V3V ne peut s’ouvrir que sur un besoin dans un des deux ballons. Si uniquement un
besoin de chauffage existe alors la V3V ne sera pas correctement orientée pour offrir
la possibilité de chauffage direct par le solaire.


### Équilibrage du réseau:
Le réseau est maintenant automatiquement équilibré en fonction du débit considéré
pour les pompes.
Il est seulement nécessaire de renseigner un débit en $kg/s/m^{2}_{SurfCapteurs}$
et le débit total est calculé puis les différentes courbes de pompes construites.
En effet la courbe de la pompe est calculé afin de refléter la courbe du réseau
et ce pour chaque circuit possibles (voir mode de fonctionnement).
Pour rendre cela réalisable, le système hydraulique est équilibré
en fonction des configuration possibles pour chaque pompe comme le montre le 
[schéma](air_hydraulique_pressions.pdf).

Les hypothèses suivantes ont été retenues:

 - $K_{v} = Q \times \sqrt{\frac{\rho}{\Delta P}}$
 - $\rho = 1 \frac{kg}{dm^{3}}$

L’analyse dimensionnelle de l’équation donne:
$[K_{v}] = \frac{m^{3}}{(h . bar^{\frac{1}{2}})}$
avec:

 - $[Q] = \frac{m^{3}}{h}$
 - $[\rho] = \frac{kg}{dm^{3}}$
 - $[\Delta P] = bar$

Les étapes suivantes permettent d’équilibrer le réseau:

 - Calculer le $K_{v}$ pour le débit solaire et la perte de charge défini sur le schéma
 - Choix de $x$ point entre un débit nul et le débit nominal
 - Déterminer la perte de charge correspondante pour chaque point de la courbe


`Note1: Pour la courbe du réseau, la perte de charge augmente avec le débit, c’est l’inverse pour la courbe de pompe.`

`Note2: Attention aux conversions depuis les unités SI et celles de l’équation.`
