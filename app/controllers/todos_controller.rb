class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all

    json_response(@todos)
  end


  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  def show
    json_response(@todo)
  end


  def update
    @todo.update(todo_params)

    head :no_content
  end

  def destroy
    @todo.destroy

    head :no_content
  end

  private

  # whitelist params
  def todo_params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
