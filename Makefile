##
## EPITECH PROJECT, 2019
## makefile ex01
## File description:
## menger makefile
##

SRC	=	strlen.asm	\
		strchr.asm	\
		memset.asm	\
		memcpy.asm	\
		memmove.asm	\
		strcmp.asm	\
		strncmp.asm	\
		strcasecmp.asm	\
		rindex.asm	\
		strstr.asm	\
		strpbrk.asm	\
		strcspn.asm	\

NAME	=	libasm.so

OBJ	=	$(SRC:.asm=.o)

%.o: %.asm
		nasm -f elf64 $< -o $@

$(NAME)	:	$(OBJ)
			ld $(OBJ) -shared -o $(NAME)

all:	$(NAME)

clean :
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re:	fclean all