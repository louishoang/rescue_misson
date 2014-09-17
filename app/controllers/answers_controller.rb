class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)

    if @answer.save
      flash[:notice] = "New answer added successfully."
      redirect_to question_path(@question)
    else
      @answers = @question.answers
      binding.pry
      render 'questions/show'
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end
end
