/*
Signature : void crtFilter(Image& img, int scanlineSpacing)

Paramètres :
img : la référence vers l’image à modifier (sur place)
scanlineSpacing : espacement entre les lignes que l’on va dessiner sur l’image pour l’effet CRT


Description : Cette fonction applique un filtre global à une image afin de reproduire l’apparence d’un ancien écran CRT. Elle combine les deux fonctions précédentes.
Il faut parcourir TOUS les pixels et appliquer les traitements suivants:
1.	Appeler applyScanline() 
    	Si la ligne y est un multiple de scanlineSpacing on applique un assombrissement de 60 %.

2.	Appler applyPhosphor()
        Le paramètre subpixel est déterminé par la position horizontale du pixel : x % 3

*/
.data   

full_color:
    .int 100

less_color:
    .int 60

max_index:
    .int 3

.text 
.globl crtFilter                      

crtFilter:
    # prologue
    pushl   %ebp                      
    movl    %esp, %ebp       
    pushl %ebx
    pushl %edi
    pushl %esi

    # TODO
    movl 8(%ebp), %ebx # adresse de l'image img
    movl less_color, %edi 

    movl 4(%ebx), %ecx # img.hauteur
    dec %ecx # ajustement pour l'indexation à partir de n-1

    boucleLignes:
        movl (%ebx), %esi # img.largeur
        dec %esi # ajustement pour l'indexation à partir de n-1

        boucleColonnes:
            xor %edx, %edx # initialisation de %edx pour la multiplication
            movl %ecx, %eax # y
            divl scanlineSpacing # division pour vérifier si y est un multiple de scanlineSpacing
            cmp $0, %edx
            je appliquer_scanline

            # appliquer_phosphor
            appliquer_phosphor:
                movl %esi, %eax # y
                xor %edx, %edx # initialisation de %edx pour la division
                divl max_index # division pour déterminer le subpixel
                pushl %edx # subpixel pour applyPhosphor

                movl 8(%ebx), %eax # adresse de img.pixels
                movl (%eax, %ecx, 4), %eax # adresse de img.pixels[y]
                lea (%eax, %esi, 4), %eax 
                pushl %eax          # adresse de img.pixels[y][x] (pixel à modifier)

                call applyPhosphor
                addl $8, %esp # nettoyage de la pile après l'appel
                jmp next_boucleColonnes

            appliquer_scanline:
                pushl %edi # percent pour applyScanline

                movl 8(%ebx), %eax # adresse de img.pixels
                movl (%eax, %ecx, 4), %eax # adresse de img.pixels[y]
                lea (%eax, %esi, 4), %eax 
                pushl %eax          # adresse de img.pixels[y][x] (pixel à modifier)

                call applyScanline
                addl $8, %esp # nettoyage de la pile après l'appel
                

            next_boucleColonnes:
                dec %esi # décrémenter la largeur restante
                cmp $-1, %esi
                jne boucleColonnes

        next_boucleLignes:
            dec %ecx # décrémenter la hauteur restante
            cmp $-1, %ecx
            jne boucleLignes
    # epilogue
fin:
    popl %esi
    popl %edi
    popl %ebx
    leave 
    ret 

