class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def log_error(options)
    string = "*****\n"
    string += "#{options[:message]} #{options[:status]}\n"
    string += "with params: #{options[:params]}\n"
    string += "*****\n"
    Rails.logger.warn(string)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
