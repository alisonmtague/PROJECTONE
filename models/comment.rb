class Comment < ActiveRecord::Base
  validates_presence_of :post
  belongs_to :post
end