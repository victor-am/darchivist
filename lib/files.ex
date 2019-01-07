defmodule Darchivist.Files do
  @sample_manifest_path Path.relative_to_cwd("priv/sample_manifest.yaml")
  @sample_manifest_content File.read!(@sample_manifest_path)

  @external_resource @sample_manifest_path

  def sample_manifest, do: @sample_manifest_content
end
