require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to :review }
  it { should belong_to :user }

  it { should have_valid(:body).when("Comment", "Another comment") }
  it { should_not have_valid(:body).when(nil, '') }
end
