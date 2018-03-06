defmodule TddApp.IntegrationCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use TddAppWeb.ConnCase
      use PhoenixIntegration
    end
  end

end
