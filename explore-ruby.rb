# explore the native JSON lib
require 'json'

def js
  return <<~JSON
{
 "every": "good",
 "boy": "does",
 "fine": 404
}
  JSON
end

jh = JSON.parse(js)
puts jh.class.name

%w[every fine undefined].each do |k|
  if jh.key?(k)
    puts "#{k} exists: #{jh[k]}"
  else
    puts "#{k} does not exist"
  end
end
