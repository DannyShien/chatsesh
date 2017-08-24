class Post < ApplicationRecord
  validates :body, presence: true

  belongs_to :poster, class_name: "User"
  belongs_to :wall_user, class_name: "User"

  has_many :likes, as: :item, dependent: :destroy
  has_many :comments

  has_many :mentions, dependent: :destroy

  def self.generate_posts(n = 5, user = nil, generate_mentions = true)
    user ||= User.last 
    n.times do
      post = Post.create(
        body: Faker::RickAndMorty.quote,
        wall_user: user,
        poster: User.random_user
      )

      rand(5).times do
        post.comments.create(
          body: Faker::MostInterestingManInTheWorld.quote,
          user: User.random_user
        )
      end

      if generate_mentions
        rand(5).times do
          post.mentions.create(
            user: User.random_user
          )
        end
      end
    end
  end
end
