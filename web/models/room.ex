defmodule ProjectName.Room do
  use ProjectName.Web, :model

  schema "rooms" do
    field :name, :string

    has_many :messages, ProjectName.Message

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
