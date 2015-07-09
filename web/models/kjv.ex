defmodule Heartversesapi.KJV do
  use Heartversesapi.Web, :model

  schema "verses" do
    field :book, :string
    field :chapter, :integer
    field :number, :integer
    field :text, :string

    timestamps
  end

  @required_fields ~w(book chapter number text)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
