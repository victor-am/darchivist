defmodule Darchivist.Commands.Help do
  alias Darchivist.Commands

  @command_module_list [
    Commands.Help,
    Commands.Init
  ]

  def syntax do
    "help"
  end

  def description do
    "Shows a description for each command"
  end

  def run(_params) do
    header = [
      "darchivist <INSERT VERSION HERE>",
      "Usage: darchivist <command> [<args>]",
      "",
      "Available commands:"
    ]

    footer = [
      "",
      "For full documentation see <INSERT GITHUB LINK HERE>"
    ]

    header ++ commands_help() ++ footer
  end

  defp commands_help do
    Enum.map(@command_module_list, fn command ->
      help_for(command)
    end)
  end

  defp help_for(command) do
    "  #{command.syntax} - #{command.description}"
  end
end
