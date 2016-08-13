defmodule ExMagicTest do
  use ExUnit.Case
  doctest ExMagic

  test "from_binary works" do
    # Small (valid) transparent PNG
    png_str = "89504E470D0A1A0A0000000D4948445200000001000000010100000000376EF9240000001049444154789C626001000000FFFF03000006000557BFABD40000000049454E44AE426082"
    png = Base.decode16!(png_str)

    assert ExMagic.from_buffer(png) == "image/png"
  end

  test "from_binary invalid" do
    assert ExMagic.from_buffer("blah") == "text/plain"
  end

  test "from_binary blank" do
    assert ExMagic.from_buffer("") == "application/x-empty"
  end
end