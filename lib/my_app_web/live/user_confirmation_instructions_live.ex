defmodule MyAppWeb.UserConfirmationInstructionsLive do
  use MyAppWeb, :live_view

  alias MyApp.Account

  def render(assigns) do
    ~H"""
    <.header>Resend confirmation instructions</.header>

    <.simple_form for={@form} id="resend_confirmation_form" phx-submit="send_instructions">
      <.input field={@form[:email]} type="email" label="Email" required />
      <:actions>
        <.button phx-disable-with="Sending...">Resend confirmation instructions</.button>
      </:actions>
    </.simple_form>

    <p>
      <.link href={~p"/users/register"}>Register</.link>
      |
      <.link href={~p"/users/log_in"}>Log in</.link>
    </p>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: to_form(%{}, as: "user"))}
  end

  def handle_event("send_instructions", %{"user" => %{"email" => email}}, socket) do
    if user = Account.get_user_by_email(email) do
      Account.deliver_user_confirmation_instructions(
        user,
        &url(~p"/users/confirm/#{&1}")
      )
    end

    info =
      "If your email is in our system and it has not been confirmed yet, you will receive an email with instructions shortly."

    {:noreply,
     socket
     |> put_flash(:info, info)
     |> redirect(to: ~p"/")}
  end
end
