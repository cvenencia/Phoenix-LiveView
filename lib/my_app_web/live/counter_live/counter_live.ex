defmodule MyAppWeb.CounterLive do
  use Phoenix.LiveView

  def mount(_params, %{}, socket) do
    if connected?(socket), do: Process.send_after(self(), :update, 1000)
      {:ok, assign(socket, counter: 20)}
  end

  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 1000)
    counter = socket.assigns.counter + 1
    {:noreply, assign(socket, :counter, counter)}
  end

  def handle_event("reset", _value, socket) do
    {:noreply, assign(socket, :counter, -50)}
  end
end
