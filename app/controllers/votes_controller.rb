class VotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @vote = Vote.find_or_initialize_by(user: current_user, review: @review)
    @vote.value = params[:value]
    @vote.save
    render json: @review.tally
  end

  private

  def vote_params
    params.require(:vote).permit(:value).merge(
      user_id: current_user.id,
      review_id: params[:review_id]
      )
  end
end
