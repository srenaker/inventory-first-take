class VisitsController < ApplicationController
  
  def sign_in
    
  end
  
  
  def form_login
    @username = params[:username]
    @password = params[:password]
    
    @login_result = User.where(:username => "#{@username}", :password => "#{@password}").first
    
    if @login_result.nil?

      @theLogin = "failed"
      flash[:notice] = "Login failed.  Try again."
      redirect_to("/visits/sign_in")
        
    else
      login_user(@login_result)
        redirect_to @login_result
    end    

  end
  
  def sign_out
    cookies.delete :username
    cookies.delete :user_id    
    redirect_to("/welcome")
  end
end
