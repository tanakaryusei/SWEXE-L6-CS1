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
    if User.find_by(uid: params[:uid])
      if BCrypt::Password.new(@userpass) == params[:pass]
        session[:login_uid] = params[:uid]
        redirect_to tweets_path
      else
        render "error"
      end
    else
      render "error"
    end
      
  end

  def logout
    session.delete(:login_uid)
    redirect_to top_main_path
  end
end
