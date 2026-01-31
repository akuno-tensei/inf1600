
/*
Fichier "main" qui appele la fonction puissance.
Vous pouvez modifiez les paramètres a et b. Ne rien modifier d'autre.
*/

.data                  

chaine_resultat:           # string de formattage
.asciz "%d à la puissance %d donne %d\n"

.text                   
.globl main             

main:                  

# Prologue (cours 4)    # (ne pas modifier les 2 prochaines lignes)
    pushl %ebp
    movl %esp, %ebp

    movl $2, %esi       # <-- Paramètre a (vous pouvez modifier la valeur)
    movl $8, %edi       # <-- Paramètre b (vous pouvez modifier la valeur)

    call_puissance:     # Appel de la fonction puissance ne pas modifier les prochaines lignes              
    pushl %edi          
    pushl %esi
    call puissance      

    print_result:       # Impression du résultat, ne pas modifier les prochaines lignes
    popl %esi
    popl %edi

    pushl %eax
    pushl %edi
    pushl %esi
    pushl $chaine_resultat
    call printf

    movl $0, %eax
# Epilogue (cours 4)    # (ne pas modifier les 2 prochaines lignes)
    leave
    ret

