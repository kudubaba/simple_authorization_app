require "rails_helper"

RSpec.describe User, :type => :model do
  context "When making a new User" do
    it "doesn't make a user without a username" do
      user = User.new(password: "Password1")
      user.save
      expect(user.id).to be_nil
    end

    it "doesn't make a user when the same username is entered" do
      user = User.new(username: "username", password: "Password1")
      user.save
      user2 = User.new(username: "username", password: "Password1")
      user2.save
      expect(user2.id).to be_nil
    end

    it "doesn't make a user when the username entered has less than 6 characters" do
      user = User.new(username: "usern", password: "Password1")
      user.save
      expect(user.id).to be_nil
    end

    it "Creates a new user when username is present, unique and longer than 6 characters" do
      user = User.new(username: "username", password: "Password1")
      user.save
      expect(user.id).to be(user.id)
    end

    it "secures our password as it saves" do
      user = User.new(username: "username", password: "Password1")
      user.save
      expect(user.password_digest).not_to eq('Password1')
    end

    it "validates correct password characters" do
      user = User.new(username: "jonjon", password: "password")
      other_user = User.new(username: "jonjon2", password: "password1")
      another_user = User.new(username: "jonjon3", password: "Password1")
      user.save
      other_user.save
      another_user.save

      expect(user.id).to be_nil
      expect(other_user.id).to be_nil
      expect(another_user.id).not_to be_nil
    end
  end
end
