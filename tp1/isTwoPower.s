.text
ld num
brz notTwoPower // Si num == 0, non (0 n'est pas une puissance de 2)
sub step // On décrémente num de 1
brz twoPower // Si num - 1 == 0, oui (2^0 == 1)

boucle:
ld test // On charge la puissance de 2 courante (notre valeur test  )
mul power // On la multiplie par 2 (on calcule la prochaine puissance de 2)
st test // On stocke la nouvelle valeur test

ld num // On charge num
sub test // On soustrait la valeur test
brz twoPower // Si num - test == 0, oui (num est une puissance de 2)

ld counter // On charge le compteur (on a juste besoin de tester les puissances de 2**0 à 2**14)
sub step // On le décrémente
st counter // On stocke la nouvelle valeur du compteur
brnz boucle // Tant que le compteur n'est pas à 0, on continue la boucle

br notTwoPower // Si on sort de la boucle, c'est que num n'est pas une puissance de 2

twoPower: // On charge la valeur de retour pour "vrai"
ld true 
br stop 

notTwoPower: // On charge la valeur de retour pour "faux"
ld false 
br stop 

stop:
stop

.data
num: 18 // Nombre à tester

test: 1 // Valeur test initiale (2**0)
power: 2 // Facteur de multiplication (2)

counter: 14 // Nombre de puissances de 2 à tester (de 2**0 à 2**14)
step: 1 // Décrément de 1

true: 1 // Retourne vrai
false: 0 // Retourne faux