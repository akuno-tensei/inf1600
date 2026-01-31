
/*
Fichier "main" qui appele la fonction puissance.
Vous pouvez la chaine de caractère. Ne rien modifier d'autre.
*/

.data               

chaine:
.asciz "KaYak"          # <-- Chaine de caractère (vous pouvez modifier)

est_palindrome:           # string de formattage
.asciz "la chaine %s est un palindrome\n"

pas_palindrome:           # string de formattage
.asciz "la chaine %s n'est pas un palindrome\n"

.text                   
.globl main             

main:                  

    # Prologue (cours 4)     # (ne pas modifier les 2 prochaines lignes)
    pushl %ebp
    movl %esp, %ebp

    call_palindrome:     # Appel de la fonction puissance ne pas modifier les prochaines lignes              
    pushl $chaine
    call palindrome      

    print_result:        # Impression du résultat, ne pas modifier les prochaines lignes
    cmpl $0, %eax
    je faux

    vrai:
    pushl $chaine
    pushl $est_palindrome
    call printf
    jmp fin

    faux:
    pushl $chaine
    pushl $pas_palindrome
    call printf

    fin:
    movl $0, %eax
    
    # Epilogue (cours 4)     # (ne pas modifier les 2 prochaines lignes)
    leave
    ret

