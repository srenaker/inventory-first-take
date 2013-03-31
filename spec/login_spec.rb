
class LoginSpec
  
  describe VisitsController do
    it 'fails to log in an unknown user' do
      login_result = User.where(:username => "nobody", :password => "nowhere").first
      login_result.should be_nil
    end
  end
  
  
end