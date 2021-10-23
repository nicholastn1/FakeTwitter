class PostsController < ApplicationController

  def index
  end

  def create
    f_params = form_params.merge(user: current_user)
    @post = Post.new(f_params)

    if @post.save
      redirect_to user_profile_path
    else
      render "user/profile/show"
    end
  end

  private

  def form_params
    params.require(:post).permit(:post_text)
  end
end
