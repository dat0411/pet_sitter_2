require 'rails_helper'

RSpec.describe Relationship, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:end_date) }

    it { should validate_presence_of(:start_date) }
      
    end
end