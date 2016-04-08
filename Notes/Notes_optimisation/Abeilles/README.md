# A comprehensive survey: artificial bee colony (ABC) algorithm and applications
**Auteurs:** Dervis Karaboga et al.
**Année:** 2014
**Notes:** Ne résume pas seulement l’article. Version grossière de l’introduction de
           l’algorithme pour ma thèse.

## Citations:

 - [6] M. Dorigo 1992 `Optimization, Learning, Natural Algorithm, PhD thesis`
 - [7] M. Dorigo 2004 `Ant Colony Optimization, MIT Press`
 - [20] T. Stützle 2000 `MAX-MIN Ant System`

## Introduction:
Proposition d’une définition de ce qu’est l’intelligence artificielle `Mc Carthy, 2007`.
Une des branches de l’intelligence artificielle s’intéresse particulièrement au comportement
du monde animal. Dans notre cas on s’intéresse à la branche de l’intelligence des
essaims (Swarm Inteligence). `Bonabeau, 1999` a définit quatre caractéristiques
définissant l’organisation dans ces essaims: (i) positive feedback, se traduisant par
le renforcement de chemins par le recrutement d’individus vers ce chemin, (ii) negative feedback,
permettant de stabiliser la structure évitant la saturation du au positive feedback facteur,
(iii) fluctuations, qui est nécessaire pour faire émerger des solutions nouvelles (facteur aléatoire),
(iv) multiple interactions, pouvant se traduire par le partage d’informations entre les individus
de la population.
Les plus connues étant inspirées des oiseaux (Particule Swarm Intelligence),
les fourmis (Ant Colony), ou encore les abeilles dont une attention particulière à était apportée.
Il existe plusieurs approches d’algorithmes d’essaims d’abeilles. Certaines sont basées
sur le comportement des ouvrières faisant intervenir la fameuse danse pour partager
les informations sur une source aux autres ouvrières. D’autres s’inspirent de la
reproduction des reines, du mariages, ...
Parmi les plus utilisés on peut citer le mariage entre abeilles introduit par `Abbas 2001`,  VirtualBee
pensé pour l’optimisation de fonction numérique `Yang 2005`, Bee Colony Optimization (BCO)
`Lucic and Theodorovíc` pensé pour l’optimisation de problèmes combinatoire. Enfin on peut citer les
algorithmes BeeHive proposé par `Wedde, 2004` et Artificial Bee Colony (ABC) introduit par `Karaboga 2006`.
ABC simule le comportement des ouvrières recherchant des sources de nourritures pour l’essaim.
Comme le montre l’état de l’art de `Karaboga, 2014` il est l’algorithme le plus
utilisé pour la résolution de problèmes d’optimisation: continues, combinatoires, mono et multi-objectifs, contraints.

Dans la partie qui suit l’approche retenue pour ces travaux, l’algorithme ABC, est détaillée.
Dans la nature les abeilles communiquent entres elles pour découvrir et récupérer le plus
de nectar possible. Leur comportement est défini par principalement 3 composants: (i)


Chaque source étant caractérisée par leur éloignement,
leur richesse, et par leur accessibilité. Les chercheuses vont donc sur une source et ensuite
reviennent à l’essaim pour partager les informations récupérés sur les sources. Elle
