import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :chatter, Chatter.Repo,
  username: "rickyriveraissoniceandfunnyomg",
  password: "",
  hostname: "localhost",
  database: "chatter_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chatter, ChatterWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "7B6+lFz9SgX8wRbY4rpRWuzPpMZ81GNmbvfDFL/j23/Shfb9XlbiISoDz0bV0IB7",
  server: true

# In test we don't send emails.
config :chatter, Chatter.Mailer, adapter: Swoosh.Adapters.Test
# Only use ectos Sandbox for tests
config :chatter, :sql_sandbox, true
# Config for wallaby to know to use Chrome
config :wallaby, driver: Wallaby.Chrome

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
