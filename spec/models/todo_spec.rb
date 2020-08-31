require 'rails_helper'

RSpec.describe Todo, type: :model do

  # ensure that the relationship is a one-to-many rlship with the Item model
  it { should have_many(:items).dpendent(:destroy) }

  # Validation test
  # Ensure that the title and created_by columns are created are present before
  # saving
  it { should validate_presence_of(:titler) }
  it { should validate_presence_of(:created_by) }
end
