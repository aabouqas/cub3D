/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cub3d.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aabouqas <aabouqas@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/24 17:09:17 by mait-elk          #+#    #+#             */
/*   Updated: 2024/10/09 11:22:23 by aabouqas         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "include/cub3d.h"

int	main(int ac, char **av)
{
	t_data	data;

	data_init(&data, ac, av);
	data.game_started = false;
	run_game(&data);
	safe_exit(0);
}
