require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it "is working to user follow another user" do
    matt = FactoryBot.create(:user)
    bob = FactoryBot.create(:user)

    Subscription.create(followed: bob, followed_by: matt)

    # Matt is following Bob
    expect(bob.followers.count).to eql 1
    expect(bob.followers).to include matt

    # Bob is being followed by Matt
    expect(matt.following.count).to eql 1
    expect(matt.following).to include bob

    # Bob is following nobody
    expect(bob.following.count).to eql 0
    expect(bob.following).to_not include matt

    # Matt has no followers
    expect(matt.followers.count).to eql 0
    expect(matt.followers).to_not include bob

    paul = FactoryBot.create(:user)

    Subscription.create(followed: bob, followed_by: paul)

    expect(bob.followers.count).to eql 2
    expect(bob.followers).to include paul

    expect(paul.following.count).to eql 1
    expect(paul.following).to include bob
  end
end
