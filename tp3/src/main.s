/*
    Vous pouvez modifier le liens des images. SVP mettre leur source si pris en ligne.

    Commandes:

	make : compile le projet en générant l’exécutable principal.
	make run : compile le projet (si nécessaire) puis exécute l’application.
	make test : lance la suite de tests prévue pour vérifier le bon fonctionnement des fonctions et filtres implémentés.
	make remise : crée un fichier zip contenant l’ensemble des fichiers nécessaires pour la remise du projet, prêt à être soumis.

*/

.data 

inputCrt: 
    .asciz "images/cat.png"

outputCrt:
    .asciz "crt_cat.png"

outputSierpinski:
    .asciz "sierpinski.png"


.text 
.globl main                      

main:
    # prologue
    pushl   %ebp                      
    movl    %esp, %ebp

    pushl %ebx
    pushl %edi
    pushl %esi                 

    #################### Filtre CRT #######################

    subl $12, %esp # Allocation de 3 octets dans la pile pour l'image
    movl %esp, %ebx 
    addl $8, %ebx # adresse de l'image

    # TODO: Charger l'image inputCrt en appelant loadImage()
    pushl %eax
    pushl %ecx
    pushl %edx

    pushl %ebx
    lea inputCrt, %edi # nom de l'image à charger
    pushl %edi

    call loadImage
    add $8, %esp

    cmp $0, %eax # Verification que l'image a été chargée
    je fin

    popl %edx
    popl %ecx
    popl %eax

    # TODO: Appliquer le filtre crtFilter() sur cette image
    pushl %eax
    pushl %ecx
    pushl %edx

    movl $2, %edi # scanlineSpacing
    pushl %edi
    pushl %ebx 

    call crtFilter
    add $8, %esp

    popl %edx
    popl %ecx
    popl %eax

    # TODO: Sauvegarder cette image dans le fichier outputCrt avec saveImage()
    pushl %eax
    pushl %ecx
    pushl %edx

    pushl %ebx 
    lea outputCrt, %edi # nom de l'image transformée
    pushl %edi

    call saveImage
    add $8, %esp

    popl %edx
    popl %ecx
    popl %eax

    # TODO: Libérer la mémoire de vos images avec freeImage()
    pushl %eax
    pushl %ecx
    pushl %edx

    pushl %ebx 

    call freeImage
    add $4, %esp

    popl %edx
    popl %ecx
    popl %eax

    #################### Triangle de Sierpinski #######################

    subl $12, %esp # Allocation de 3 octets dans la pile pour l'image
    movl %esp, %ebx 
    addl $8, %ebx # adresse de l'image

    # TODO: Créer une image vide de taille d'une puissance de 2 en appelant createImage()
    # Puisque createImage() retourne une struct Image, il faut d’abord allouer de l’espace sur la pile pour l’image, puit push l’adresse de cet espace comme 3e paramètre avant de call la fonction.

    pushl %eax
    pushl %ecx
    pushl %edx

    movl $1024, %edi
    pushl %edi
    pushl %edi
    pushl %ebx

    call createImage
    add $12, %esp

    popl %edx
    popl %ecx
    popl %eax

    # TODO: Dessiner le triangle de Sierpinski avec la fonction récursive sierpinskiImage()
    pushl %eax
    pushl %ecx
    pushl %edx

    movl $0xE3AB3BFF, %edi # Pixel
    pushl %edi
    pushl %ebx             # Img
    movl $1204, %edi       # size
    pushl %edi
    xor %edi, %edi
    pushl %edi             # y = 0
    pushl %edi             # x = 0

    call sierpinskiImage

    popl %edx
    popl %ecx
    popl %eax

    # TODO: Sauvegarder cette image dans le fichier outputSierpinski avec saveImage()
    pushl %eax
    pushl %ecx
    pushl %edx

    pushl %ebx 
    lea outputSierpinski, %edi # nom de l'image transformée
    pushl %edi

    call saveImage
    add $8, %esp

    popl %edx
    popl %ecx
    popl %eax

    # TODO: Libérer la mémoire de vos images avec freeImage()
    pushl %eax
    pushl %ecx
    pushl %edx

    pushl %ebx 

    call freeImage
    add $4, %esp

    popl %edx
    popl %ecx
    popl %eax



    fin:
        movl $0, %eax

        # epilogue
        popl %esi
        popl %edi
        popl %ebx
        
        leave 
        ret   
