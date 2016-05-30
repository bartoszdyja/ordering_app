require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :username }
  end

  describe 'database columns' do
    it { should have_db_column :email }
    it { should have_db_column :username }
  end

  describe 'associations' do
    it { is_expected.to have_many :meals }
    it { is_expected.to have_many :orders }
  end

  describe 'Oauth authenticate' do
    let(:facebook) { { 'email' => 'abc@pl.pl', 'first_name' => 'John' } }
    before do
      @token = User.from_oauth(facebook)
    end

    it 'assigns name from profile' do
      expect(User.last.username).to eq 'John'
    end

    it 'assigns email from profile' do
      expect(User.last.email).to eq 'abc@pl.pl'
    end

    it 'encode user id to access token' do
      decoded_token = JWT.decode @token, Rails.application.secrets.jwt_secret, true, { :algorithm => 'HS256' }
      expect(decoded_token[0]['id']).to eq User.last.id
    end
  end
end
