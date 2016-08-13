defmodule ExMagic.Mixfile do
  use Mix.Project

  def project do
    [app: :exmagic,
     version: "0.0.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: [:make, :elixir, :app],
     aliases: aliases(),
     deps: deps()]
  end

  defp aliases do
    # Execute the usual "mix clean", and also "make clean" in the general clean
    # task.
    [clean: ["clean", "clean.make"]]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    []
  end

  defp deps do
    [
      {:libmagic, git: "https://github.com/file/file", tag: "FILE5_28", app: false, compile: false}
    ]
  end
end


# Makefile tasks

defmodule Mix.Tasks.Compile.Make do
  @shortdoc "Compiles helper in c_src"

  def run(_) do
    {result, _error_code} = System.cmd("make", [], stderr_to_stdout: true)
    Mix.shell.info result

    :ok
  end
end

defmodule Mix.Tasks.Clean.Make do
  @shortdoc "Cleans helper in c_src"

  def run(_) do
    {result, _error_code} = System.cmd("make", ['clean'], stderr_to_stdout: true)
    Mix.shell.info result

    :ok
  end
end