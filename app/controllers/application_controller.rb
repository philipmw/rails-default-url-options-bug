class ApplicationController < ActionController::Base
  def default_url_options
    STDERR.puts "default_url_options invoked"
    {'defarg' => 'defval'}
  end
end
