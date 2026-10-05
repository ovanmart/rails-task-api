class Api::V1::TasksController < ApplicationController
    before_action :authenticate_user

     def create
    task = current_user.tasks.create!(
      title: params[:title],
      description: params[:description]
    )

    render json: task, status: :created
  end
end
