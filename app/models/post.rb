class Post < ApplicationRecord
  before_action :require_login, only: [:new, :create]

  validates :body, presence: true

  belongs_to :user

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to index_post_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def require_login
    redirect_to login_path unless user_signed_in?
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
