class User::ProfileController < ApplicationController
  def show
    @post = Post.new
  end

  def can_follow
    @can_follow = User.where.not(id: current_user.following.pluck(:id)).where.not(id: current_user.id)
  end

  def following
    @following = current_user.following
  end

  def followers
    @followers = current_user.followers
  end
end