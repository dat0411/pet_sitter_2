class Relationship < ApplicationRecord
  # Direct associations

  has_many   :reports,
             :dependent => :destroy

  has_many   :tasks,
             :dependent => :destroy

  belongs_to :sitter,
             :class_name => "User",
             :counter_cache => :sitter_stat_count

  belongs_to :home_owner,
             :class_name => "User",
             :counter_cache => :home_owner_stat_count

  # Indirect associations

  # Validations

  validates :end_date, :presence => true

  validates :start_date, :presence => true

end
