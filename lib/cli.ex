defmodule Darchivist.CLI do
  alias Darchivist.Commands

  @command_to_module_dictionary %{
    "help" => Commands.Help,
    "init" => Commands.Init
  }

  def main(args \\ []) do
    args
    |> parse_args
    |> run_command
    |> print_output
  end

  defp parse_args(args) do
    args
    |> OptionParser.parse(switches: [])
    |> build_command_params
  end

  # Redirects to the `help` command when no command was given.
  defp build_command_params({_options, [], _}) do
    build_command_params({[], ["help"], []})
  end

  defp build_command_params({options, params, _}) do
    [command_name | command_params] = params
    [command: command_name, params: command_params, options: options]
  end

  defp run_command(command: command, params: params, options: _options) do
    command = @command_to_module_dictionary[command]
    command.run(params)
  end

  defp print_output(command_output_lines) do
    Enum.each(command_output_lines, &IO.puts/1)
  end
end
