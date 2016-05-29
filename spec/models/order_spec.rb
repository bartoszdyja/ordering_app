require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:meals) }
	it { should have_many(:users) }

	describe 'validattions' do
	  it { should validate_presence_of(:name) }
	  it { should validate_presence_of(:status) }
  end

  it 'should initialize as active' do
     order = FactoryGirl.create(:order)
     expect(order.status).to eq 'active'
   end
end
