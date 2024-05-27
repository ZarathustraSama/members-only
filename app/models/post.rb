class Post < ApplicationRecord
  before_action :require_login, only: [:new, :create]

  validates :body, presence: true

  belongs_to :user

  private

  def require_login
    redirect_to login_path unless current_user.logged_in?
  end
end
