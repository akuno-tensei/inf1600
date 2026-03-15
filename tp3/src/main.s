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
    .asciz "images/woman.png"

outputCrt:
    .asciz "crt_woman.png"

outputSierpinski:
    .asciz "sierpinski.png"

scanlineSpacing: .int 1

hauteur: .int 520

largeur: .int 520

size: .int 512

x: .int 4

y: .int 4

pixel: .int 0xE3AB3BFF





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

    subl $12, %esp   # Allocation de 3 octets dans la pile pour l'image
    movl %esp, %ebx  # adresse de l'image

    # TODO: Charger l'image inputCrt en appelant loadImage()
    pushl %eax
    pushl %ecx
    pushl %edx

    pushl %ebx         # Image

    lea inputCrt, %edi 
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

    movl scanlineSpacing, %edi
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

    pushl %ebx          # Image

    lea outputCrt, %edi 
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

    subl $12, %esp   # Allocation de 3 octets dans la pile pour l'image
    movl %esp, %ebx  # adresse de l'image

    # TODO: Créer une image vide de taille d'une puissance de 2 en appelant createImage()
    # Puisque createImage() retourne une struct Image, il faut d’abord allouer de l’espace sur la pile pour l’image, puit push l’adresse de cet espace comme 3e paramètre avant de call la fonction.

    pushl %eax
    pushl %ecx
    pushl %edx

    movl largeur, %edi
    pushl %edi

    movl hauteur, %edi
    pushl %edi

    pushl %ebx          # Image

    call createImage
    add $12, %esp

    popl %edx
    popl %ecx
    popl %eax

    # TODO: Dessiner le triangle de Sierpinski avec la fonction récursive sierpinskiImage()
    pushl %eax
    pushl %ecx
    pushl %edx

    movl pixel, %edi    
    pushl %edi

    pushl %ebx            # Image

    movl size, %edi      
    pushl %edi

    movl y, %edi     
    pushl %edi

    movl x, %edi       
    pushl %edi            

    call sierpinskiImage

    popl %edx
    popl %ecx
    popl %eax

    # TODO: Sauvegarder cette image dans le fichier outputSierpinski avec saveImage()
    pushl %eax
    pushl %ecx
    pushl %edx

    pushl %ebx                 # Image

    lea outputSierpinski, %edi 
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
