require 'rails_helper'

RSpec.describe Report, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:relationship) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:name) }
      
    end
end
