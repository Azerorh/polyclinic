require 'rails_helper'

RSpec.describe "Case", type: :request do  
  it 'creates a Case and redirect to Case`s page' do
    user = create(:user)
    doctor = create(:doctor)

    get "/users/#{user.id}/cases/new"
    expect(response).to render_template(:new)

    post "/users/#{user.id}/cases", params: { case: {question: Faker::String.random, 
                                                     doctor_id: doctor.id} }

    expect(response).to redirect_to(assigns(:cases))
    follow_redirect!        

    expect(response).to render_template(:index)
    expect(response.body).to include("Successfully created.")               
  end

  it "does not render a different template" do
    user = create(:user)
    
    get "/users/#{user.id}/cases/new"
    expect(response).to_not render_template(:show)
  end
end