## Description
Template et sources de mon manuscrit de thèse portant sur le **développement d'un outil
d'aide à la décision pour la conception de maisons solaires à énergie positive**.

Le Manuscrit est disponible à l'adresse [suivante](https://tel.archives-ouvertes.fr/tel-01679255).

***

## Résumé
Les enjeux énergétiques et environnementaux liés au réchauffement climatique amènent à
généraliser la sobriété énergétique des bâtiments neufs ainsi que la production locale
d’énergie à l’horizon 2020. Ce travail de thèse se concentre sur le secteur de la maison
individuelle qui représente près de la moitié des logements neufs construits en France
pour un volume d’environ 200000 unités par an.

Le contexte de la maison individuelle à énergie positive 100% solaire consiste à
rechercher les compromis entre le niveau de performance du bâti qui détermine les besoins
en énergie et la capacité des équipements à valoriser l’énergie solaire pour d’une part
subvenir aux besoins en chaleur pour assurer le chauffage et la production d’eau chaude
sanitaire, et d’autre part produire l’électricité nécessaire à l’éclairage et aux autres
usages spécifiques (matériels électroménager, vidéo, etc.).

Après un examen des différents concepts de bâtiments à énergie positive, une analyse a été
menée pour identifier les solutions techniques de systèmes solaires combinés capables de
fournir le double service de production d’eau chaude et de chauffage. Un modèle détaillé a
été développé dans l’environnement Dymola et vérifié par inter-comparaison de modèles à
l’échelle des composants. Un algorithme de contrôle original a été mis au point pour
maximiser la performance globale du système. Une première étude paramétrique a montré que
ce système est capable dans certaines conditions de couvrir près de 80% des besoins en
chaleur de la maison étudiée. Néanmoins, son dimensionnement demeure complexe et la
recherche de compromis entre la sobriété de la maison et le dimensionnement des systèmes
solaires thermiques et photovoltaïques doit s’appuyer sur un algorithme d’optimisation
multi-objectifs adapté.

Un chapitre est donc consacré à l’élaboration d’un algorithme d’optimisation multi-
objectifs qui s’appuie sur la méthode des colonies d’abeilles virtuelles. Cette approche
s’est avérée particulièrement pertinente vis à vis du problème (paramètres discrets,
continus et qualitatifs) à caractère multi-objectifs (maximiser la valorisation du solaire
thermique pour le chauffage d’une part et pour la production d’eau chaude d’autre part,
minimiser la consommation d’énergie conventionnelle) et sous contrainte car seules les
solutions à bilan d’énergie positif sur l’année seront retenues. L’algorithme
d’optimisation développé ici a été confronté à une série de problèmes classiques et a
démontré sa capacité à construire l’ensemble des solutions avec un nombre relativement
faible d’évaluations du modèle.

Le dernier chapitre présente deux applications de conception de maisons à énergie
positive. La première se situe en région bordelaise alors que la seconde est située à
proximité de Strasbourg. Ces deux conditions climatiques permettent de mettre en évidence
la capacité de l’algorithme d’optimisation à proposer un éventail de solutions optimales
présentant des compromis différents en termes de performance du bâti et de dimensionnement
des équipements solaires. Enfin, un outil d’aide à la décision permet d’explorer les
fronts optimaux pour dégager les solutions à retenir.

***

## Abstract

With energy-related and environmental climate change challenges, energy sobriety and local
energy production are yet to become a mainstream practice for new buildings construction by
$2020$. This works focuses on single-family houses which in France represent half of new
buildings constructions with 200000 new units new units each year.

Near zero energy single-family houses with 100% solar energy consists on compromising
between performance of building envelope which defines energy needs and the ability
for equipments to value free solar energy. Hence solar energy must be able to cover
space heating and domestic hot water demands but also provide enough energy for
lightning and other specific uses such as domestic appliances.

After a literature review of near zero energy house concepts, an analysis was undertaken
to provide a clear view of solar combi-systems technical solutions with the ability to
provide enough energy for both needs: space heating and domestic hot water. Using Dymola
environment a detailed model was developed and its consistency was checked by
inter-comparison at component scale. An innovative control algorithm has been worked out to
maximize the solar system’s global performance. A first parametric study has shown that the system
was able to cover close to 80% of house heat requirement. However sizing of a solar
combi-system is a complex task and requires to find compromises between building sobriety, solar
thermal energy efficiency, and photovoltaics solar energy sizing. Because of the problem’s
complexity, a decision aid tool with an appropriate multi-criteria optimization algorithm
is required.

To that end a chapter is dedicated to the development of a multi-criteria optimization
algorithm based on artificial bee colony behavior. This approach has proved to be quite effective
to solve the problem and to handle continuous, discrete and qualitative decision variables.
Chosen solution was constrained to have a positive energy balance and must maximize solar
space heating and domestic fraction in a view to reduce total energy consumption.
A validation process has also been set up and the developed optimization algorithm
has proved its ability to solve standard problems with a fairly short number of evaluations.

Adopted methodology was illustrated by two applications of the design phase of
a near zero energy detached house. First one is located at Bordeaux an second one
in Strasbourg. Selected climate conditions emphasize the ability of the proposed
approach to identify a wide range of optimal solutions showing differences within
the building's performance as well as the solar system sizing. Lastly a decision aid tool
allows to explore optimal front in a convenient way to shape adapted solutions.

***

## Obtention d'un PDF A pour l'archivage:
```gs -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dCompressFonts=true -dSubsetFonts=true -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=outputPdf.pdf -c ".setpdfwrite <</NeverEmbed [ ]>> setdistillerparams" -f original.pdf```
