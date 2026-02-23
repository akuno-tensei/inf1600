/*
Signature: void applyPhosphor(applyScanline& p, int percent);

Paramètres:
p : la référence vers le pixel à modifier (sur place)
percent : facteur d’assombrissement

Description : Cette fonction applique un facteur d’assombrissement à un pixel en multipliant chacune de ses composantes RGB par un pourcentage donné: nouvelle_valeur = valeur_orignale x percent / 100
*/    
.data 

percent_conversion: 
.int 100

.text 
.globl applyScanline                      

applyScanline:
    # prologue
    pushl   %ebp                      
    movl    %esp, %ebp   

    pushl %ebx
    pushl %edi
    pushl %esi

    # TODO
    movl 8(%ebp), %ebx

    xor %ecx, %ecx
    movl $3, %ecx

    boucle:
        xor %eax, %eax
        movb -1(%ebx, %ecx, 1), %al # charge la valeur d'une composante RGB dans %eax

        xor %edx, %edx # initialisation de %edx pour la multiplication
        mull 12(%ebp) # multiplier par le percent passé en paramètre

        movl $100, %esi # diviseur placé dans %edi
        divl %esi # division

        movb %al, -1(%ebx, %ecx, 1) # remplacer la composante RGB par sa nouvelle valeur

        loop boucle
   
    # epilogue
    popl %esi
    popl %edi
    popl %ebx

    leave 
    ret   

