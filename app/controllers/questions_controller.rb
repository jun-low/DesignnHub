class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @questions = policy_scope(Question).joins(:question_tags).where(question_tags: { name: params[:query] })
    else
      @questions = policy_scope(Question).order(created_at: :desc)
    end
    @question_tags = QuestionTag.all
    @portfolios = Portfolio.all
  end

  def show
    @question = Question.find(params[:id])
    authorize @question
    @user = @question.user
    @answer = Answer.new
    query = @question.question_tag_ids
    @related_questions = policy_scope(Question).joins(:question_tags).where(question_tags: { id: query })
  end

  def new
    @question = Question.new
    @portfolio = Portfolio.new
    authorize @question
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    authorize @question
    respond_to do |format|
      if @question.save
        format.html { redirect_to profile_path(current_user), notice: 'Question was successfully posted.' }
        format.js
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    authorize @question
  end

  def update
    authorize @question
  end

  private

  def question_params
    params.require(:question).permit(:content, :photo, question_tags_attributes: [:id, :name])
  end
end
