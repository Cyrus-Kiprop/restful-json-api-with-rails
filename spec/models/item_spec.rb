require 'rails_helper'

RSpec.describe Item, type: :model do
  # Association test

  # Ensure that the item record belongs to a single todo record

  it { should belong_to(:todo) }

  # Validation test

  # Ensure that the column name is present before saving
  it { should validate_presence_of(:name) }
end
