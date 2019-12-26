class Demand < ApplicationRecord
  belongs_to :user
  has_many :teach_offers

  validates :subject, :level, :fee, presence: true, length: {maximum: 50}
  validates :note, presence: true, length: {maximum: 200}
  validates :amount_student, :time_per_session, numericality: true
  enum status: {notfound: 0, found: 1}
  enum status_admin: {pending: 0, approved: 1, unapproved: 2}
end
