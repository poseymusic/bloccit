class Rateling < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
  belongs_to :rating
end
