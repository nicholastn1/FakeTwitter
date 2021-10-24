class User::SubscriptionsController < ApplicationController
  def follow
    follow = User.find_by(id: params[:id])
    Subscription.create(followed_by: current_user, followed: follow)
    redirect_to user_can_follow_path
  end

  def unfollow
    user = User.find_by(id: params[:id])

    subscription = Subscription.find_by(followed_by: current_user, followed: user)
    subscription.destroy

    redirect_to user_following_path
  end
end