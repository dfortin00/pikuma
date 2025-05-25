#pragma once

#include <SDL3/SDL.h>

class Game {
private:

public:
    Game();
    ~Game();

    SDL_AppResult Initialize();
    SDL_AppResult Update();
    SDL_AppResult HandleKeyboardInput(SDL_Event *event);
    SDL_AppResult Render();
    SDL_AppResult Destroy();
};