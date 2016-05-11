class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
  	case params[:people]
    when "friends"
      @users = current_user.active_friends
    when "requested"
      @users = current_user.pending_friend_request_from
    when "pending"
      @users = current_user.pending_friend_request_to
    else
      @user = User.where.not(id: current_user.id)
    end

  end

  def show
    @post = Post.new
    @posts = @user.post.order('created_at DESC')
    @activities = PublicActivity::Activity.where(owner:)

  end

  private

  def set_user
  	@user = User.find_by(username: params[:id])
  end
end
