require 'rails_helper'

RSpec.describe User do
  let(:user) { User.new(email: "test@test.com", password: "Password#2", password_confirmation: "Password#2")}

  describe "validations" do
    it "works" do
      user.save
      expect(user.valid?).to be_truthy
    end

    it "requires an uppercase" do
      user.password = "password#2"
      user.password_confirmation = "password#2"
      user.save

      expect(user.errors[:password]).to eq(["Must include at least one Uppercase letter"])
    end

    it "requires an lowercase" do
      user.password = "PASSWORD#2"
      user.password_confirmation = "PASSWORD#2"
      user.save

      expect(user.errors[:password]).to eq(["Must include at least one Lowercase letter"])
    end

    it "requires a digit" do
      user.password = "Password#"
      user.password_confirmation = "Password#"
      user.save

      expect(user.errors[:password]).to eq(["Must include at least one Digit"])
    end

    it "requires a symbol" do
      user.password = "Password2"
      user.password_confirmation = "Password2"
      user.save

      expect(user.errors[:password]).to eq(["Must include at least one Symbol"])
    end
  end
end
