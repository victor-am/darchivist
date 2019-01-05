defmodule Darchivist.Files do
  # This is being done in order to bundle the template files together
  # with the darchivist binary.
  @sample_manifest_file Path.relative_to_cwd("priv/sample_manifest.yaml") |> File.read!

  def sample_manifest do
    @sample_manifest_file
  end
end
