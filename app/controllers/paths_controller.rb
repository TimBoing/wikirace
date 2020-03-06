class PathsController < ApplicationController

  def show
    start_page = WikiPage.find(params[:start_page].to_i) if !params[:start_page].blank?
    end_page = WikiPage.find(params[:end_page].to_i) if !params[:end_page].blank?
    if start_page && end_page
      @path = Path.find_by(start_page: start_page, end_page: end_page)
      if !@path.blank?
        render json: {min_click: @path.points.count - 1} and return
      end
      render json: {min_click: ""} and return
    else
      render json: {min_click: ""} and return
    end
  end
end
