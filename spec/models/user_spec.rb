require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  user = User.create!(email: Faker::Internet.email, password: "password")

  describe "user creation" do
    it "encrypts the password on user creation" do
      expect(user.encrypted_password).to_not eq("password")
    end


    it "checks whether it is valid password" do
      expect(user.password).to eq("password")
    end
  end


  describe '#valid?' do
    context 'when its email is nil' do
      it 'is not valid' do
        user.email = nil
        expect(user).to_not be_valid
      end
    end

    context 'when its password is nil' do
      it 'is not valid' do
        user.password = nil
        expect(user).to_not be_valid
      end
    end
  end
end
