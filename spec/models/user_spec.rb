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
end
