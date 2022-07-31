defmodule RustlerMjml do
  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :rustler_mjml,
    crate: "mjml",
    base_url: "https://github.com/Astrocoders/rustler_mjml/releases/download/v#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILATION_EXAMPLE_BUILD") in ["1", "true"],
    version: version

  # When your NIF is loaded, it will override this function.
  def to_html(_a), do: :erlang.nif_error(:nif_not_loaded)
end
