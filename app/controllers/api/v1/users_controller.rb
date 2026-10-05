class Api::V1::UsersController < ApplicationController
    def create
    user = User.create!(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      role: 0
    )

    render json: {
      id: user.id,
      name: user.name,
      email: user.email
    }, status: :created
  end
end
