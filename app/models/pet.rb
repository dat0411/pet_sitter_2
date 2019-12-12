class Pet < ApplicationRecord
  # Direct associations

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :category, :presence => true

  validates :name, :presence => true

end
