defmodule Heartversesapi.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, otp_app: :heartversesapi

  def conf do
    URI.parse Application.get_env(:phoenix, :database)[:url]
  end

  def priv do
    Application.app_dir(:heartversesapi, "priv/repo")
  end
end
