defmodule PhoenixTodosApi.Router do
  use PhoenixTodosApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixTodosApi do
    pipe_through :api
    resources "/todos", TodoController, except: [:new, :edit]
  end
end