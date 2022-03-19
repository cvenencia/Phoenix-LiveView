defmodule MyApp.TimelineFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.Timeline` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        likes_count: "some likes_count",
        repost_count: "some repost_count",
        username: "some username"
      })
      |> MyApp.Timeline.create_post()

    post
  end
end
