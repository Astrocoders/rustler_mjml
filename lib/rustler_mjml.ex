defmodule RustlerMjml do
  def to_html(content), do: RustlerMjml.Native.to_html(content)
end
