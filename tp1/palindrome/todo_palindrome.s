
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
    xor %ecx, %ecx
    loop_length:
        cmpb $0, (%esi, %ecx, 1)
        je end_length
        inc %ecx
        jmp loop_length
        
    end_length:
        dec %ecx  # ECX = longueur - 1

    cmp $0, %ecx
    je is_pallindrome  # Une chaine avec 0 ou 1 caractère est un palindrome

    loop_pallindrome:
        xor %edx, %edx
        mov (%esi, %ecx, 1), %al
        mov (%esi, %edx, 1), %bl
        cmp %al, %bl
        jne not_pallindrome
        inc %edx
        dec %ecx
        cmp %edx, %ecx
        jl loop_pallindrome
        
    # TODO: Votre algo
  

    # TODO: placer le résultat du calcul dans %eax avant de quitter le programme (avant l'épilogue)
    



    #####################################################
fin:
    # Epilogue (cours 4)    # (ne pas modifier les 2 prochaines lignes)
    leave
    ret

not_pallindrome:
    movl $0, %eax  # Faux
    jmp fin
is_pallindrome:
    movl $1, %eax  # Vrai
    jmp fin
