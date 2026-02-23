/*
Implementation en C:
void sierpinskiImage(uint32_t x, uint32_t y, uint32_t size, Image& img, Pixel color) {
    // vérifier les bornes
    if (x >= img.largeur || y >= img.hauteur) return;

    // Cas de base: dessiner un seul pixel
    if (size == 1) {
        img.pixels[y][x] = color;
        return;
    }

    uint32_t half = size / 2;

    // Triangle en bas à gauche
    sierpinskiImage(x, y + half, half, img, color);
    // Triangle en bas à droite
    sierpinskiImage(x + half, y + half, half, img, color);
    // Triangle du haut
    sierpinskiImage(x + half / 2, y, half, img, color);
}

L’algorithme fonctionne mieux avec des tailles puissances de 2.
L’appel de la fonction dans le main sera ainsi : sierpinskiImage(0, 0, 1024, img, color);
*/

.data 

.text 
.globl sierpinskiImage                      

sierpinskiImage:
    # prologue
    pushl   %ebp                      
    movl    %esp, %ebp  

    pushl %ebx
    pushl %edi
    pushl %esi                

    # TODO
    bornes:
        movl 8(%ebp), %edi # x
        movl 12(%ebp), %esi # y

        movl 20(%ebp), %ebx # img

        movl (%ebx), %eax # img.largeur
        cmp %eax, %edi
        jge fin

        movl 4(%ebx), %eax # img.hauteur
        cmp %eax, %esi
        jge fin

    cas_base:
        movl 16(%ebp), %eax # size
        cmp $1, %eax
        jne recursive

        # dessiner un pixel
        movl 8(%ebx), %ebx # img.pixels
        movl (%ebx, %esi, 4), %ebx # img.pixels[y]
        movl (%ebx, %edi, 4), %ebx # img.pixels[y][x]

        movl 24(%ebp), %eax # color.red
        movl %eax, (%ebx) # img.pixels[y][x] = color.red
        movl 28(%ebp), %eax # color.green
        movl %eax, 4(%ebx) # img.pixels[y][x] = color.green
        movl 32(%ebp), %eax # color.blue
        movl %eax, 8(%ebx) # img.pixels[y][x] = color.blue

    # epilogue
    fin:
        popl %esi
        popl %edi
        popl %ebx

        leave 
        ret   

    recursive:
        pushl %eax
        pushl %ecx
        pushl %edx

        # paremètres de l'appel récursif pour le triangle en bas à gauche
        pushl 36(%ebp) # color
        pushl 32(%ebp) # color
        pushl 28(%ebp) # color
        pushl 24(%ebp) # color
        pushl 20(%ebp) # img

        shrl $1, %eax # half = size / 2
        pushl %eax # half = size / 2

        movl %esi, %edx # y
        addl %eax, %edx # y + half
        pushl %edx # y + half

        pushl %edi # x

        call sierpinskiImage # Triangle en bas à gauche
        addl $40, %esp # nettoyage de la pile après l'appel

        popl %edx
        popl %ecx
        popl %eax

####################################################################################

        pushl %eax
        pushl %ecx
        pushl %edx

        # paremètres de l'appel récursif pour le triangle en bas à droite
        pushl 36(%ebp) # color
        pushl 32(%ebp) # color
        pushl 28(%ebp) # color
        pushl 24(%ebp) # color
        pushl 20(%ebp) # img

        shrl $1, %eax # half = size / 2
        pushl %eax # half = size / 2

        movl %esi, %edx # y
        addl %eax, %edx # y + half
        pushl %edx # y + half

        movl %edi, %edx # x
        addl %eax, %edx # x + half
        pushl %edx # x + half

        call sierpinskiImage # Triangle en bas à gauche
        addl $40, %esp # nettoyage de la pile après l'appel

        popl %edx
        popl %ecx
        popl %eax

####################################################################################

        pushl %eax
        pushl %ecx
        pushl %edx

        # paremètres de l'appel récursif pour le triangle du haut
        pushl 36(%ebp) # color
        pushl 32(%ebp) # color
        pushl 28(%ebp) # color
        pushl 24(%ebp) # color
        pushl 20(%ebp) # img

        shrl $1, %eax # half = size / 2
        pushl %eax # half = size / 2

        movl %esi, %edx # y
        addl %eax, %edx # y + half
        pushl %edx # y + half

        movl %edi, %edx # x
        shrl $1, %eax # half / 2
        addl %eax, %edx # x + half / 2
        pushl %edx # x

        call sierpinskiImage # Triangle en bas à gauche
        addl $40, %esp # nettoyage de la pile après l'appel

        popl %edx
        popl %ecx
        popl %eax

####################################################################################

        jmp fin




