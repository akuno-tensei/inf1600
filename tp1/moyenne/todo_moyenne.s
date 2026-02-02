
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
    xor %ecx, %ecx
    movl (%esi, %ecx, 4), %eax   # Charger le premier élement du tableau dans %eax
loop_start:
    add $1, %ecx            # Incrémenter le compteur d'éléments
    cmp $-1, (%esi, %ecx, 4)            # Comparer l'élement suivant avec -1
    je loop_end               # Si égal à -1, sortir de la boucle
    add (%esi, %ecx, 4), %eax  # Ajouter l'élement courant à la somme totale
    jmp loop_start            # Revenir au début de la boucle

    # TODO: placer le résultat du calcul dans %eax avant de quitter le programme (avant l'épilogue)
    idiv %ecx               # Diviser la somme totale par le nombre d'éléments
    #####################################################

    # Epilogue (cours 4)    # (ne pas modifier les 2 prochaines lignes)
loop_end:
    leave
    ret

