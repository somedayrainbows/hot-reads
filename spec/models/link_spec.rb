require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "validations" do
    context "link is valid with all attributes" do
      it { should validate_presence_of(:url) }
    end
  end
end
