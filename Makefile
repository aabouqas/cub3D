# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aabouqas <aabouqas@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/01 15:22:43 by mait-elk          #+#    #+#              #
#    Updated: 2024/10/09 11:20:52 by aabouqas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CFLAGS= -Wall -Werror -Wextra -I include -I libft
NAME = cub3D

SRC = src/utils.c src/print.c src/initialization.c src/door.c \
	src/map_check/map_parse.c src/map_check/check_map.c src/map_check/check_colors.c \
	src/io_operators/append2d.c src/strings.c \
	src/errors_handling/errors_args.c src/errors_handling/put_error.c \
	src/io_operators/safe_str1.c src/io_operators/safe_str2.c \
	src/images/t_image_instractions.c \
	src/math/angle.c src/math/utils.c \
	src/game/init_player.c src/game/run_game.c src/game/events_game.c src/game/utils_game.c src/game/player_env.c \
	src/map_utils/draw_map.c src/game/utils_game2.c \
	src/walls_paint/texture_instractions.c \
	src/play_back/play_back.c src/play_back/signals_handler.c \
	src/menu/menu.c src/menu/menu_events.c src/menu/menu_utils.c src/menu/cubs.c \
	src/raycast/send_ray.c src/raycast/ray_utils_1.c src/raycast/ray_utils_2.c

OBJ = $(SRC:.c=.o)
LIBFT = libft/libft.a
MLX = -Llib -lmlx -framework OpenGL -framework AppKit

all: $(NAME)
	@printf "\033[32m🎮 $(NAME) is Ready\033[0m\n"


src/%.o: src/%.c include/$(NAME).h
	@printf "🔄\033[32m ⭐ Compiling Bonus Script $< \033[0m"
	@if $(CC) $(CFLAGS) -c $< -o $@ 2> /tmp/errcub3d; then \
		printf "\r✅\n"; \
	else \
		printf "\r❌\n\033[31m Cannot Compile [$<] Because: \n\033[0m"; \
		cat /tmp/errcub3d; rm -rf /tmp/errcub3d; \
		exit 1; \
	fi

$(NAME): $(LIBFT) $(OBJ) $(NAME).c include/$(NAME).h
	@printf "🔄\033[32m Compiling executable File...\033[0m"
	@if $(CC) $(CFLAGS) $(NAME).c $(OBJ) $(LIBFT) $(MLX) -o $(NAME) 2> /tmp/errcub3d; then \
		printf "\r✅\n"; \
	else \
		printf "\r❌\n\033[31mCannot Compile [$(NAME).c] Because: \n\033[0m"; \
		cat /tmp/errcub3d; rm -rf /tmp/errcub3d; \
		exit 1; \
	fi

$(LIBFT):
	@printf "🔄\033[32m Compiling Libft...\033[0m"
	@if make -C libft 2> /tmp/errcub3d; then \
		printf "\r✅\n"; \
	else \
		printf "\r❌\n\033[31mCannot Compile [$(LIBFT)] Because: \n\033[0m"; \
		cat /tmp/errcub3d; rm -rf /tmp/errcub3d; \
		exit 1; \
	fi

clean:
	@printf "🔄\033[32m Cleaning Objects...\033[0m"
	@rm -rf $(OBJ) $(OBJ)
	@make clean -C libft
	@printf "\r✅\n";

fclean: clean
	@printf "🔄\033[32m Removing NAME file And Library...\033[0m"
	@rm -rf $(NAME) $(NAME)
	@make fclean -C libft
	@printf "\r✅\n";

.PHONY: clean

re: fclean all
