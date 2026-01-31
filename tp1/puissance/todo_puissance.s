
/*
Fonction qui calcule a à la puissance b.
Vous pouvez modifiez les paramètres a et b dans le fichier main_palindrome.s
Placer le résultat du calcul dans %eax avant de quitter le programme (avant l'épilogue)

Pour compiler et executer: 
    Ouvrir un terminal dans le répertoire de l'exercice
    Faire: make puissance
*/

.data                   

.text                   
.globl puissance        

puissance:              

    # Prologue (cours 4)    # (ne pas modifier les 4 prochaines lignes)
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %esi  # Paramètre a est placé dans %esi en début de programme
    movl 12(%ebp), %edi # Paramètre b est placé dans %edi en début de programme

    #####################################################

    # Votre algo ici

    # TODO: Votre algo
    

    # TODO: placer le résultat du calcul dans %eax avant de quitter le programme (avant l'épilogue)

    #####################################################


    # Epilogue (cours 4)    # (ne pas modifier les 2 prochaines lignes)
    leave
    ret

