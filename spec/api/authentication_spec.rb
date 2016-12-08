require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
    

  #let(:user) {{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }}
  let(:content_type) {{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }}


	describe "#Index" do
		user = FactoryGirl.create(:user)

    it "return a json with values calculated" do
      get :index
      values = JSON.parse(response.body)
      puts values
      expect(values['success']).to eq true
      expect(values['response'].length).to eq User.count
      
    end
  end

=begin

  describe "#Log_in" do
  	let(:user_test) { FactoryGirl.create(:user) }
  	params_error_user =  {"user" => { email: "some@email.com", password: "password" }}
  	params_error_password =  {"user" => { email: user_test.email, password: "password" }}
  	params_correct =  {"user" => { email: user_test.email, password: user_test.password }}

    it "user error in email params" do
      post :log_in, params_error_user, content_type
      values = JSON.parse(response.body)
      expect(values['success']).to eq false
      expect(values['info']).to eq "Please enter the valid email."
    end

    it "user error in password params" do
      post :log_in, params_error_password, content_type
      values = JSON.parse(response.body)
      expect(values['success']).to eq false
      expect(values['info']).to eq "Please enter the valid password."
    end

    it "user correct params" do
      post :log_in, params_error_password, content_type
      values = JSON.parse(response.body)
      expect(values.success).to eq true
      expect(values['info']).to eq "Please enter the valid password."
      puts values
    end
 

  end

=end

end

