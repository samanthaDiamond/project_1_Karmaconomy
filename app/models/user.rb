# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :text
#  username   :text
#  postcode   :integer
#  biography  :text
#  image      :text
#  karma      :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :orders
  has_many :deeds, through: :orders
end
