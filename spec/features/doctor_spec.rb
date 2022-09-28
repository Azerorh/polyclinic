require 'rails_helper'

RSpec.feature "Doctor", type: :feature do
  scenario "log in and create an answer" do
    user_case = create(:case)
    user = user_case.user
    doctor = user_case.doctor

    visit '/doctors/sign_in'
    fill_in 'phone_field', with: doctor.phone_number
    fill_in 'doctor_password', with: doctor.password
    check 'Remember me'
    click_button 'Log in'
    expect(page).to have_content "Signed in successfully."

    visit "/doctors/#{doctor.id}/cases"
    click_link 'Answer'
    expect(page).to have_content "Answer"

    fill_in 'case_answer', with: Faker::String.random
    click_button 'Submit'
    expect(page).to have_content "Successfully updated."
  end
end