class Rating < ActiveRecord::Base
    has_many :ratelings
    belongs_to :rateable, polymorphic: true
    has_many :topics, through: :ratelings, source: :rateable, source_type: :Topic
    has_many :posts,  through: :ratelings, source: :rateable, source_type: :Post

    before_save { self.severity ||= :PG }
    enum severity: [ :PG, :PG13, :R ]

    def self.update_ratings(rating_idx)
      if rating_idx == 0
        severity = 0
      end
    #    unless rating_idx == 0
    #      severity = rating_idx
    #    end
    end
end
