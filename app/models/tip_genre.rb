# == Schema Information
#
# Table name: tip_genres
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#

class TipGenre < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  has_many :tips
end
