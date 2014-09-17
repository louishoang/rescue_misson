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
    @answers = Answer.order(updated_at: :desc)
    @answer = Answer.new
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end

class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = "New answer added successfully."
      redirect_to @question
    else
      render @question
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end
end

