class Relationship < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :end_date, :presence => true

  validates :start_date, :presence => true

end
