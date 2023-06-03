require('rails_helper')

describe Users::Create do

    let(:expected_order) { [Users::Save] }

    it "organizes" do
      expect(described_class.organized).to eq(expected_order)
    end


end
