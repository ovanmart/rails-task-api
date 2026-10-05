class ApplicationController < ActionController::API
  private

  def authenticate_user
    header = request.headers["Authorization"]

    if header.blank?
      return render json: { error: "Missing authorization header" }, status: :unauthorized
    end

    token = header.split(" ").last

    begin
      decoded = JWT.decode(
        token,
        Rails.application.secret_key_base,
        true,
        algorithm: "HS256"
      )

      @current_user = User.find(decoded[0]["user_id"])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      render json: { error: "Invalid or expired token" }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end
