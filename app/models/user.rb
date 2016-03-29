# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  username        :text
#  postcode        :integer
#  biography       :text
#  image           :text
#  karma           :integer
#  created_at      :datetime
#  updated_at      :datetime
#  email           :text
#  password_digest :string
#  admin           :boolean          default("false")
#

class User < ActiveRecord::Base
  has_many :orders
  has_many :deeds, through: :orders

  validates :name, presence: true, length: { minimum: 4 }

  validates :username, presence: true, length: { maximum: 30}, :uniqueness => true

  validates :postcode, presence: true, length: { is: 4 }

  validates :biography, presence: true, length: { maximum: 500 }

  validates :karma, presence: true

  # validates :image   ???

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

end
