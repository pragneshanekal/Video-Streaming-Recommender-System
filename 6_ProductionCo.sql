ALTER SESSION SET current_schema=APP_ADMIN;
SET SERVEROUTPUT ON;

BEGIN
--insert into prod co
    insert_productioncompany_pkg.insert_into_production_co('Sony Pictures Entertainment', 'Culver City, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Metro-Goldwyn-Mayer (MGM)', 'Beverly Hills, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('DreamWorks Pictures', 'Universal City, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Columbia Pictures', 'Culver City, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Lionsgate Films', 'Santa Monica, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('DreamWorks Animation', 'Glendale, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Focus Features', 'Universal City, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('New Line Cinema', 'Burbank, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Fox Searchlight Pictures', 'Los Angeles, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Warner Bros. Pictures', 'Burbank, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Walt Disney Pictures', 'Burbank, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Universal Pictures', 'Universal City, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('20th Century Studios', 'Century City, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Paramount Pictures', 'Hollywood, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Yash Raj Films', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Dharma Productions', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Eros International', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Reliance Entertainment', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('T-Series', 'Noida, Uttar Pradesh, India');
    insert_productioncompany_pkg.insert_into_production_co('UTV Motion Pictures', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Red Chillies Entertainment', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Viacom18 Motion Pictures', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Excel Entertainment', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Balaji Motion Pictures', 'Mumbai, Maharashtra, India');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into production_co: ' || sqlerrm);
END;
/

BEGIN
    insert_productioncompany_pkg.insert_into_tv_show('Breaking Bad', 'High school chemistry teacher turned methamphetamine producer.', 2008, 'N', 5, 1);
    insert_productioncompany_pkg.insert_into_tv_show('Stranger Things', 'Supernatural events in a small town.', 2016, 'N', 4, 2);
    insert_productioncompany_pkg.insert_into_tv_show('The Mandalorian', 'Space western in the Star Wars universe.', 2019, 'N', 3, 3);
    insert_productioncompany_pkg.insert_into_tv_show('Game of Thrones', 'Political and dynastic struggles in the Seven Kingdoms.', 2011, 'Y', 8, 4);
    insert_productioncompany_pkg.insert_into_tv_show('The Witcher', 'Monster hunter in a medieval-inspired world.', 2019, 'Y', 2, 5);
    insert_productioncompany_pkg.insert_into_tv_show('Friends', 'Life and adventures of a group of friends in New York.', 1994, 'N', 10, 6);
    insert_productioncompany_pkg.insert_into_tv_show('Black Mirror', 'Anthology series exploring the dark side of technology.', 2011, 'Y', 5, 7);
    insert_productioncompany_pkg.insert_into_tv_show('The Office', 'Mockumentary on the everyday lives of office employees.', 2005, 'N', 9, 8);
    insert_productioncompany_pkg.insert_into_tv_show('The Crown', 'Chronicles the reign of Queen Elizabeth II.', 2016, 'N', 6, 9);
    insert_productioncompany_pkg.insert_into_tv_show('Narcos', 'Depicts the rise and fall of drug cartels in Colombia.', 2015, 'Y', 3, 10);
    insert_productioncompany_pkg.insert_into_tv_show('Westworld', 'Theme park with human-like robots and moral dilemmas.', 2016, 'Y', 4, 11);
    insert_productioncompany_pkg.insert_into_tv_show('Sherlock', 'Modern-day adaptation of Arthur Conan Doyles Sherlock Holmes.', 2010, 'N', 4, 12);
    insert_productioncompany_pkg.insert_into_tv_show('The Simpsons', 'Satirical depiction of a middle-class American family.', 1989, 'N', 33, 13);
    insert_productioncompany_pkg.insert_into_tv_show('The Big Bang Theory', 'Lives of socially awkward physicists.', 2007, 'N', 12, 14);
    insert_productioncompany_pkg.insert_into_tv_show('Rick and Morty', 'Adventures of an eccentric scientist and his good-hearted grandson.', 2013, 'Y', 5, 15);
    insert_productioncompany_pkg.insert_into_tv_show('The Sopranos', 'Life of mob boss Tony Soprano.', 1999, 'Y', 6, 16);
    insert_productioncompany_pkg.insert_into_tv_show('Money Heist', 'Criminal mastermind and his team execute heists on the Royal Mint of Spain.', 2017, 'Y', 5, 17);
    insert_productioncompany_pkg.insert_into_tv_show('Peaky Blinders', 'Gangster family epic set in Birmingham, England, after World War I.', 2013, 'Y', 6, 18);
    insert_productioncompany_pkg.insert_into_tv_show('Fargo', 'Anthology series inspired by the 1996 film.', 2014, 'Y', 4, 19);

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into tv_show: ' || sqlerrm);
END;
/

BEGIN
-- Generated procedures for inserting data into the episode table, associating with TV shows
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode A', 'The first episode of Breaking Bad', 1, 1, 1);
    insert_productioncompany_pkg.insert_into_episode('Episode 2 of Breaking Bad', 'Description of Episode 2 of Breaking Bad', 1, 2, 1);
    insert_productioncompany_pkg.insert_into_episode('Season Finale of Breaking Bad', 'Description of Season Finale of Breaking Bad', 1, 3, 1);
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode of Stranger Things', 'The first episode of Stranger Things', 1, 1, 2);
    insert_productioncompany_pkg.insert_into_episode('The New Beginning of Stranger Things', 'Description of The New Beginning of Stranger Things', 1, 2, 2);
    insert_productioncompany_pkg.insert_into_episode('Special Episode X of The Mandalorian', 'A special episode for The Mandalorian', 3, 1, 3);
    insert_productioncompany_pkg.insert_into_episode('The Office Christmas Special of Game of Thrones', 'Christmas special of Game of Thrones', 2, 1, 4);
    insert_productioncompany_pkg.insert_into_episode('Coronation Episode of The Witcher', 'Coronation episode of The Witcher', 1, 1, 5);
    insert_productioncompany_pkg.insert_into_episode('Episode 4 of Friends', 'Description of Episode 4 of Friends', 1, 4, 6);
    insert_productioncompany_pkg.insert_into_episode('Game-Changing Finale of Black Mirror', 'Season finale of Black Mirror', 2, 8, 7);
    insert_productioncompany_pkg.insert_into_episode('The Hound Strikes Back of The Office', 'Episode featuring The Hound in The Office', 1, 7, 8);
    insert_productioncompany_pkg.insert_into_episode('Family Vacation Episode of The Crown', 'Special episode in The Crown', 1, 1, 9);
    insert_productioncompany_pkg.insert_into_episode('Episode 5 of Narcos', 'Description of Episode 5 of Narcos', 1, 5, 10);
    insert_productioncompany_pkg.insert_into_episode('The Sheldon Experiment of Westworld', 'Experiment episode in Westworld', 1, 3, 11);
    insert_productioncompany_pkg.insert_into_episode('The Mob Boss Returns of Sherlock', 'Return of the mob boss in Sherlock', 1, 2, 12);
    insert_productioncompany_pkg.insert_into_episode('Heist Episode of The Simpsons', 'Heist episode in The Simpsons', 2, 3, 13);
    insert_productioncompany_pkg.insert_into_episode('Season Premiere of The Big Bang Theory', 'Premiere episode of The Big Bang Theory', 1, 1, 14);
    insert_productioncompany_pkg.insert_into_episode('Episode 6 of Rick and Morty', 'Description of Episode 6 of Rick and Morty', 1, 6, 15);
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode P', 'The first episode of Money Heist', 1, 1, 17);
    insert_productioncompany_pkg.insert_into_episode('Episode 2 of Peaky Blinders', 'Description of Episode 2 of Peaky Blinders', 1, 2, 18);
    insert_productioncompany_pkg.insert_into_episode('The Final Confrontation of Breaking Bad', 'Final showdown in Breaking Bad', 1, 4, 1);
    insert_productioncompany_pkg.insert_into_episode('Mysterious Events of Stranger Things', 'Unexplained events in Stranger Things', 2, 3, 2);
    insert_productioncompany_pkg.insert_into_episode('The Mandalorians Quest Continues', 'Continuation of The Mandalorians journey', 3, 2, 3);
    insert_productioncompany_pkg.insert_into_episode('The Battle for the Iron Throne', 'Epic battle for the Iron Throne in Game of Thrones', 8, 9, 4);
    insert_productioncompany_pkg.insert_into_episode('The Witchers Hunt for Monsters', 'The Witchers quest against monsters', 1, 2, 5);
    insert_productioncompany_pkg.insert_into_episode('The One with the Unexpected Twist in Friends', 'Unexpected twist in Friends', 10, 7, 6);
    insert_productioncompany_pkg.insert_into_episode('Black Mirror: The Mind-Bending Journey', 'Mind-bending journey in Black Mirror', 4, 5, 7);
    insert_productioncompany_pkg.insert_into_episode('The Pranks Continue in The Office', 'Continuation of pranks in The Office', 9, 6, 8);
    insert_productioncompany_pkg.insert_into_episode('Royal Challenges in The Crown', 'Challenges faced by the royals in The Crown', 2, 4, 9);
    insert_productioncompany_pkg.insert_into_episode('Narcos: Rise of New Cartels', 'New cartels emerge in Narcos', 3, 6, 10);
    insert_productioncompany_pkg.insert_into_episode('Westworld: The Moral Dilemmas Persist', 'Continued moral dilemmas in Westworld', 2, 4, 11);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into episode: ' || sqlerrm);
END;
/ 

BEGIN
    insert_productioncompany_pkg.insert_into_movie('Inception', 'Mind-bending heist thriller.', 2010, 'N', 1);
    insert_productioncompany_pkg.insert_into_movie('The Dark Knight', 'Batman faces the Joker.', 2008, 'N', 1);
    insert_productioncompany_pkg.insert_into_movie('Forrest Gump', 'Life is like a box of chocolates.', 1994, 'N', 2);
    insert_productioncompany_pkg.insert_into_movie('The Shawshank Redemption', 'Redemption in Shawshank prison.', 1994, 'N', 2);
    insert_productioncompany_pkg.insert_into_movie('Pulp Fiction', 'Interwoven crime stories.', 1994, 'Y', 3);
    insert_productioncompany_pkg.insert_into_movie('The Godfather', 'Mafia drama.', 1972, 'N', 4);
    insert_productioncompany_pkg.insert_into_movie('The Matrix', 'Virtual reality and rebellion.', 1999, 'Y', 3);
    insert_productioncompany_pkg.insert_into_movie('Schindlers List', 'Holocaust drama.', 1993, 'N', 4);
    insert_productioncompany_pkg.insert_into_movie('Titanic', 'Romantic drama on the ill-fated ship.', 1997, 'N', 5);
    insert_productioncompany_pkg.insert_into_movie('Avatar', 'Science fiction epic on Pandora.', 2009, 'N', 5);
    insert_productioncompany_pkg.insert_into_movie('Jurassic Park', 'Dinosaurs come back to life.', 1993, 'N', 6);
    insert_productioncompany_pkg.insert_into_movie('The Silence of the Lambs', 'Psychological thriller.', 1991, 'Y', 7);
    insert_productioncompany_pkg.insert_into_movie('The Departed', 'Undercover agents and organized crime.', 2006, 'Y', 4);
    insert_productioncompany_pkg.insert_into_movie('Saving Private Ryan', 'War drama during World War II.', 1998, 'N', 2);
    insert_productioncompany_pkg.insert_into_movie('Django Unchained', 'Tarantinos take on slavery.', 2012, 'Y', 3);
    insert_productioncompany_pkg.insert_into_movie('The Social Network', 'Founding of Facebook.', 2010, 'N', 7);
    insert_productioncompany_pkg.insert_into_movie('The Revenant', 'Survival in the wilderness.', 2015, 'Y', 6);
    insert_productioncompany_pkg.insert_into_movie('Braveheart', 'William Wallace and Scottish freedom.', 1995, 'Y', 8);
    insert_productioncompany_pkg.insert_into_movie('Gladiator', 'Roman general seeks revenge.', 2000, 'Y', 8);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into movie: ' || sqlerrm);
END;
/

COMMIT;