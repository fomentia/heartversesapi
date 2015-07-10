defmodule Heartversesapi.Router do
  use Heartversesapi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Heartversesapi do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/kjv/:book/:chapter/:verse", KJVController, only: [:index]
      resources "/kjv/range/:book/:chapter/:verse_start/:verse_end", KJVController, only: [:index]
    end
  end
end
