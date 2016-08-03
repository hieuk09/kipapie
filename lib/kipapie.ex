defmodule Kipapie do
  def main(args) do
    options = OptionParser.parse(args)
    {arguments, [action], _} = options
    %{type: type, item: item, api: api} = Enum.into(arguments, %{})
    process(action, type, item, api)
  end

  def process(action, type, item, api) do
    case action do
      "get" ->
        response = Kipapie.RequestHandler.get(type, item, api)

        if response.status_code == 200 do
          {:ok, json} = JSX.decode(response.body)
          print_result(json["content"])
        else
          IO.puts(response.headers.hdrs[:status])
          IO.puts(response.body)
        end

      "post" ->
        IO.puts("Please wait, this version does not support posting yet.")
      _ ->
        IO.puts("Wrong call!")
    end
  end

  defp print_result(json_response) do
    Enum.each json_response, fn (element)->
      element["title"]
      |> to_string
      |> IO.puts
    end
  end
end
