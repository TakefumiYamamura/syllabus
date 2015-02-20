class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]
  validates :username, presence: true, uniqueness: true #what is the meaning in here?

  has_many :sikepuris

  def self.create_with_omniauth(auth)
    # binding.pry
    # create! do |user|
    #   user.provider = auth["provider"]
    #   user.uid = auth["uid"]
    #   user.name = auth["info"]["name"]
    #   user.screen_name = auth["info"]["nickname"]
    #   user.nickname = auth["info"]["name"]
    #   # user.email = twitter
    # end
    User.create(provider: auth["provider"],
                uid: auth["uid"],
                name: auth["info"]["name"],
                username: auth["info"]["name"],
                nickname: auth["info"]["name"],
                screen_name: auth["info"]["nickname"],
                email: User.create_unique_email,
                password: Devise.friendly_token[0,20]
                )
    binding.pry


  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end
end
