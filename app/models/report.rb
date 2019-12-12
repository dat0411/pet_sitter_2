class Report < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :relationship,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
