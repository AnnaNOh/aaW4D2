# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = %w(brown black orange gray)
  GENDERS = %w(M F)

  validates :color, inclusion: { in: COLORS,
    message: "%{value} is not a valid color" }
  validates :sex, inclusion: { in: GENDERS,
    message: "%{value} is not a valid gender"}

    has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
    
  def age
    # Date.year - self[birth_date].year
    time_ago_in_words(birth_date)
  end

end
