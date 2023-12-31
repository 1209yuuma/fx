module SessionsHelper
    # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  

  def log_out
    reset_session
    @current_user = nil   
  end

  def logged_in?
    !current_user.nil?
  end


# 現在のユーザーをログアウトする
  def log_out
    
    reset_session
    @current_user = nil
  end
end
