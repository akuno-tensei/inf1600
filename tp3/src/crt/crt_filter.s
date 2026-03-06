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
    movl 8(%ebp), %ebx  # adresse de l'image img

    movl 4(%ebx), %ecx  # img.hauteur
    dec %ecx            # ajustement pour l'indexation à partir de n-1

    boucleLignes:
        movl (%ebx), %esi   # img.largeur
        dec %esi            # ajustement pour l'indexation à partir de m-1

        boucleColonnes:
            xor %edx, %edx      # initialisation de %edx pour la multiplication
            movl %ecx, %eax     # y
            movl 12(%ebp), %edi # scanlineSpacing
            divl %edi           # division pour vérifier si y est un multiple de scanlineSpacing

            cmp $0, %edx
            jne appliquer_phosphor
            
            appliquer_scanline:
                pushl %ecx

            	movl less_color, %edi

                pushl %edi                 # percent pour applyScanline

                movl 8(%ebx), %eax
                movl (%eax, %ecx, 4), %eax # adresse de img.pixels[y]
                lea (%eax, %esi, 4), %eax  # adresse de img.pixels[y][x] (pixel à modifier)
                pushl %eax             

                call applyScanline
                addl $8, %esp              # nettoyage de la pile après l'appel

                popl %ecx

            appliquer_phosphor:
                pushl %ecx

                movl %esi, %eax            # y
                xor %edx, %edx             # initialisation de %edx pour la division
                divl max_index             # division pour déterminer le subpixel

                pushl %edx                 # subpixel pour applyPhosphor

                movl 8(%ebx), %eax
                movl (%eax, %ecx, 4), %eax # adresse de img.pixels[y]
                lea (%eax, %esi, 4), %eax  # adresse de img.pixels[y][x] (pixel à modifier)
                pushl %eax         

                call applyPhosphor
                addl $8, %esp              # nettoyage de la pile après l'appel

                popl %ecx

            dec %esi                  # décrémenter la largeur restante
            cmp $0, %esi
            jge boucleColonnes

        dec %ecx                      # décrémenter la hauteur restante
        cmp $0, %ecx
        jge boucleLignes
        
    # epilogue
    popl %esi
    popl %edi
    popl %ebx
    
    leave 
    ret 

