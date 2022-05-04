import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :i18n_web, I18nWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "bzzfX5/ETHfwcZagxkD8NhxsEufjmoJKre5REDF1ACc1tGz173UFsSOI9M39um21",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.
config :i18n, I18n.Mailer, adapter: Swoosh.Adapters.Test

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
