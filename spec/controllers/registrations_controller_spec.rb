require 'rails_helper'


RSpec.describe "RegistrationsController", type: :request do
  describe "Post #create" do
    it "creates a user" do
      expect {
        post sign_up_url, params: { email: "test@test.com", password: "Password#2" }
      }.to change(User, :count).by(1)
    end
  end

  describe "Post #password_validation" do
    it "requires a symbol" do
      post password_validation_url, as: :turbo_stream, params: { email: "test@test.com", password: "Password1" }

      expect(response.body).to include("Must include at least one Symbol")
    end
    it "requires a upper" do
      post password_validation_url, as: :turbo_stream, params: { email: "test@test.com", password: "password#2" }

      expect(response.body).to include("Must include at least one Uppercase")
    end
    it "requires a lower" do
      post password_validation_url, as: :turbo_stream, params: { email: "test@test.com", password: "PASSWORD#2" }

      expect(response.body).to include("Must include at least one Lowercase")
    end
    it "requires a digit" do
      post password_validation_url, as: :turbo_stream, params: { email: "test@test.com", password: "Password#" }

      expect(response.body).to include("Must include at least one Digit")
    end

    it "requires a 8 length " do
      post password_validation_url, as: :turbo_stream, params: { email: "test@test.com", password: "Passwor" }

      expect(response.body).to include("minimum is 8 characters")
    end
  end
end
