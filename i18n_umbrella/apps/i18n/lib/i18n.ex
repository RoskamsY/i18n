defmodule I18n do
  @moduledoc """
  I18n keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  require I18nTranslations.Gettext
  @default_size 64
  @max_size 255

  @error_message_no_int "The provided size isn't a number. No can do."
  @error_message_too_large "The provided size is too large. The largest size we support is %{max_size}"
  def random_string(size \\ @default_size)

  def random_string(size) when not is_integer(size),
    do: {:error, I18nTranslations.Gettext.gettext(@error_message_no_int)}

  def random_string(size) when size > @max_size,
    do: {:error, I18nTranslations.Gettext.gettext(@error_message_too_large, max_size: @max_size)}

  def random_string(size) when is_integer(size) do
    response = :crypto.strong_rand_bytes(@default_size) |> Base.url_encode64() |> binary_part(0, size)

    {:ok, response}
  end
end
