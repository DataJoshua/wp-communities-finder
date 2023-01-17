module Users
  class GenerateToken
    include Interactor

    delegate :credentials, to: :context

    def call
      context.fail!(error: [{message: "wrong credentials"}]) unless user_authenticated?

      context.authentication_token = authentication_token

    end

    private

    def authentication_token
      JWT.encode(payload, jwt_secret, "HS256")
    end

    def jwt_secret
      ENV.fetch("JWT_SECRET")
    end

    def payload
      {
        sub: user.id,
        exp: (Time.now + 2.hours).to_i
      }
    end

    def user
      @user ||= User.find_by(email: credentials[:email])
    end

    def user_authenticated?
      user&.authenticate(credentials[:password])
    end

  end
end
