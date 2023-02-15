desc 'Lists the first message'
task first_message: [:environment]  do
  ActiveRecord::Base.transaction do
    STDOUT.puts Message.first
    STDIN.gets
  end
end