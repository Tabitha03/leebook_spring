class PostController <ApplicationController
before_action :set_post, only: [:update, :edit, :destroy]

def create
	@post = current_user.posts.new(post_params)
if @post.save
	@post.create_activity key: 'post.created',owner: @post.user
	respond_to do |format|
		format.html {redirect_to user_path(@post.user.username), notice: "Post Created"}

end
else
	redirect_to user_path(@post.user.username), notice: "Something went wrong."

def edit

end

def update
	if @post.update(post_params)@post.user.username),notice: "{post updated."}

end
else
	redirect_to user_path@post.user.username), notice: "Something went wrong."
	end
end

def destroy
	@post.destroy
	respond_to do |format| 
		format.html {redirect_to user_path(@posts.user.username),notice: "Post Deleted."}
	end
end

private

def set_post
	@post = Post.find(params[:id])

end

def post_params
	params.require(:post).permit(:content)

	end

end