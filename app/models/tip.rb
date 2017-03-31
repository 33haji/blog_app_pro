# == Schema Information
#
# Table name: tips
#
#  id          :integer          not null, primary key
#  title       :text(65535)
#  detail      :text(65535)
#  delete_flag :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  genre_id    :integer          default(0), not null
#

class Tip < ActiveRecord::Base
  belongs_to :tip_genre, foreign_key: "genre_id"
end
