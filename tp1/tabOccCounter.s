.text
lea tab // Adresse de début du tableau

boucle:
ldi // Charger la valeur courante du tableau
sub target // Soustraire la valeur cible
brz found // Si le résultat est 0, on a trouvé une occurrence

adda step_tab // Passer à l'élément suivant du tableau

ld n // Charger le nombre d'éléments du tableau
sub step // Décrémenter n
st n // Stocker la nouvelle valeur de n (nombre d'éléments restants)

brnz boucle // Tant que n n'est pas 0, continuer la boucle
br stop // Si on sort de la boucle, on a fini de parcourir le tableau

found:
ld counter // Charger le compteur d'occurrences
add step // Incrémenter le compteur
st counter // Stocker la nouvelle valeur du compteur

adda step_tab // Passer à l'élément suivant du tableau

ld n // Charger le nombre d'éléments du tableau
sub step // Décrémenter n
st n // Stocker la nouvelle valeur de n (nombre d'éléments restants)

brz stop // Si n est 0, on a fini de parcourir le tableau
br boucle // Sinon, continuer la boucle

stop:
ld counter // Charger le compteur d'occurrences
stop

.data
n: 12 // Nombre d'éléments dans le tableau
tab: 1 // Début du tableau
2
3
2
2
4
2
5
4
7
4
7
target: 2 // Valeur à rechercher
counter: 0 // Compteur d'occurrences trouvées
step: 1 // Décrément de 1 pour n
step_tab: 1 // Incrément de 1 pour l'adresse du tableau