require 'rails_helper'

RSpec.describe Car, type: :model do
  context 'validations tests' do
    let!(:car) { create(:car) }

    describe '#name' do
      it { should validate_length_of(:model).is_at_least(3) }  
      it { should validate_length_of(:model).is_at_most(40) } 
    end


    describe '#name' do
      it { should validate_length_of(:color).is_at_least(3) } 
      it { should validate_length_of(:color).is_at_most(40) }
    end

    describe '#name' do
      it { should validate_presence_of(:destination) }
    end
  end
end