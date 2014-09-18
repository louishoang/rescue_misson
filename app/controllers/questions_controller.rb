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
    @answer = Answer.new
    @answers = Answer.order(updated_at: :desc)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
  @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    binding.pry
    @question.destroy
    redirect_to "questions/index"
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
