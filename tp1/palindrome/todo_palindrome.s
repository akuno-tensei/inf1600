
/*
Fonction qui calcule vérifie si une chaine de caractères est un plaindrome
Vous pouvez modifiez la chaine de caractères dans le fichier main_plaindrome.s
Placer le résultat (1 si vrai, 0 si faux) dans %eax avant de quitter le programme (avant l'épilogue)

Pour compiler et executer: 
    Ouvrir un terminal dans le répertoire de l'exercice
    Faire: make palindrome
*/

.data                   

.text                   
.globl palindrome        

palindrome:              

# Prologue (cours 4)    # (ne pas modifier les 4 prochaines lignes)
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %esi  # Pointeur vers la chaine de caractère à tester

    #####################################################

    # Votre code ici


    # TODO: Votre algo
  

    # TODO: placer le résultat du calcul dans %eax avant de quitter le programme (avant l'épilogue)




    #####################################################
fin:
    # Epilogue (cours 4)    # (ne pas modifier les 2 prochaines lignes)
    leave
    ret

