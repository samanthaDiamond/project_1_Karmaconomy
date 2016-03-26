# == Schema Information
#
# Table name: deeds
#
#  id          :integer          not null, primary key
#  title       :text
#  description :text
#  date        :text
#  image       :text
#  deed_type   :text
#  postcode    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  karma       :integer
#

class Deed < ActiveRecord::Base
  has_one :order
  has_one :user, through: :order

  validates :title, presence: true, length: { maximum: 50 }

  validates :postcode, presence: true, length: { is: 4 }



end
