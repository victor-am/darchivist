defmodule Darchivist.Commands.Install do
  alias Darchivist.Output

  def syntax do
    "install"
  end

  def description do
    "Sets up symlinks for your dotfiles as specified on the darchivist.yaml manifest"
  end

  def run(_params) do
    case get_manifest() do
      {:ok, manifest} -> create_symlinks(manifest["files"])
      {:error, reason} -> [Output.error(reason)]
    end
  end

  # --------------------------
  # Private
  # --------------------------
  defp get_manifest do
    Path.relative_to_cwd("./darchivist.yaml")
    |> YamlElixir.read_from_file()
  end

  defp create_symlinks(manifest_files) do
    operation_output =
      Enum.map(manifest_files, fn {app_name, file} ->
        file
        |> create_symlink_directory()
        |> create_symlink()
        |> symlink_creation_output(app_name)
      end)

    ["Starting to link files..."] ++ operation_output ++ ["Finished!"]
  end

  defp create_symlink_directory(file) do
    file["symlink_path"]
    |> Path.dirname()
    |> File.mkdir_p()

    file
  end

  defp create_symlink(file) do
    file_absolute_path =
      file["file_path"]
      |> Path.relative_to_cwd()
      |> Path.absname()

    File.ln_s(file_absolute_path, file["symlink_path"])
  end

  defp symlink_creation_output(:ok, app_name) do
    ["  Symlink for #{Output.bold(app_name)} was created successfully"]
  end

  defp symlink_creation_output({:error, reason}, app_name) do
    ["  Symlink for #{Output.bold(app_name)} failed to be created!\n", Output.error(reason)]
  end
end
