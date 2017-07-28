class Api::V1::LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @link = Link.find_by_url(link_params)
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
