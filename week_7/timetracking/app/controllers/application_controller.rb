class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def log_error(options)
    string = "*****\n"
    string += "#{options[:message]} #{options[:status]}\n"
    string += "with params: #{options[:params]}\n"
    string += "*****\n"
    Rails.logger.warn(string)
  end
end
