
FILES_WITHOUT_HEADER = m_main t_init

FILES_WITH_HEADER = c_compile c_fix c_generate c_init c_keywords c_lexer c_prepr \
				d_code d_code_header d_design d_draw d_geo \
				e_clip e_complete e_editor e_files e_help e_inter e_log e_slider e_tools \
				f_game f_load f_save f_turn \
				g_cloud g_command g_game g_group g_method g_method_clob g_method_core g_method_misc g_method_pr g_method_std g_method_sy \
				g_method_uni g_misc g_motion g_packet g_proc g_proc_new g_proc_run g_shapes g_world g_world_back g_world_map g_world_map_2 \
				h_interface h_mission h_story \
				i_background i_buttons i_console i_disp_in i_display i_error i_input i_sysmenu i_view \
				m_input m_maths \
				p_draw p_init p_panels \
				s_menu s_mission s_turn \
				t_draw t_files t_template \
				v_draw_panel v_init_panel v_interp \
				x_init x_music x_sound x_synth \
				z_poly

FILES =  $(FILES_WITHOUT_HEADER) $(FILES_WITH_HEADER)

FILE_CLASSES_WITH_HEADER = c e g i

NAME = bin/liberation_circuit

SRC_DIR = src
SRC = $(FILES:%=$(SRC_DIR)/%.c)

OBJ_DIR = obj
OBJ = $(FILES:%=$(OBJ_DIR)/%.o)

INC_DIR = inc
INC = $(FILES_WITH_HEADER:%=$(INC_DIR)/%.h) $(FILE_CLASSES_WITH_HEADER:%=$(INC_DIR)/%_header.h) inc/m_config.h inc/m_globvars.h

ALLEGRO_MODULES = allegro allegro_audio allegro_acodec allegro_dialog allegro_font allegro_image allegro_primitives allegro_main
ALLEGRO_PATH = ./libs/allegro5
ALLEBRO_LIBS = $(ALLEGRO_MODULES:%=$(ALLEGRO_PATH)/lib%.a)
LFLAGS = -L$(ALLEGRO_PATH) $(ALLEGRO_MODULES:%=-l%)
EFLAGS = -Wall -Wextra -Werror
FLAGS = -Iinc/ -fwrapv -o0
CC = gcc
RM = @rm -fv
.PHONY: all, test, clean, fclean, re, force

all: $(NAME)

$(OBJ_DIR):
	@mkdir $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(OBJ_DIR) $(INC)
	$(CC) $(FLAGS) -o $@ -c $< $(MACROS) 

$(NAME): $(LIBS) $(OBJ) $(INC) Makefile
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LFLAGS)

clean:
	@echo "Cleaning objects:"
	$(RM) $(OBJ) $(ALT_FILE:%=$(OBJ_DIR)/%.o)

fclean: clean
	@echo "Cleaning target:"
	$(RM) $(NAME)

re: fclean all
