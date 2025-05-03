#pragma once

#include <memory>
#include "game.h"

class AppState {
private:
    SDL_Window *m_window = nullptr;
    SDL_Renderer *m_renderer = nullptr;
    std::unique_ptr<Game> m_game;
    double m_deltatime = 0.0;

public:
    AppState();
    ~AppState();

    SDL_AppResult CreateWindowAndRenderer(int windowWidth, int windowHeight);

    SDL_Window* GetWindow() const;
    SDL_Renderer* GetRenderer() const;
    Game* GetGame() const;
    double GetDeltaTime();
};