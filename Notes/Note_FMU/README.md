# Note sur les FMUs

**Mise à jour: 20150212**

**Dossier documentation:** `D:\Doc\Thesis\Publications\FMI`

## Description:
Voir:

 - Functional Mock-up Interface for Co-Simulation_Modelisar_2010.pdf
 - Functional mock-up unit import in energyplus for Co-Simulation_NouiduiWetter_2013.pdf
 - Tool coupling for the design and operation of building energy and control systems based on the Functional Mock-up Interface standard_NouiduiWetter_2014.pdf


**FMI:**
C’est une interface standardisé développé au cours du projet ITEA2 (Information
Technology for European Advancement) MODELISAR.
Elle permet de coupler différents modèles entre eux de 3 manières différentes.
On a comme possibilité:

 - Co-Simulation
 - Model-Exchange
 - Product Life Management

C’est un outil indépendant et non propriétaire utilisant une combinaison de fichiers
`XML`, de `bibliothèques C`, et de code source `C` ou sous un format compilé (binaire).
Le standard est à la date de la rédaction à la version 2.0 mais nous utiliserons
seulement les capacités de la version 1 (limitation de Energy Plus)
Chaque fichier remplissant son rôle:

 - XML: Description du modèle avec méta-data et variables définitions
 - Librairies partagées contenant l’implémentation du FMI et/ou le source code
 - Ressources comme une image, un fichier météo, ...

Un FMU peut être compilé pour différentes plateforme et les binaires ajoutés sous forme
d’un arbre dans le FMU qui n’est autre que une archive `zip`.

**Co-simulation:**
C’est une technique que permet à un modèle décrit par des équations différentielles
algébrique ou discrète d’être simuler en couplage avec un autre programme. Les
deux modèles partagent alors des entrées et des sorties (ils communiquent entre eux).
Chaque modèle contiennent leur propre solveur et un master algorithme permet le
dialogue.

**Model-Exchange:**
Permet de coupler des modèles/outils qui seront intégrés en temps par un solveur
externe. Le modèle est donc écrit en code `C` afin d’être ensuite intégré par un solveur
commun aux modèles


### Outils compatibles:

 - Dymola
 - Jmodelica
 - Energy Plus (Co-simulation seulement)


#### Dymola:
Voir:

 - Dymola_FMI Support in Dymola_2015.pdf

#### Energy Plus:
Voir:

 - EnergyPlusToFMU_guide.pdf
 -

L’interface de Energy Plus pour FMU est limitée. Les principales limitations étant
les suivantes:

 - Dialogue à pas de temps fixe (imposé des deux cotés)
 - Indépendance direct nécessaire entre les différentes modèles
 - Chaque simulations doivent finir et commencer à minuit
 - Chaque inputs dans Energy Plus sont constant entre deux pas de temps.
 - La version d’Energy Plus utilisé pour la simulation et faire le FMU doivent être identiques

Afin d’exporter/importer des FMUs, le laboratoire National Lawrence Berkeley
a développé des outils:

 - EnergyPlusToFMU permettant d’exporter un FMU pour de la Co-Simulation
 - FMUparser permettant de parser le  `XML` contenu dans le FMU pour l’import

Le premier est disponible sur leur site internet, quand au second il est fournit
directement avec les versions d’Energy Plus supérieures à 7.2 dans le dossier
`PreProcess`.
Enfin une interface est disponible directement dans l’IDF editor pour renseigner
l’interface et la connection avec les composants Energy Plus et les inputs.


## Bibliothèque python:
Voir:

 - AssimuloModelicaDymolaIntroduction.pdf

Afin d’utiliser des **FMUs** avec python il est nécessaire d’installer les bilbiothèques
suivantes:

 - Assimulo = Accès aux intégrateurs (simple/multiples pas de temps)
 - PyFMI    = Accès aux FMU avec un wrapper sur la Functional mock’up interface


La bibliothèque `Assimulo` permet d’accéder à différents intégrateurs et est utilisée
en interne par `PyFMI` afin d’intégrer les FMUs importés.
Actuellement seulement une version en python 2.7 est disponible en version 32 bits.


### Assimulo:
Assimulo peut être utilisé en standalone afin de résoudre des équations différentielles
