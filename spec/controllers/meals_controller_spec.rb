require 'rails_helper'

describe Api::MealsController, :type => :controller do
  let(:user) { FactoryGirl.create :user }
  let(:order) { FactoryGirl.create :order }
  let(:meal) { FactoryGirl.create :meal }

  context 'user is not logged in' do
    before do
      controller.stub(:current_user).and_return(nil)
    end

    describe 'GET new' do
      it 'restrict unauthorized users creating items' do
        get :create
        expect(response.status).to eq(401)
      end
    end
  end
end
