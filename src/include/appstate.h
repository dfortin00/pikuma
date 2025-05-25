#pragma once

#include <memory>
#include "game.h"

class AppState {
private:
    SDL_Window *m_window = nullptr;
    SDL_Renderer *m_renderer = nullptr;
    std::unique_ptr<Game> m_game;

    int m_windowWidth = 0;
    int m_windowHeight = 0;

    Uint64 m_lastCounter = 0; // Used for deltatime
public:
    AppState();
    ~AppState();

    SDL_AppResult CreateWindowAndRenderer(int windowWidth, int windowHeight);

    void Destroy();

    SDL_Window* GetWindow() const;
    SDL_Renderer* GetRenderer() const;
    Game* GetGame() const;
    double GetDeltaTime();

    SDL_AppResult HandleKeyboardInput(SDL_Event *event);
};