defmodule RustlerMjml do
  use Rustler, otp_app: :rustler_mjml, crate: "mjml"

  def to_html(_a), do: :erlang.nif_error(:nif_not_loaded)
end
