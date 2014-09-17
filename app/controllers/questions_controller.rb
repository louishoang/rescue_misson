require 'pry'
class QuestionsController < ApplicationController
  # GET /questions
  def index
    @questions = Question.order(created_at: :desc)
    render "questions/index"
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "New question added successfully."
      redirect_to @question
    else
      render action: 'new'
    end
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
