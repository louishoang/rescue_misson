require 'pry'
class QuestionsController < ApplicationController
  # GET /questions
  def index
    @questions = Question.all
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
      flash[:notice] = "please check input"
      if @question.errors[:title]
        flash[:notice] = "Title " + @question.errors[:title][0]
      elsif @question.errors[:description]
        flash[:notice] = "Description" + @question.errors[:description][0]
      end

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
