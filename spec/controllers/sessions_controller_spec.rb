require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    visit '/'
  end  

  it 'expects login link to appear' do
    expect(page.should have_selector(:link_or_button, 'Login'))
  end
end
