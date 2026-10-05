class Api::V1::TasksController < ApplicationController
    before_action :authenticate_user

    def index
  tasks = current_user.tasks
  render json: tasks
end

     def create
    task = current_user.tasks.create!(
      title: params[:title],
      description: params[:description]
    )

    render json: task, status: :created
  end
end
