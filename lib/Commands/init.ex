defmodule Darchivist.Commands.Init do
  @default_manifest_path "./darchivist.yaml"

  alias IO.ANSI

  def syntax do
    "init"
  end

  def description do
    "Creates an example darchivist.yaml on the given path (default: current path)"
  end

  def run(params) do
    output_path = get_path(params)
    file_content = Darchivist.Files.sample_manifest

    File.write!(output_path, file_content)

    [
      "Darchivist initialized successfuly!",
      "Edit your #{ANSI.bright}darchivist.yaml#{ANSI.normal} file to set up your own configurations.",
      "",
      "#{ANSI.bright}Tip:#{ANSI.normal} we strongly advise using git to version your files."
    ]
  end

  defp get_path(params) do
    params[:path] || @default_manifest_path
  end
end
