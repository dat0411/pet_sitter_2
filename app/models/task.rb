class Task < ApplicationRecord
  # Direct associations

  belongs_to :relationship,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :deadline, :presence => true

  validates :description, :presence => true

  validates :name, :presence => true

end
