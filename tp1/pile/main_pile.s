
/*
Fichier "main" qui appele la fonction pile.
Ne rien modifier.
*/

.data       


format_nombre:           # string de formattage
.asciz "%d\n"

.text                   
.globl main   

main:                  
# Prologue (cours 4)    # (ne pas modifier les prochaines lignes)
    pushl %ebp
    movl %esp, %ebp

    call inverser_pile

# Epilogue (cours 4)    # (ne pas modifier les 2 prochaines lignes)
    leave
    ret

