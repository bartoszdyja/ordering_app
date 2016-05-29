require 'rails_helper'

RSpec.describe Meal do
  it { should belong_to :user }
	it { should belong_to :order }

	describe 'validations' do
	  it { should validate_presence_of(:name) }
	  it { should validate_presence_of(:price) }
	  it { should validate_presence_of(:user_id) }
	  it { should validate_presence_of(:order_id) }
  end
end
