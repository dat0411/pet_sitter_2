class User < ApplicationRecord
  # Direct associations

  has_many   :sitter_stat,
             :class_name => "Relationship",
             :foreign_key => "sitter_id",
             :dependent => :destroy

  has_many   :home_owner_stat,
             :class_name => "Relationship",
             :foreign_key => "home_owner_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
