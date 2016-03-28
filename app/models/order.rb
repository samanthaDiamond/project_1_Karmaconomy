# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  deed_id    :integer
#  karma      :integer
#  created_at :datetime
#  updated_at :datetime
#  accept_id  :integer
#  complete   :boolean
#

class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :deed
end
