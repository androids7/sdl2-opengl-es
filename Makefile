CFLAGS = -g -O2
LDFLAGS_GL = -lGL -lm
LDFLAGS_MESA = -lMesaGL
SDLFLAGS = $(shell sdl2-config --libs --cflags)
CC=gcc

# -lXi -lXmu

all:	eglbuild glbuild

glbuild:
	$(CC) $(CFLAGS) -o app_gl my_app.c $(LDFLAGS_GL) $(SDLFLAGS)

eglbuild:
	$(CC) $(CFLAGS) -o app_egl my_app.c -lGLESv2 $(SDLFLAGS)

macbuild:
	$(CC) -framework OpenGL -o app_gl my_app.c $(SDLFLAGS)

clean:
	rm app_egl app_gl
