/*
Signature: void applyPhosphor(Pixel& p, int subpixel);

Paramètres:
p : la référence vers le pixel à modifier (sur place)
subpixel : indice du pixel dominant

Description : Le paramètre subpixel détermine quelle composante reste dominante :
	si subpixel == 0 → le rouge est conservé, le vert et le bleu sont réduits à 70 % de leur valeur initiale.
	si subpixel == 1→ le vert est conservé, le rouge et le bleu sont réduits à 70 % de leur valeur initiale.
	sinon → le bleu est conservé, le rouge et le vert sont réduits à 70 % de leur valeur initiale.

Encore une fois, puisqu’on travaille avec des divisions entières, la réduction se fait avec la formule suivante : nouvelle_valeur = valeur_originale × 70 / 100


*/
.data 

offset:
    .int 3

factor:
    .int 70

percent_conversion: 
    .int 100
        
.text 
.globl applyPhosphor                      

applyPhosphor:
    # prologue
    pushl   %ebp                      
    movl    %esp, %ebp

    pushl %ebx
    pushl %edi
    pushl %esi     

    # TODO
    movl 8(%ebp), %ebx # adresse du pixel p
    movl 12(%ebp), %edi # subpixel
    
    xor %eax, %eax # initialisation de %eax

    cmp $0, %edi
    je rouge_conserve

    cmp $1, %edi
    je vert_conserve

    # bleu_conserve
    bleu_conserve:
        # réduire rouge et vert à 70 %
        movb (%ebx), %al # rouge
        xor %edx, %edx
        mull factor
        divl percent_conversion
        movb %al, (%ebx) # rouge réduit

        movb 1(%ebx), %al # vert
        xor %edx, %edx
        mull factor
        divl percent_conversion
        movb %al, 1(%ebx) # vert réduit
        jmp fin

    #rouge_conserve:
    rouge_conserve:
       # réduire vert et bleu à 70 %
        movb 1(%ebx), %al # vert
        xor %edx, %edx
        mull factor
        divl percent_conversion
        movb %al, 1(%ebx) # vert réduit

        movb 2(%ebx), %al # bleu
        xor %edx, %edx
        mull factor
        divl percent_conversion
        movb %al, 2(%ebx) # bleu réduit
        jmp fin

    #vert_conserve:
    vert_conserve:
        # réduire rouge et bleu à 70 %
        movb (%ebx), %al # rouge
        xor %edx, %edx
        mull factor
        divl percent_conversion
        movb %al, (%ebx) # rouge réduit

        movb 2(%ebx), %al # bleu
        xor %edx, %edx
        mull factor
        divl percent_conversion
        movb %al, 2(%ebx) # bleu réduit

    # epilogue
    fin:
    popl %esi
    popl %edi
    popl %ebx
    leave 
    ret   

