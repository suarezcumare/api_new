require 'rails_helper'

RSpec.describe "API authentication", type: :api do

  let!(:user) { FactoryGirl.create(:user) }


  describe 'authentication' do

    it "making a request without cookie token " do
      get :api_users_path,:formate =>:json
      last_response.status.should eql(401)
      error = {:error=>'You need to sign in or sign up before continuing.'}
      last_response.body.should  eql(error.to_json)
    end
  end



end

