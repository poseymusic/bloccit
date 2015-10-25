module RatingsHelper
  def ratings_to_buttons(ratings)
    raw ratings.map { |r| link_to r.severity, rating_path(id: r.id), class: 'btn-xs btn-primary' }.join(" ")
#    raw labels.map  { |l| link_to l.name,     label_path(id: l.id),  class: 'btn-xs btn-primary' }.join(' ')
  end
end
