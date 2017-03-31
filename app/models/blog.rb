# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  title       :text(65535)
#  body        :text(65535)
#  delete_flag :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#

class Blog < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  attr_accessor :delete_flag_check
  
  has_one :work
  accepts_nested_attributes_for :work
end
