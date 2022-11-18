names = %w[Amazing-Movies Terrible Movies Meh-Movies BestoftheBest]
inst_m = []
inst_l = []
puts(Rails.application.credentials.dig(:key))
names.each do |n|
  inst_l << List.create(name: n)
end
res = RestClient.get "https://api.themoviedb.org/3/movie/top_rated?api_key=#{Rails.application.credentials[:key]}&language=en-US&page=1"
movies = JSON.parse(res)
movies = movies["results"]

movies.each do |m|
  inst_m << Movie.create(title: m["title"], poster_url: "https://image.tmdb.org/t/p/original/#{m["poster_path"]}", rating: m["vote_average"], overview: m["overview"])
end

n = 0
5.times do
  b = Bookmark.new(comment: "Wooww")
  b.movie = inst_m[n]
  b.list = inst_l[n]
  b.save
  n += 1
end
puts 'end'
