require("rails_helper")

describe Users::Save do
  let(:interactor) { described_class.call(user_params: user_params) }

  context "Correct params" do
    let(:user_params) do
      {
        first_name: "ecample",
        nickname: "nick",
        password: "123",
        email: "sample@gmail.com"
      }
    end

    it "creates a new project" do
      expect{ interactor.run }.to change(User, :count).by(1)
    end

  end

end
