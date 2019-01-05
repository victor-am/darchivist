defmodule Darchivist.Commands.Help do
  alias Darchivist.Commands

  @command_module_list [
    Commands.Help,
    Commands.Init,
    Commands.Install
  ]

  @github_link "http://github.com/victor-am/darchivist"

  def syntax do
    "help   "
  end

  def description do
    "Shows a description for each command"
  end

  def run(_params) do
    {:ok, version} = :application.get_key(:darchivist, :vsn)

    header = [
      "darchivist v#{version}",
      "Usage: darchivist <command> [<args>]\n",
      "Available commands:"
    ]

    footer = ["\nFor full documentation see #{@github_link}"]

    header ++ commands_help() ++ footer
  end

  defp commands_help do
    Enum.map(@command_module_list, &help_for/1)
  end

  defp help_for(command) do
    "  #{command.syntax} - #{command.description}"
  end
end
