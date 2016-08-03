defmodule KipapieTest do
  use ExUnit.Case
  use ExVCR.Mock
  doctest Kipapie

  setup_all do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")
    :ok
  end

  test "kipapie get --item=post --type=hot --api=API" do
    use_cassette "get hot post" do
      Kipapie.main([
        "get",
        "--item=post",
        "--type=hot",
        "--api=api_token"
      ])
    end
  end

  test "kipapie get --item=post --type=newest --api=API" do
    use_cassette "get newest post" do
      Kipapie.main([
        "get",
        "--item=post",
        "--type=newest",
        "--api=api_token"
      ])
    end
  end
end
