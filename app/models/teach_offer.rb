class TeachOffer < ApplicationRecord
  belongs_to :user
  belongs_to :demand

  enum status: { pending: 0, approved: 1, unapproved: 2 }
end
