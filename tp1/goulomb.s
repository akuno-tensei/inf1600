.text
lea tab // Adresse de début du tableau

boucle0:
ld num // Charger la valeur courante du tableau
add step // Incrémenter la valeur courante
st num_of_num // Stocker le nombre de fois que la valeur courante doit etre dans le tableau
st num // Stocker la valeur courante

boucle1:
ld num // Charger la valeur courante du tableau

sti // Stocker la valeur courante du tableau

ld n // Charger le nombre d'éléments du tableau
sub step // Décrémenter n
st n // Stocker la nouvelle valeur de n
brz stop // Si on a le nombre d'éléments nécessaire, on termine

ld num_of_num // Charger le nombre de fois que la valeur courante doit etre dans le tableau
sub step // Décrémenter ce nombre
st num_of_num // Stocker la nouvelle valeur

adda step  // Passer à l'élément suivant du tableau

brnz boucle1

ld n // Charger le nombre d'éléments du tableau

brz stop // Si on a le nombre d'éléments nécessaire, on termine
br boucle0 // Sinon, continuer la boucle

stop:
stop

.data
n: 12 // longeur du tableau
num: 0 // valeur courante
step: 1 // incrément de 1
num_of_num: 0 // nombre de fois que la valeur courante doit etre dans le tableau
tab: 0 // debut du tableau