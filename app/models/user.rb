class User < ApplicationRecord
  validates :email, presence: true
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_secure_password

  def image_ur_or_default
    image_url.presence || "http://lorempixel.com/400/200/people/"
  end

  def self.generate_users(n = 5, gender = "female")
    url = "https://randomuser.me/api?results=#{n}&gender=#{gender}"
    body = HTTP.get(url).parse
    body["results"].each do |person|
      hash = {}
      hash[:name] = person["name"]["first"] + " " + person["name"]["last"]
      hash[:email] = person["email"]
      hash[:password] = person["login"]["password"]
      hash[:image_url] = person["picture"]["large"]
      User.create! hash
    end
  end


  def add_friend(another)
    if !is_friend?(another)
      friends << another
    end
  end

  def is_friend?(another)
    friendship.find_by(friend_id: another.id)
  end
end
