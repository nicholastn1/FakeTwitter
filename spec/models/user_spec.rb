require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid" do
    user = User.new(email: "user@user.com", password: "123456")
    expect(user.email).to eql "user@user.com"
    expect(user).to be_valid
  end

  it "is not valid" do
    user = User.new(email: "user@user.com", password: "")
    expect(user).to_not be_valid
  end
end
