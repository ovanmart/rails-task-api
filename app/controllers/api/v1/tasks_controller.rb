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

  def update
    task = current_user.tasks.find(params[:id])

    task.update!(task_params)
    render json: task
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy!

    head :no_content
  end
  
  private

  def task_params
    params.permit(:title, :description, :completed)
  end
end    