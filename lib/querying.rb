
  #   select all book title and years from first series and order by year
def select_books_titles_and_years_in_first_series_order_by_year
  <<-SQL 
  SELECT books.title, books.year 
  FROM books
  WHERE books.series_id = 1
  ORDER BY books.year;
  SQL
end

  # returns the name and motto of the character with the longest motto
def select_name_and_motto_of_char_with_longest_motto
  <<-SQL 
  SELECT characters.name, characters.motto 
  FROM characters
  ORDER BY LENGTH(motto) DESC
  LIMIT 1;
  SQL
end

  # determines the most prolific species of characters and return its value and count
def select_value_and_count_of_most_prolific_species
    <<-SQL 
  SELECT characters.species, COUNT(characters.species)
  FROM characters
  GROUP BY characters.species
  ORDER BY COUNT(characters.species) DESC
  LIMIT 1;
  SQL
end

  # selects the authors names and their series' subgenres
def select_name_and_series_subgenres_of_authors
    <<-SQL 
  SELECT authors.name, subgenres.name
  FROM authors
  JOIN subgenres
  ON series.subgenre_id = subgenres.id
  JOIN series 
  ON series.author_id = authors.id;
  SQL
end

  # selects the series title with the most characters that are the species "human"
def select_series_title_with_most_human_characters
    <<-SQL 
  SELECT series.title
  FROM series
  JOIN characters
  ON series.author_id = characters.author_id
  WHERE characters.species = 'human' 
  LIMIT 1;
  SQL
end

  # selects all of the character names and the number of books they have appeared in, grouped by character name, in descending order by number of books and ascending order by character name
def select_character_names_and_number_of_books_they_are_in
    <<-SQL 
  SELECT characters.name, COUNT(*) AS count
  FROM character_books
  JOIN characters
  ON character_books.character_id = characters.id
  GROUP BY characters.name
  ORDER BY count DESC, characters.name;
  SQL
  #   <<-SQL 
  # SELECT characters.name, COUNT(*) AS count
  # FROM character_books
  # JOIN characters
  # ON character_books.character_id = characters.id
  # GROUP BY characters.name
  # ORDER BY count DESC, characters.name;
  # SQL
end
