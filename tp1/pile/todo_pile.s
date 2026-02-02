
/*
Fonction qui inverse le contenu de sa pile locale
Vous pouvez modifiez le tableau qui sera push en entier sur la pile.
Une fonction utilitaire pour push le tableau est fournie. Ne pas la modifier (pas besoin de l'appeler.)
Une fonction utilitaire pour imprimer le contenu de la pile est fournie. Ne pas la modifier (pas besoin de l'appeler.)

Pour compiler et executer: 
    Ouvrir un terminal dans le répertoire de l'exercice
    Faire: make pile
*/

.data       

tableau:
.int 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  # <-- tableau qui sera push sur la pile

format_nombre:           # string de formattage
.asciz "%d\n"

.text                   
.globl inverser_pile   

inverser_pile:                  
# Prologue (cours 4)    # (ne pas modifier les prochaines lignes)
    pushl %ebp
    movl %esp, %ebp

    # Fonction qui push le tableau en entier sur la pile (ne pas modifier)
    push_tableau:
    movl $format_nombre, %eax
    subl $tableau, %eax
    movl $0, %edx
    movl $4, %ebx
    divl %ebx
    
    movl $tableau, %ebx
    movl %eax, %ecx

    push_loop:
    pushl (%ebx)
    addl $4, %ebx
    loop push_loop

    #####################################################

    # Votre code ici
    popl %eax
    popl %ebx
    popl %ecx
    popl %edx
    popl %r8
    popl %esi
    popl %edi
    popl %ebp

    movl %r8, %esp

    pusha
    # TODO: Votre algo

    #####################################################
    
    # Fonction utilitaire pour imprimer le contenu de la pile (ne pas modifier)
print_pile:               
    movl %esp, %ecx           
    
print_loop:
    cmpl %ebp, %ecx           
    jge fin_print             
    
    pushl %ecx               
    pushl (%ecx)              
    pushl $format_nombre     
    call printf               
    addl $8, %esp            
    popl %ecx                 
    
    addl $4, %ecx            
    jmp print_loop            
    
fin_print:
    movl $0, %eax

    # Epilogue (cours 4)    # (ne pas modifier les 2 prochaines lignes)
    leave
    ret

