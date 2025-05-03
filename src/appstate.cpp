#include <SDL3/SDL.h>
#include "appstate.h"

AppState::AppState() : m_game(std::unique_ptr<Game>(std::make_unique<Game>())) {}

AppState::~AppState() {}

SDL_AppResult AppState::CreateWindowAndRenderer(int windowWidth, int windowHeight) {
    /* Create the window */
    if (!SDL_CreateWindowAndRenderer("Pikuma Game", windowWidth, windowHeight, 0, &m_window, &m_renderer)) {
        SDL_Log("Couldn't create window and renderer: %s", SDL_GetError());
        return SDL_APP_FAILURE;
    }

    if(!m_window || !m_renderer) {
        SDL_Log("Failed to initialize");
        SDL_DestroyWindow(m_window);
        SDL_Quit();
        return SDL_APP_FAILURE;
    }

    return SDL_APP_CONTINUE;
}

SDL_Window* AppState::GetWindow() const {
    return m_window;
}

SDL_Renderer* AppState::GetRenderer() const {
    return m_renderer;
}

Game* AppState::GetGame() const {
    return m_game.get();
}

double AppState::GetDeltaTime() {
    return 0.0;
}