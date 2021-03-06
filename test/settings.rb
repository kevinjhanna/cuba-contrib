require_relative "helper"

Cuba.plugin Cuba::Settings
Cuba.set :foo, "bar"

Cuba.define do
  on default do
    res.write settings.foo
  end
end

test do
  assert_equal "bar", Cuba.foo
end

test do
  _, _, body = Cuba.call({ "PATH_INFO" => "", "SCRIPT_NAME" => "" })
  assert_response body, ["bar"]
end

test do
  Cuba.foo = "baz"
  assert_equal "baz", Cuba.foo
end