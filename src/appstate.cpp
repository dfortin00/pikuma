#include <SDL3/SDL.h>
#include "appstate.h"

AppState::AppState() : m_game(std::unique_ptr<Game>(std::make_unique<Game>())) {
    m_lastCounter = SDL_GetPerformanceCounter();
}

AppState::~AppState() {
    this->Destroy();
}

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

    SDL_GetWindowSize(m_window, &m_windowWidth, &m_windowHeight);

    return SDL_APP_CONTINUE;
}

void AppState::Destroy() {
    SDL_Log("Destroying appstate....");

    if (m_renderer != nullptr) SDL_DestroyRenderer(m_renderer);
    if (m_window != nullptr) SDL_DestroyWindow(m_window);

    m_window = nullptr;
    m_renderer = nullptr;
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
    Uint64 currentCounter = SDL_GetPerformanceCounter();
    Uint64 freq = SDL_GetPerformanceFrequency();
    double dt = static_cast<double>(currentCounter - m_lastCounter) / freq;
    m_lastCounter = currentCounter;

    return dt;
}

SDL_AppResult AppState::HandleKeyboardInput(SDL_Event * event) {
    const SDL_KeyboardEvent& keyEvent = event->key;

    if (keyEvent.key == SDLK_RETURN && keyEvent.mod & SDL_KMOD_ALT) {
        Uint32 flags = SDL_GetWindowFlags(m_window);
        bool isFullScreen = (flags & SDL_WINDOW_FULLSCREEN) != 0;

        if (isFullScreen) {
            SDL_SetWindowFullscreen(m_window, 0);
        } else {
            SDL_SetWindowFullscreen(m_window, SDL_WINDOW_FULLSCREEN);
        }

        SDL_GetWindowSize(m_window, &m_windowWidth, &m_windowHeight);

        return SDL_APP_CONTINUE;
    }

    return m_game->HandleKeyboardInput(event);
}