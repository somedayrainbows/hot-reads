class LinksController < ApplicationController

  def index
    @links = Link.all.order(total_reads: :desc).limit(10)
  end
end
