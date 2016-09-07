# Thèse: Analyse de sensibilité.


**Mise à jour: 2016-08-29**

***


## Méthode de Morris:
### Références:

 1. Morris, M. D. (1991).
    Factorial sampling plans for preliminary computational experiments.
    Technometrics, 33, 161–174.
 2. Campolongo, F., J. Cariboni, and A. Saltelli (2007).
    An effective screening design for sensitivity analysis of large models.
    Environmental Modelling and Software, 22, 1509–1518.
 3. http://salib.github.io/SALib/
 4. A. Saltelli et .al (2000)
    Sensitivity analysis in practice: A guide to Assessing Scientif Models (book) Chap 2, 4
    Wiley
    `p. 108`
 5. Saltelli et al. (2000).
    Sensitivity analysis as an ingredient of modelling.
    Statist. Sci. 15(4), 377-395
    `p.65`
 6. F. Campolongo and S. Tarantola and A. Saltelli (1999)
    Tackling quantitatively large dimensionality problems
    Computer Physics Communications
 7. F. Campolongo and S. Tarantola and A. Saltelli (2000)
    Sensitivity Analysis as an Ingredient of Modeling
    Statistical Science
 8. Francesca Campolongo and Andrea Saltelli (1997)
    Sensitivity analysis of an environmental model: an application of different analysis methods
    Reliability Engineering & System Safety

### Introduction:
La méthode utilise un plan OAT ou OFAT (*One (Factor) At a Time*).
Une unique variable est modifiée à la fois laissant les autres à leur valeur d’origine.
La méthode ne peut donc pas détecter les intéractions entre les variables.

C’est une methode de screening basé sur l’`Elementary Effect Method` (EEM [1]).
La méthode permet de récupérer la **moyenne** et l’**écart type** qui
permettent d’évaluer qualitativement l’influence de chaque variable.
La moyenne absolue est introduit par [2] afin de palier au problème du signe de
l’influence.
Le vecteur de base n’est jamais évalué durant la méthode, mais seulement utilisé
pour avoir une base commune. Cette base est générée aléatoirement.

### Fonctionnement:
La méthode permet de classer l’importance (décroissance) de chaque variable afin d’ensuite faire
une recherche plus approfondie ou d’optimiser les variables importantes.
Il permet aussi d’identifier les variables qui peuvent être fixée à n’importe quelle
valeur dans leur intervalle d’incertitude sans affecter la sortie. Ce dernier point peut
permettre par exemple de simplifier un modèle complexe.

La méthode de Morris a les avantages suivants:

 - Indépendant du modèle contrairement aux autres connues [4], [5]
 - Grouper les facteurs (variables d’entrées) [2, 4]
 - Rapide $(k + 1) * p$ avec $k$ le nombre de variables et $p$ le nombre de niveaux
 - Peut être considérée comme global car on explore différente région de l’espace
   des variables et réalise la moyenne d’effets élémentaires

La méthode de Morris a les inconvénients suivants:

 - Ne recherche pas sur l’intégralité de l’espace de variation
 - Ne permet pas d’obtenir une réponse quantitative
 - Le fait de moyenner fait perdre la dépendance d’un point spécific
 - La variation des paramètres ne peut que suivre une loi uniforme

### Exploitation:

Les sorties de la méthode révisée [2] permettent d’identifier 3 types d’influence:

 - Négligeable
 - linéaire  (moyenne absolue $\mu^{*}$ et moyenne $\mu$)
 - Direction de l’influence (moyenne absolue $\mu^{*}$ et moyenne $\mu$)
 - non-linéaire ou couplée à d’autres facteurs (standard deviation == écart type $\sigma$)

Il est important de noter la différence entre $\mu$ et $\mu^{*}$. Le premier est
la sortie de la méthode d’origine [1], alors que le second est ajouté dans la révision
de [2]. En effet lorsque le modèle est non-monotomic, certaines variables peuvent avoir
des effets s’annulant. La moyenne standard $\mu$ perd alors de sa pertinence. Le choix
d’une moyenne en valeur absolue évite les effets de signe opposés et permet donc de
classer correctement les variables ayant un effet linéaire.

Afin d’évaluer correctement l’importance et le type d’influence de chaque variable,
[1] propose un méthode graphique consistant à tracer le plan ($\sigma$, $\mu$ ou $\mu^{*}$).
Enfin il est aussi possible d’estimer le sens d’influence grâce aux deux moyennes
($\mu$ et $\mu^{*}$). Par exemple si $\mu^{*}$ est important mais $\mu$ non, alors la variable
peu avoir des effets différents en fonction du point (plan oat) utilisé.
Pour estimer les intéractions entre les variables $\sigma$ peut être utilisé. Si il est
important on note que la variable est dépendant de la variation des autres variables.

### Choix des paramètres:
Plusieurs paramètres sont à définir:

 - k = nbr de variables
 - $min_{i}$, $max_{i}$ = bornes des variables (0 < i <= k)
 - p = nbr de niveaux
 - r = nbr de trajectoires
 - $\delta$ = pas 
 - $grid_{jump}$ = saut (à ne pas confondre avec $\delta$)

$k$ est le nombre de variables dont l’on cherche à évaluer l’importance et
$min_{i}$, $max_{i}$ leur bornes (loi uniforme).
$p$ est le nombre de valeurs discrètes que peuvent prendre chaque variable.
$r$ est la taille de l’échantillon (le nombre de génération de trajectoire ou
encore le nombre de fois que la matrice d’orientation est générée)
Enfin $\delta$ est le pas de discrétisation utilisé et il doit être un multiple
de $\frac{1}{(p - 1)}$. Il est souvant fixé comme suit : $grid_{jump} \times \frac{1}{(p - 1)}$.

La méthode demande alors $r \times (k + 1)$ simulations.

**Paramètres courants:**  
$k$, $min_{i}$, $max_{i}$ sont propres au problème.
Il a été montré ([6], [7], [8]) que un choix de $r = >10$ et de $p = 4$ produit
de bon résultats.
Il est important de noter que ces deux paramètres on un lien de dépendance sur 
la qualité du plan OAT généré. Prenons un $r$ (nbr de matrice généré) trop
petit (disons 1) alors même si on utilise un $p$ grand (disons 20), on risque
de n’explorer qu’une portion de l’espace des variables. En effet on augmente le
nombre de valeur discrète que peut prendre chaque variable durant l’analyse de
sensibilité mais on ne génére qu’une unique matrice d’orientation.
Ces deux paramètres doivent donc être sélectionnés ensembles.
Enfin le dernier paramètre $\delta$ est le pas de discrétisation utilisé pour passer d’une valeur
discrète à une autre (ce qui explique le lien de probabilité décrit ci-dessus).
La litterature ([1], [2]) utilise $\delta = \frac{p}{2 \times (p - 1)}$


***
