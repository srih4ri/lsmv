#!/usr/bin/env ruby
require 'rubygems'
require 'imdb'
require './movie_name'

dir = ARGV[0] || '.'
dirs = Dir["#{dir}/*"].map{|d| File.basename(d)}
dirs.each do |dir|
  mvname = MovieName.new(dir).cleanup
  puts "#{dir} -> #{mvname}"
  search = Imdb::Search.new(mvname)
  puts "Processing #{mvname}"
  movie = search.movies[0]
  if movie
    puts movie.title
    puts "\n"
    puts [movie.rating,movie.plot,movie.id, movie.title].join(" - ")
    puts "\n"
  else
    puts "#{mvname} not found"
  end
  puts "-"*50
end
