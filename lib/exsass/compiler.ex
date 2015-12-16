defmodule Sass.Compiler do
  @moduledoc """
  Connects to the NIF for libsass
  """

  @on_load { :init, 0 }

  def init do
    path = :filename.join(:code.priv_dir(:exsass), "exsass")
    :ok = :erlang.load_nif(path, 0)
  end

  def compile(_) do
    exit(:nif_library_not_loaded)
  end
end
