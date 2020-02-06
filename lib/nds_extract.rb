$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def gross_for_director(d)
  total = 0
  index = 0
  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end
  total
end

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

def list_of_directors(source)
  initial_array = [] 
  d_counter = 0 
  while d_counter < source.length do 
    current_name = source[d_counter][:name]
    initial_array.push(current_name)
    d_counter += 1 
  end 
  initial_array 
end

def total_gross(source)
  end_total = 0 
  counter = 0 
  directors_array = list_of_directors(source)
  directors_totals_hash = directors_totals(source)
  while counter < source.length do
    current_director_name = directors_array[counter]
    end_total += directors_totals_hash[current_director_name]
    counter += 1 
  end 
  end_total
end