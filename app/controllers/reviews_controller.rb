class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_skill
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def edit
    
  end
  def show
    @review = Review.find(params[:id])
  end
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.skill_id = @skill.id

    if @review.save
      redirect_to @skill
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_skill
      @skill = Skill.find(params[:skill_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end