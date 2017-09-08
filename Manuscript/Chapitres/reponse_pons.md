Bonjour Monsieur Pons,

Je suis actuellement en déplacement depuis le début de la semaine et reviens dans la soirée.


J’ai bien reçu vos demandes de corrections et je vous remercie pour la lecture attentive de mon manuscrit que ce soit sur le fond comme sur la forme.


La plupart des corrections ont été intégrées et les fautes corrigées.
Il y a cependant une note que je ne comprends pas :

  - p.31 Pourquoi `kWh / m²` est surligné ?



## Questions / Réponses :

Les réponses aux questions de fond sont illustrées par des citations des modifications faites dans le manuscrit :

  - p.38 `Centrales à tour` J’ai en effet décrit le mauvais système :

> Le système de tour solaire est lui aussi basé sur la concentration des rayons solaires sur
un point unique et permet d’obtenir une source chaude allant jusqu’à
1500°C. Un champ de miroirs orientables ayant un système de suivi sur deux axes
<< héliostats >>, réfléchissent toute la journée l’énergie solaire vers un absorbeur au
sommet d’une tour.

  - p.39 `Ces relations` réfèrent aux équations décrites dans la citation.

  - p.42 `Baisse ou progresse` Le secteur progresse encore mais moins vite, la tendance
    est à la baisse.

> Depuis 2010 la tendance est toujours à la baisse (progression plus
faible chaque année) et depuis 2014 le solaire thermique affiche une progression nettement moins
importante que les autres énergies renouvelables comme le photovoltaïque ou l’éolien.

  - p.51 `Étonnant` : C’est en effet l’inverse ...

> La solution optimale obtenue dépend peu de l’algorithme utilisé.

  - p.77 `220 = 33 x 4` Le volume puisé en ECS est fonction de sa température. Le puisage
    typique par personne est donné pour une température d’eau à 60°C mais le volume d’eau
    puisé par le SSC est à 40°C. Une vanne thermostatique est utilisée pour mélanger
    de l’eau froide et de l’eau du ballon sanitaire.

  - p.78 ` :` Je ne comprends pas le problème surligné. Les règles de typographie
    imposent l’ajout d’un espace insécable avant les `:` et d’un espace ensuite.

  - p.79 `Consigne solaire` : La température de consigne solaire est la consigne
    de température intérieure pour le SSC (figure II.14). Seule l’énergie solaire
    peut être utilisée pour atteindre cette consigne. L’appoint est lui toujours
    inactif si la température intérieure est supérieure à la température de consigne
    (mode **Surchauffe ON**, figure II.12).
    Elle permet d’utiliser l’inertie de la maison pour limiter la demande énergétique
    durant la péridoe nocturne.

  - p. 81 `Erreurs dans les formules` En effet il y a des erreurs dans les formules



AJOUTER CAPTURE D’ÉCRAN



  - p.82-83 `Bilan (Tab II.14)` J’ai repris les nombres et revu les conclusions liées
    à l’analyse du tableau. Les bilans étaient en effet faux.

> La $Conso_{app}^{ECS}$ pour les conditions de Limoges et de Nantes sont similaires malgré
une consommation totale pour la production d’ECS plus importante sur Limoges. L’ensoleillement
plus élevé sur la ville de Limoges (Tab. II.6) permet en effet de
valoriser une part d’énergie solaire plus grande. Pour les mêmes raisons, le SSC
permet d’économiser 50 kWh supplémentaires sur le chauffage ($Conso_{app}^{ECS}$) lorsqu’il
est installé sur Limoges au lieu de Nantes.



AJOUTER CAPTURE D’ÉCRAN



  - p.82 `quantités vraiment similaires`

> en récupérant une quantité d’énergie solaire relativement proche sur les différents climats

  - p.86 `N'est-ce pas exactement la même chose ?`

> Dans les deux cas, l’énergie solaire incidente est mieux valorisée ($\eta_{sol}$ augmente).

  - p.112 `interrogation ou affirmation`  L’ensemble a été repris afin d’être plus compréhensible
    et plus cohérent.

> Le choix d’une approche peut ainsi être guidé par les réponses aux questions suivantes :
• Quelle est la nature des variables de décision (discrètes, continues...) ?
• Quelles sont les contraintes imposées par l’outil de modélisation ?
• L’algorithme nécessite-t-il la définition de nombreux paramètres ?
– La sensibilité de l’algorithme aux paramètres est forte : Dur à paramétrer
– Chaque paramètre a un impact identifiable en amont : Simple à paramétrer
Une fois que l’approche est sélectionnée, deux cas sont possibles :
• Une implémentation de la méthode existe :
– Est-elle compatible avec les outils de modélisation utilisés ?
– Permet-elle de prendre en compte la nature des variables de décision ?
• Une implémentation de la méthode n’existe pas :
– Existe-t-il une autre approche répondant aux contraintes du problème ?
Il est possible dans les deux cas de préférer sa propre implémentation à condition que le travail
nécessaire pour le couplage avec des outils existants (interface, abstraction de la nature des variables...)
soit plus important que celui requis pour l’implémentation de l’algorithme.

  - p.135 `C’est à dire` A priori dans le sens *avant que le SSC soit simulé*. Les charges
    internes et la production des capteurs PV sont indépendants du comportement du SSC.
    Il est donc possible de pré calculer les apports totaux et la production
    des capteurs PV sur l’année.

> Ainsi la production PV et les charges internes sont évaluées sur l’année complète
en amont des simulations du SSC.

  - p.135 `Commentaire de note vide` Je change le fonctionnement de l’algorithme
    décrit dans le chapitre II en modifiant l’activation du mode *Solaire Direct*
    ou *Solaire Indirect*.
    J’ai ajouté les parenthèse manquantes ...

> L’activation du chauffage solaire (Solaire direct ou Solaire indirect ) est
aussi contrôlée par une borne fixe (Fig. II.12). Dans le cas du Solaire direct , la température en sortie
des capteurs (T1) doit être supérieure ou égale au maximum entre 40° et la température de l’eau en
sortie de l’échangeur eau/air (T7).

  - p.138 `que sont les apports "passifs" ?` Les apports *passifs* sont les déperditions
    des ballons qui sont dans la zone chauffée. J’ai reformulé pour plus de clarté.

> il est toujours possible que certains apports solaires soient inutiles, en particulier les apports de chaleur
issus des déperditions des ballons.

  - p.143 `Quelle interaction ?` Le passage a été retravaillé.

> Au cours du chapitre II, il a été montré que le SSC, en fonction des
caractéristiques des ballons (position de l’échangeur ou volume des ballons), réparti
l’énergie solaire entre chauffage et production d’ECS de manière différente sans
nécessairement modifier la couverture solaire globale. L’analyse de Morris met
aussi en exergue que les caractéristiques des équipements influencent la manière dont le
SSC couvre les besoins en chauffage. En effet pour une même valeur de $F_{sol}^{CH}$,
les besoins sont couverts soit indirectement par les déperditions des ballons, soit directement
grâce au système de chauffage aéraulique. Il n’existe cependant pas à la connaissance de l’auteur
de moyens pour identifier la part réellement utile dans les apports solaires indirects. En considérant
la part économisée sur l’appoint, seule l’énergie solaire utile est implicitement prise en
compte. Le choix des objectifs $F_{sav}^{ECS}$ et $F_{sav}^{CH}$ en place des indicateurs
$F_{sol}^{ECS}$ et $F_{sol}^{CH}$ est donc plus pertinent. Finalement l’existence d’un
compromis entre qualité de l’enveloppe et performance du SSC sur le chauffage, est
aussi identifiée.

  - p.146 `??` Le paragraphe a été repris

> Sur la $Conso_{app}^{CH}$, $\Delta min_{tampon}$ et $\Delta min_{capteur}$ sont influents
pour les deux climats. Sur la $Conso_{app}^{ECS}$, $\Delta min_{tampon}$ est le seul
facteur impactant pour Bordeaux. Par contre sur Strasbourg, $\Delta min_{capteur}$ est aussi
un facteur influent. En effet, les besoins en chauffage étant faibles sur Bordeaux relativement aux
besoins pour la production d’ECS, la consommation totale ($Conso_{app}$) est
uniquement influencée par $\Delta min_{tampon}$. La même observation peut
être faite sur Bordeaux pour le ballon de stockage dont le volume impacte uniquement la $Conso_{app}^{CH}$.

  - p.151 `Que signifie cette zone grise ?` C’est l’ordre du méta-modèle, le degré
    maximal du polynôme après troncation (voir III.8). J’ai cependant ajouté un rappel
    dans le texte et mieux présenté la figure

> L’ordre du méta-modèle (degré maximal du polynôme après troncation) est défini par la zone grise
associée à l’axe vertical de droite.

  - p.162 `Qu'est-ce que cela veut dire ?` Le paragraphe a été reformulé.

> Comme explicité lors du choix des capteurs, les capteurs plans récents ont tous un
rendement optique ($\eta_{0}$) important et de ce fait, le coefficient $a_{1}$ est le
principal responsable des différences de performance. De plus, le capteur SkyPro,
qui a pourtant le rendement optique ($\eta_{0}$) le moins élevé, permet au SSC
d’obtenir le meilleur $F_{sav,\, ext}$. En effet, la surface considérée dans le calcul du
rendement optique n’est pas la même. Pour le capteur SkyPro la surface utilisée
est la surface totale soit 2.59 m². Pour les trois autres, la surface
d’entrée est utilisée soit 2.32 m². Il est ainsi nécessaire de porter
une attention particulière à la surface de référence considérée dans la fiche technique
des capteurs.





## Second mail :

  - p.50 `Exergie`

> L’exergie permet de quantifier la qualité d’une énergie, celle ci diminuant au cours des
transformations successives. Le travail maximum récupérable est ainsi égal à l’opposé de
la variation d’exergie au cours d’une transformation. L’auteur de l’article
cherche donc à maximiser le rendement exergétique qui est le rapport entre l’exergie en
sortie du système solaire (exergie fourni à l’ECS pour l’occupant) et l’exergie
en entrée du système (auxiliaires électriques et irradiation solaire).

  - p.151 `8 %, ce n'est pas une erreur négligeable.`

> Bien que l’erreur maximale ne soit pas négligeable, elle reste faible au regard
des incertitudes liées à l’évaluation de tels systèmes (isolation, rendement des équipements,
gains internes, apports solaires…)


  - p. 160 `Vous êtes sûr ?`

> Les résultats montrent aussi que le nombre de capteurs PV diminue lorsque la
performance du SSC augmente. Afin de respecter la contrainte de bilan positif,
la production solaire thermique augmente lorsque la production photovoltaïque diminue.
