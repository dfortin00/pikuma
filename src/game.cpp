#include "game.h"

Game::Game(){}

Game::~Game() {
    this->Destroy();
}

SDL_AppResult Game::Initialize() {
    return SDL_APP_CONTINUE;
}

SDL_AppResult Game::Update() {
    return SDL_APP_CONTINUE;
}

SDL_AppResult Game::HandleKeyboardInput(SDL_Event * event) {
    if (event->key.key == SDLK_ESCAPE)
        return SDL_APP_SUCCESS;

    return SDL_APP_CONTINUE;
}

SDL_AppResult Game::Render() {
    return SDL_APP_CONTINUE;
}

SDL_AppResult Game::Destroy() {
    return SDL_APP_CONTINUE;
}