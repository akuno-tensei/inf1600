.text
ld n // Charger l'indice de l'élément à calculer
sub step // Décrémenter n
st n // Stocker la nouvelle valeur de n
boucle:
ld fn // Charger F(n)
st tmp // Stocker temporairement F(n)

ld fn_1 // Charger F(n-1)
add fn // Calculer F(n) + F(n-1) = F(n+1)
st fn // Stocker F(n+1)

ld tmp // Recharger l'ancienne valeur de F(n)
st fn_1 // Mettre à jour F(n-1) avec l'ancienne valeur de F(n)
    
ld n // Recharger n
sub step // Décrémenter n
st n // Stocker la nouvelle valeur de n

brnz boucle // Tant que n n'est pas 0, continuer la boucle
ld fn   // Charger le résultat final F(n)
stop

.data
fn: 1 // F(n)
fn_1: 0 // F(n-1)
n: 18 // Indice de l'élément à calculer
tmp: 1 // Variable temporaire
step: 1 // Décrément de 1
