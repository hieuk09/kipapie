defmodule Kipapie do
  def main(args) do
    options = OptionParser.parse(args)
    {[item: item, type: type, api: api], [action], _} = options
    HTTPotion.start
    url = "http://kipalog.com/api/v1/#{item}/#{type}"

    case action do
      'get' ->
        HTTPotion.get(
          url,
          headers: [
            "X-Kipalog-Token": api,
            "Accept": "application/json"
          ]
        )
      'post' ->
        IO.inspect('No support for post request yet')
    end
  end
end
