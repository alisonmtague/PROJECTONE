class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :venues
end