require 'rails_helper'

RSpec.describe Dinosaur, type: :model do
  it { should have_many :reviews }
  it { should belong_to :user }

  it { should have_valid(:name).when("Dinosaur", "Another dinosaur") }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:location_found).when("35 Bob Street", "67 State St.") }
  it { should_not have_valid(:location_found).when(nil, '') }

  it { should have_valid(:info_url).when("www.dinos.com", "www.wikipedia.com") }
  it { should_not have_valid(:info_url).when(nil, '') }
end
