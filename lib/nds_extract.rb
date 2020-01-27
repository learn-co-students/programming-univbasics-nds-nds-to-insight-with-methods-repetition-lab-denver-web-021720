$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  # Write this implementation
  directors_list = []
  index = 0 
  
  while index < source.size do 
    directors_list << source[index][:name]
    index += 1 
  end
  directors_list
end

def total_gross(source)
  directors_earnings_hash = directors_totals(source)
  directors_names = list_of_directors(source)
  index = 0 
  total = 0 
  
  while index < directors_names.size do 
    director_name = directors_names[index]
    total += directors_earnings_hash[director_name]
    index += 1 
  end
  total
end


