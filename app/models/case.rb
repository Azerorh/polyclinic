class Case < ApplicationRecord
  belongs_to :doctor, validate: true
  belongs_to :user

  validate :validate_cases

  def validate_cases
    errors.add(:case, 'Too much open cases for a doctor') if doctor.cases.where(status: true).count > 10
  end
end
