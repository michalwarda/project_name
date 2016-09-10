defmodule ProjectName.IntegrationCase do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  using do
    quote do
      use Hound.Helpers
      import ProjectName.IntegrationCase

      hound_session
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ProjectName.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(ProjectName.Repo, {:shared, self()})
    end

    :ok
   end
end
