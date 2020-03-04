class VisitedPagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @round_participation = RoundParticipation.find(params[:round_participation_id])
    @visited_page = VisitedPage.new(visited_page_params)
    @visited_page.round_participation = @round_participation
    @visited_page.save
  end

  private

  def visited_page_params
    params.require(:visited_page).permit(:title, :url)
  end
end
