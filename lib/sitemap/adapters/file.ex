defmodule Sitemap.Adapters.File do
  alias Sitemap.Location
  alias Sitemap.DirNotExists

  @behaviour Sitemap.Adapters.Behaviour

  def write(name, data) do
    dir = Location.directory(name)
    cond do
      ! File.exists?(dir) -> File.mkdir_p(dir)
      ! File.dir?(dir)    -> raise DirNotExists
      true                -> nil
    end

    path = Location.path(name)
    if Regex.match?(~r/.gz$/, path) do
      writefile(File.open!(path, [:write, :utf8, :compressed]), data)
    else
      writefile(File.open!(path, [:write, :utf8]), data)
    end
  end

  defp writefile(stream, data) do
    IO.write stream, data
    File.close stream
  end

end
