class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  after_create :send_favorite_emails

  validates :user, presence: true
  validates :body, length: { minimum: 5 }, presence: true

  default_scope { order('updated_at') }

  private

  def send_favorite_emails
    post.favorites.each do |favorite|
      if should_receive_update_for?(favorite)
        FavoriteMailer.new_comment(favorite.user, self.post, self).deliver
      end
    end
  end

  def should_receive_update_for?(favorite)
    user_id != favorite.user_id && favorite.user.email_favorites?
  end
end
