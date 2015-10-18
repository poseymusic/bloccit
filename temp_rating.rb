#you tube
#Integrating a Dropdown Element into a Rails Form

#app/models/rating.rb
class Rating < ActiveRecord::Base
    has_many :ratingables
    belongs_to :rateable, polymorphic: true
    has_many :topics, through: :ratingables, source: :rateable, source_type: :Topic
    has_many :posts,  through: :ratingables, source: :rateable, source_type: :Post

    before_save { self.sevefity ||= :PG }
    enum severity: [ :PG, :PG13, :R ]

    def self.update_rating(rating_idx)
      severity = rating_idx
    end
end
#app/models/ratingable.rb
class Rateable < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
  belongs_to :rating
end
#app/models/post.rb
class Post < ActiveRecord::Base
#
  has_many :ratingables, as: :rateable
  has_many :ratings, through: :rateables
#app/models/topic.rb
class Topic < ActiveRecord::Base
#
  has_many :ratingables, as: :rateable
  has_many :ratings, through: :rateables
#
#app/views/post/_form.html.erb
<div class="form-group">
  <%#= render partial: 'ratings/form', locals: { f: f, topic: @topic, ratings: @post.ratings } %>
  <%#= f.select :rating, ['Title 1', 'Another Title', 'more titles'] %>
</div>
#app/views/topic/_form.html.erb
<div class="form-group">
  <%#= render partial: 'ratings/form', locals: { f: f, topic: @topic, ratings: @post.ratings } %>
  <%#= f.select :rating, ['Title 1', 'Another Title', 'more titles'] %>
</div>
