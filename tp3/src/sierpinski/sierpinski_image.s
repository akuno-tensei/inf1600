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
        movl 8(%ebp), %edi         # x
        movl 12(%ebp), %esi        # y
        movl 20(%ebp), %ebx        # img

        movl (%ebx), %eax          # img.largeur
        cmp %eax, %edi
        jge fin

        movl 4(%ebx), %eax         # img.hauteur
        cmp %eax, %esi
        jge fin

    cas_base:
        movl 16(%ebp), %eax        # size
        cmp $1, %eax
        jne recursive

        # dessiner un pixel
        movl 8(%ebx), %ebx         # img.pixels
        movl (%ebx, %esi, 4), %ebx # img.pixels[y]

        movl 24(%ebp), %eax        # color
        movl %eax, (%ebx, %edi, 4) # img.pixels[y][x] = color

    # epilogue
    fin:
        popl %esi
        popl %edi
        popl %ebx

        leave 
        ret   

    recursive:
        movl 16(%ebp), %eax     # size
        shrl $1, %eax           # half = size / 2
        movl %eax, %ebx         

        # --- Triangle en bas à gauche ---
        # sierpinskiImage(x, y + half, half, img, color)
        pushl 24(%ebp)          # color
        pushl 20(%ebp)          # img
        pushl %ebx              # half
        movl 12(%ebp), %ecx     # y
        addl %ebx, %ecx         # ecx = y + half
        pushl %ecx              # push y + half
        pushl 8(%ebp)           # x
        call sierpinskiImage
        addl $20, %esp          # nettoyage de la pile après l'appel

        # --- Triangle en bas à droite ---
        # sierpinskiImage(x + half, y + half, half, img, color)
        pushl 24(%ebp)          # color
        pushl 20(%ebp)          # img
        pushl %ebx              # half
        movl 12(%ebp), %ecx     # y
        addl %ebx, %ecx         # ecx = y + half
        pushl %ecx              # push y + half
        movl 8(%ebp), %edx      # x
        addl %ebx, %edx         # edx = x + half
        pushl %edx              # push x + half
        call sierpinskiImage
        addl $20, %esp          # nettoyage de la pile après l'appel

        # sierpinskiImage(x + half/2, y, half, img, color)
        pushl 24(%ebp)          # color
        pushl 20(%ebp)          # img
        pushl %ebx              # half
        pushl 12(%ebp)          # y (on utilise l'original ici !)

        movl %ebx, %eax         # eax = half
        shrl $1, %eax           # eax = half / 2
        addl 8(%ebp), %eax      # eax = x + half / 2
        pushl %eax              # push x + half/2
        call sierpinskiImage
        addl $20, %esp          # nettoyage de la pile après l'appel

        jmp fin




