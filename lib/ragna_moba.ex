defmodule RagnaMoba do
  @moduledoc """
  RagnaMoba keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @env Mix.env()

  @doc """
  Returns the config path on system disk.
  """
  def config_path do
    if Desktop.OS.windows?() do
      Path.join([Desktop.OS.home(), "Documents", "ragnaMOBA"])
    else
      Path.join([Desktop.OS.home(), ".config", "ragnaMOBA"])
    end
  end

  @doc """
  Returns the application environment
  """
  def env, do: @env
end
