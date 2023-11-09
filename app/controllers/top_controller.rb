class TopController < ApplicationController
  def main
    render "login"
    #if session[:login_uid] != nil
      #redirect_to tweets_path
    #lse
      #render "login"
    #end
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user != nil
      login_pass = BCrypt::Password.new(user.pass)
      if login_pass == params[:pass]
        session[:login_uid] = user.uid
        redirect_to tweets_path
      else
        render "error"
      end
    
    end
      
  end

  def logout
    session.delete(:login_uid)
    redirect_to top_main_path
  end
end
