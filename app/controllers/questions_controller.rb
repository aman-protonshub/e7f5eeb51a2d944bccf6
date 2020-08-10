class QuestionsController < ApplicationController
  def index
    @questions = current_user.questions
  end
  def show
    @question = Question.find_by_id(params[:id])
    @answers = @question.answers
  end
end
