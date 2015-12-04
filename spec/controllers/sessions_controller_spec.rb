require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "/ when not logged in" do
    before do
      visit '/'
    end  

    it 'expects login link to appear' do
      expect(page).to have_selector(:link_or_button, 'Login')
    end
  end

  describe "logging in" do
    before do
      visit '/'
    end  

    it 'clicks Login and goes to /login' do
      click_on('Login')
      expect(current_path).to eq(login_path)
    end

    # it 'can login and see name and logout link' do
    #   visit '/login'
    #   fill_in('login-email'), with: ''
    #   expect(page).to have_selector(:link_or_button, 'Login')
    # end
  end
end
