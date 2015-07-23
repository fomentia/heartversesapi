defmodule Heartversesapi.Verses do
  use Heartversesapi.Web, :model

  schema "verses" do
    field :translation, :string
    field :book, :string
    field :chapter, :integer
    field :verse, :integer
    field :text, :string

    timestamps
  end

  @required_fields ~w(translation book chapter verse text)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:book, max: 18)
    |> validate_length(:translation, max: 4)
  end
end
