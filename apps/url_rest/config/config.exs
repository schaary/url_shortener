# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :url_rest,
  namespace: UrlRest

# Configures the endpoint
config :url_rest, UrlRestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aPzA6RMfmx826gqTGVeND69LRR+dyeVQhHx0nOqbEK+yVjT1B3IeIt7xKuZIEheQ",
  render_errors: [view: UrlRestWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: UrlRest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
