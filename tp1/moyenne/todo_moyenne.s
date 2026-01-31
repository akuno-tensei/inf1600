
/*
Fonction qui calcule la moyenne de valeurs dans un tableau qui termine par -1 (à exclure)
Vous pouvez modifiez les valeurs du tableau dans le fichier main_moyenne.s
Placer le résultat du calcul dans %eax avant de quitter le programme (avant l'épilogue)

Pour compiler et executer: 
    Ouvrir un terminal dans le répertoire de l'exercice
    Faire: make moyenne
*/

.data                   

.text                   
.globl moyenne        

moyenne:              

    # Prologue (cours 4)    # (ne pas modifier les 4 prochaines lignes)
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %esi  # Pointeur vers le tableau est placé dans %esi en début de programme
    
    #####################################################

    # Votre code ici
    
    # TODO: Votre algo
   
    # TODO: placer le résultat du calcul dans %eax avant de quitter le programme (avant l'épilogue)

    #####################################################

    # Epilogue (cours 4)    # (ne pas modifier les 2 prochaines lignes)
    leave
    ret

