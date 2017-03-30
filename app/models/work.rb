# == Schema Information
#
# Table name: works
#
#  id            :integer          not null, primary key
#  required_time :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  blog_id       :integer          default(0), not null
#

class Work < ActiveRecord::Base
  belongs_to :blog, foreign_key: :blog_id
  
  attr_accessor :required_time_form, :condition
end
