class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  def most_reads

  end
end
