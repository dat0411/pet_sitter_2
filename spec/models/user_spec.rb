require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:pets) }

    it { should have_many(:sitter_stat) }

    it { should have_many(:home_owner_stat) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:first_name) }

    it { should validate_presence_of(:last_name) }
      
    end
end
