class Movie
  attr_accessor :title, :release_date, :director, :summary
  def initialize (title, release_date, director, summary)
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary
    @@movies << self
  end

  @@movies = []

  @@unsafe_char = {"$" => "24", "&" => "26", "+" => "2B", "," => "2C", "/" => "2F",
    "'" => "27", ":" => "3A", ";" => "3B", "=" => "3D", "?" => "3F", "@" => "40", "<" => "3C",
    ">" => "3E", "#" => "23", "%" => "25", "{" => "7B", "}" => "7D", "|" => "7C",
    "\\" => "5C", "^" => "5E", "~" => "7E", "[" => "5B", "]" =>"5D", "`" => "60" }

  def replace_unsafe_char(str)
    new_str = ""
    str.each_char do|ch| unless @@unsafe_char.keys.include?(ch)
    new_str << ch
     end
    end
   new_str

  end

  def url
    replace_unsafe_char(self.title.downcase.gsub(" ", "_")) + ".html"
  end

  def self.all
    @@movies
  end

  def self.reset_movies!
    @@movies.clear
  end

  def self.make_movies!
    file = File.open("./spec/fixtures/movies.txt", "r")
    file.each_line do|line| 
     movie_arr = line.split(" - ")
     movie_arr[1] = movie_arr[1].to_i
     movie = Movie.new(*movie_arr)
    end
    file.close
  end

  def self.recent
    @@movies.select {|movie| movie.release_date >= 2012}
  end

end

