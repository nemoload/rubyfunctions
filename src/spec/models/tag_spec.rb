require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { create :tag }

  it { is_expected.to have_and_belong_to_many :functions }
end
