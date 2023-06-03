module Users
  class Save
    include Interactor

    delegate :user_params, to: :context

    def call
      context.user = user

      context.fail!(error: "Invalid") unless user.save
    end

    private

    def user
      @user = User.new(user_params)
    end

  end
end
