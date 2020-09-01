require 'rails_helper'

RSpec.describe User, type: :model do
  # Association Test
  # Ensure User model has a 1:m relationship with the Todo model
  #
  it { should have_many(:todos) }

  # Validation  tests
  #
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
