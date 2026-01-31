.text
ld num // Nombre à tester
shr // On divise num par 2 pour tester la parité
shl // On remultiplie par 2 pour retrouver la <supposée> valeur initiale
sub num // On soustrait la valeur initiale
brz even // Si le résultat est 0, num est pair
br odd // Sinon, num est impair

even: // Num est pair
ld isEven 
br stop

odd: // Num est impair
ld isOdd  
br stop

stop:
stop

.data
num: 7 // Nombre à tester
isEven: 1 // Retourne vrai
isOdd: 0 // Retourne faux