module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def user_signed_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end


  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


end