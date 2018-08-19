class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  after_create :send_favorite_emails

  validates :user, presence: true
  validates :body, length: { minimum: 5 }, presence: true

  private

  def send_favorite_emails
    post.favorites.each do |favorite|
      FavoriteMailer.new_comment(favorite.user, post, self).deliver
    end
  end
end
