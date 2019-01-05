defmodule Darchivist.Output do
  alias IO.ANSI

  @error_dictionary %{
    :eexist => "A file already exists in the same location.",
    :enoent => "Failed to create the directory for the new file.",
    "malformed yaml" => "No darchivist.yaml was found on the current directory."
  }

  def error(reason) do
    message = @error_dictionary[reason] || reason
    "  #{ANSI.reverse()}[Error]#{ANSI.reverse_off()} #{message}"
  end

  def tip(message) do
    "#{ANSI.bright()}Tip:#{ANSI.normal()} #{message}"
  end

  def bold(text) do
    ANSI.bright() <> text <> ANSI.normal()
  end
end
