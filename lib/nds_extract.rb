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
  directors = []
  index = 0
  while index < source.length do
    directors << source[index][:name]
    index += 1
  end
  directors
end

def total_gross(source)
  dir_index = 0
  grandtotal = 0
  dir_names = list_of_directors(source)
  dir_total = directors_totals(source)
  
  while dir_index < dir_names.length do
    dir_name = dir_names[dir_index]
    grandtotal += dir_total[dir_name] # calling director name from list_of_directors to use as key to access directors_totals hash calling gross value for each director
    dir_index += 1
  end
  grandtotal
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
end


pp directors_database