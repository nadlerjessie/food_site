require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#valid?' do 
    let(:user) {FactoryGirl.build(:user, name: name, email: email, password: password, password_confirmation: password_confirmation, public_profile: public_profile)}
    let(:name) {"Amanda"}
    let(:email) {"dancergirl@yahoo.com"}
    let(:password) {"test"}
    let(:password_confirmation) {"test"}
    let(:public_profile) {true}

    context "when the user doesn't have a name" do
      let(:name) {nil}
      it 'is invalid with no name' do 
        expect(user).to_not be_valid
      end
    end

    context "when the user doesn't have an email" do 
      let(:email) {nil}
      it 'is invalid with no email' do 
        expect(user).to_not be_valid
      end
    end 

    context "when the user has an invalid email" do 
      let(:email) {"test"}
      it 'is invalid without complete email' do
        expect(user).to_not be_valid
      end
    end

    context "when the user doesn't have a password" do 
      let(:password) {nil}
      it 'is invalid with no password' do 
        expect(user).to_not be_valid
      end
    end  

    context "when the user doesn't have a password_confirmation" do 
      let(:password_confirmation) {nil}
      it 'is invalid with no password_confirmation' do 
        expect(user).to_not be_valid
      end
    end  

    context "when the user doesn't have a matching password and password_confirmation" do 
      let(:password) {"potato"}
      it 'is invalid without matching password and password_confirmation' do 
        expect(user).to_not be_valid
      end
    end  

    context "when the user doesn't have a unique email" do 
      let(:older_user) { FactoryGirl.create :user }
      it 'is invalid with duplicate unique email' do 
        user.email = older_user.email
        expect(user).to_not be_valid
      end
    end  

    context "when the user doesn't have a profile setting for public vs private" do 
      let(:public_profile) {nil}
      it 'is invalid without selecting an option for public or private profile' do 
        expect(user).to_not be_valid
      end
    end    
  end
end