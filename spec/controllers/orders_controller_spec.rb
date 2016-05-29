require 'rails_helper'

describe Api::OrdersController, :type => :controller do
  let(:user) { FactoryGirl.create :user }
  let(:order) { FactoryGirl.create :order }
  context 'user is not logged in' do
    before do
      controller.stub(:current_user).and_return(nil)
    end

    describe 'PUT update' do
      it 'restrict unauthorized users updating orders' do
        put :update, id: order.id
        expect(response.status).to eq(401)
      end
    end

    describe 'GET show' do
      it 'allow unauthorized users showing orders' do
        get :show, id: order.id
        expect(order.name).to eq 'order_1'
      end
    end

    describe 'GET index' do
      it 'restrict unauthorized users showing orders' do
        get :index
        expect(response.status).to eq(401)
      end
    end
  end

  context 'user is logged in' do
    before do
      controller.stub(:current_user).and_return(user)
    end

    it 'retrieves a specific message' do
      order = FactoryGirl.create(:order)
      get :show, id: order.id
      json = JSON.parse(response.body)
      expect(response).to be_success

      expect(json['status']).to eq('active')

      # ensure that private attributes aren't serialized
      expect(json['private_attr']).to eq(nil)
  	end

    it 'checks if correct data is returned' do
      FactoryGirl.create(:order)
      get 'index'
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.last.length).to eq(5)
    end


  describe 'PUT update' do
    it 'restrict finalizing empty orders' do
      put :update, {id: order.id, status: 'delivered'}
      expect(response.status).to eq(200)
    end
  end

  describe 'GET show' do
    it 'allow authorized users showing orders' do
      get :show, id: order.id
      expect(response.status).to eq(200)
    end
  end

  describe 'GET index' do
    it 'allow authorized users showing orders' do
      get :index
      expect(response.status).to eq(200)
    end
  end
  end
end
