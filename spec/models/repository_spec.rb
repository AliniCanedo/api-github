require 'rails_helper'

RSpec.describe Repository, type: :model do
  it "is valid with valid attributes" do
    repository = FactoryBot.create(:repository)
    expect(repository).to be_valid
  end
end
