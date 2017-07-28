class Api::V1::LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @links = Link.all
    render json: @links
  end

  def create
    @link = Link.find_or_initialize_by(link_params)
    if @link.new_record?
      @link.total_reads = 1
      @link.save
      render json: @link
    else
      @link.total_reads += 1
      @link.save
      render json: @link
    end
  end

  private

  def link_params
    params.permit(:url)
  end
end
