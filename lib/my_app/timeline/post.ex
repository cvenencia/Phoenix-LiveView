defmodule MyApp.Timeline.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :likes_count, :integer, default: 0
    field :repost_count, :integer, default: 0
    field :username, :string, default: "default_username"

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :repost_count, :likes_count])
    |> validate_required([:body])
    |> validate_length(:body, min: 2, max: 250)
  end
end
