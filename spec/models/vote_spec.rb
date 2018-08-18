require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        bad_v = Vote.new(value:2)
        expect(bad_v.valid?).to eq(false)
      end
    end
  end
end
