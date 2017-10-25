# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  STATUS = %w(PENDING APPROVED DENIED)

  validates :cat_id, :start_date, :end_date, presence: true
  validates :color, inclusion: { in: STATUS, message: "%{value} is not a valid status" }

  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :Cat

end
