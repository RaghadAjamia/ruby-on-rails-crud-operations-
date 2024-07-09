require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:power_banks).as(:locatable) }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      user = User.new(email: "test@example.com", password: "password")
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      user = User.new(email: nil, password: "password")
      expect(user).not_to be_valid
    end

    it "is not valid without a password" do
      user = User.new(email: "test@example.com", password: nil)
      expect(user).not_to be_valid
    end

    it "is not valid with an invalid email" do
      user = User.new(email: "invalid_email", password: "password")
      expect(user).not_to be_valid
    end
  end

  describe "Devise modules" do
    it "responds to database_authenticatable" do
      expect(User.new).to respond_to(:email)
    end

    it "responds to registerable" do
      expect(User.new).to respond_to(:password)
    end

    it "responds to recoverable" do
      expect(User.new).to respond_to(:reset_password_token)
    end

    it "responds to rememberable" do
      expect(User.new).to respond_to(:remember_created_at)
    end

    it "responds to validatable" do
      expect(User.new).to respond_to(:valid_password?)
    end
  end
end
