class Pet < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :category, :presence => true

  validates :name, :presence => true

end
