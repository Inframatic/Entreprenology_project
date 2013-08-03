class Account < ActiveRecord::Base
  # ------------------------attr_accessor :password
  belongs_to :logable, polymorphic: true, :dependent => :destroy
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :industry, :city, :country, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email


  def self.authenticate(email, password)
    account = find_by_email(email)
    if account && account.password_hash == BCrypt::Engine.hash_secret(password, password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate.password_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end