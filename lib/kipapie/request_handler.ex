defmodule Kipapie.RequestHandler do
  def get(type, item, api) do
    HTTPotion.start

    url = build_url(type, item)
    headers = headers(api)

    HTTPotion.get(url, headers: headers)
  end

  defp build_url(type, item) do
    "http://kipalog.com/api/v1/#{item}/#{type}"
  end

  defp headers(api) do
    [
      "X-Kipalog-Token": api,
      "Accept": "application/json"
    ]
  end
end
