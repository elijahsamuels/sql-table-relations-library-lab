-- UPDATE characters SET species = "Martian" WHERE characters.id=8;

UPDATE characters Set species = "Martian" WHERE characters.id = (SELECT MAX(id) FROM characters)