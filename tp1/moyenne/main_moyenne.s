
/*
Fichier "main" qui appele la fonction puissance.
Vous pouvez les valeurs du tableau. Ne rien modifier d'autre.
*/

.data               

tableau:
.int 95, 70, 87, 64, -1  # <-- tableau (vous pouvez modifier et ajouter/enlever des valeurs; DOIT TERMINER PAR -1)

chaine_resultat:           # string de formattage
.asciz "la moyenne des valeurs dans le tableau est: %d\n"

.text                   
.globl main             

main:                  

# Prologue (cours 4)    # (ne pas modifier les 2 prochaines lignes)
    pushl %ebp
    movl %esp, %ebp

    call_moyenne:       # Appel de la fonction puissance ne pas modifier les prochaines lignes              
    pushl $tableau
    call moyenne      

    print_result:       # Impression du résultat, ne pas modifier les prochaines lignes
    pushl %eax
    pushl $chaine_resultat
    call printf

    movl $0, %eax
# Epilogue (cours 4)    # (ne pas modifier les 2 prochaines lignes)
    leave
    ret

