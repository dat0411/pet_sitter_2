class Task < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :deadline, :presence => true

  validates :description, :presence => true

  validates :name, :presence => true

end
