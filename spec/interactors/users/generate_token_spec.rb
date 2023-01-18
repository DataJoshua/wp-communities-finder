require("rails_helper")

describe Users::GenerateToken do
  let(:interactor) { described_class.call(credentials: credentials) }
  let!(:user) { FactoryBot.create(:user) }


  context "correct credentials" do
    let(:credentials) { { email: "Elloypito@gmail.com", password: "123" } }

    it "should generate token" do
      interactor.run
      expect(interactor.authentication_token).to be_present
    end
  end

  context "incorrect credentials" do
    let(:credentials) { { email: "error@gmail.com", password: "false" } }

    it "should not generate token" do
      interactor.run
      expect(interactor.authentication_token).to be_blank
    end

  end
end
