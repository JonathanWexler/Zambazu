class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  has_many :authentications, :dependent =&gt; :delete_all

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.name = auth.info.name
  		user.oauth_token = auth.credentials.token
  		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  		user.save!
  	end
  end
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid
  validates_uniqueness_of :email

  def apply_omniauth(auth)
    # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.email = auth['extra']['raw_info']['email']
    # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
    authentications.build(:provider =&gt; auth['provider'], :uid =&gt; auth['uid'], :token =&gt; auth['credentials']['token'])
  end
end 
