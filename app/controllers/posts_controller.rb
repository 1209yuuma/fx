class PostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :new]

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "投稿に成功しました。"
            redirect_to user_path(current_user)
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def destroy
    end

    def show
        @post = Post.find(params[:id])
    end

    private

  def post_params
    params.require(:post).permit(:date, :alphanumeric, :risk_reward, :content)
  end
end
