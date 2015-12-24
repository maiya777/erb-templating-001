class SiteGenerator

 def make_index!
  File.open('./_site/index.html', 'w') do |f|
  f.puts"<!DOCTYPE html><html><head><title>Movies</title></head><body><ul>"
  Movie.all.each do |m|
    f.puts'<li><a href="movies/'+"#{m.url}"+'">'+"#{m.title}</a></li>"
   end
  f.puts"</ul></body></html>"
  f.close
  end
 end

 def generate_pages!

  Dir.mkdir ("./_site/movies") unless File.exists?("./_site/movies")
  template = ERB.new (File.read('./lib/templates/movie.html.erb'))
  Movie.all.each do |m|
    File.open("./_site/movies/#{m.url}", "w") do |f|
    
    f.puts template.result(binding)
    f.close
   end
  end
 end

end