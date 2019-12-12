require 'rails_helper'

RSpec.describe Pet, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:category) }

    it { should validate_presence_of(:name) }
      
    end
end
