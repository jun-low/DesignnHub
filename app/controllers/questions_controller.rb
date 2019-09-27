class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @questions = policy_scope(Question).order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    authorize @question
    @user = @question.user
  end

  def new
  end

  def create
    authorize @question
  end

  def edit
    authorize @question
  end

  def update
    authorize @question
  end

  private

  def question_params
    params.require(:question).permit(:content, :photo)
  end
end
