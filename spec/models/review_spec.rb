require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :user }
  it { should belong_to :dinosaur }
  it { should have_many :comments }

  it { should have_valid(:body).when("Review 1", "Review 2") }
  it { should_not have_valid(:body).when(nil, '') }

  it { should have_valid(:rating).when("1", "2", "3", "4", "5") }
  it { should_not have_valid(:rating).when(nil, '', '16', '-5', '1.1') }
end
