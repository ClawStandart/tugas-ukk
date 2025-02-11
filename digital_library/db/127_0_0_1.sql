-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2025 at 09:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_libraryrz`
--
CREATE DATABASE IF NOT EXISTS `db_libraryrz` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_libraryrz`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `is_recommended` tinyint(1) DEFAULT 0,
  `cover_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `author`, `genre`, `published_date`, `is_recommended`, `cover_image`, `created_at`, `description`, `content`) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '1925-04-10', 1, 'asset/images/the_great_gatsby.jfif', '2025-01-21 02:07:54', 'A tale of Jay Gatsby, a mysterious millionaire, and his obsessive love for Daisy Buchanan in the roaring twenties, showcasing themes of wealth, desire, and the American Dream.', NULL),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '1960-07-11', 0, 'asset/images/to_kill_a_mockingbird.jpg', '2025-01-21 02:07:54', 'In the segregated South, a young girl named Scout Finch grows up learning about racism, injustice, and compassion through the trial of a black man falsely accused of raping a white woman.', NULL),
(3, '1984', 'George Orwell', 'Dystopian', '1949-06-08', 1, 'asset/images/1984.jpg', '2025-01-21 02:07:54', 'A dystopian novel set in a totalitarian society controlled by the Party and its leader, Big Brother, where history is rewritten and personal freedoms are severely restricted.', NULL),
(4, 'Moby Dick', 'Herman Melville', 'Adventure', '1851-10-18', 0, 'asset/images/moby_dick.jfif', '2025-01-21 02:07:54', 'Captain Ahab embarks on a vengeful pursuit of the white whale, Moby Dick, confronting themes of obsession, fate, and the human struggle against nature.', NULL),
(5, 'Pride and Prejudice', 'Jane Austen', 'Romance', '1813-01-28', 1, 'asset/images/pride_and_prejudice.jpg', '2025-01-21 02:07:54', 'Elizabeth Bennet navigates the complexities of love, class, and marriage in Regency-era England, challenging societal norms while developing a romantic relationship with the wealthy but proud Mr. Darcy.', NULL),
(7, 'Sakamoto Days', 'Yuto Suzuki', 'Action', '2023-04-04', 1, 'asset/images/sakamoto_days.jpg', '2025-01-21 06:29:15', 'The story revolves around Taro Sakamoto, a retired legendary hitman who has settled into a quiet and mundane life as a family man.\r\n', NULL),
(8, 'Sword Art Online: Aincrad', 'Reki Kawahara', 'Light Novel', '2009-04-10', 1, 'cover_sao.jpg', '2025-01-21 06:40:19', 'Players are trapped in a VR MMORPG where death in the game means death in real life.', 'Link Start!'),
(9, 'Overlord', 'Kugane Maruyama', 'Light Novel', '2012-07-30', 1, 'cover_overlord.jpg', '2025-01-21 06:40:19', 'A player remains in a game world after its servers shut down and decides to conquer the world.', 'The story of Ainz Ooal Gown...'),
(10, 'Re:Zero - Starting Life in Another World', 'Tappei Nagatsuki', 'Light Novel', '2014-01-23', 1, 'cover_rezero.jpg', '2025-01-21 06:40:19', 'Subaru is transported to a fantasy world and gains the ability to rewind time upon death.', 'Return by death.'),
(11, 'The Rising of the Shield Hero', 'Aneko Yusagi', 'Light Novel', '2013-08-22', 1, 'cover_shieldhero.jpg', '2025-01-21 06:40:19', 'A man is summoned as one of four heroes and must defend the world using only a shield.', 'The shield chose him.'),
(12, 'No Game No Life', 'Yuu Kamiya', 'Light Novel', '2012-04-25', 1, 'cover_ngnl.jpg', '2025-01-21 06:40:19', 'A sibling duo of genius gamers are transported to a world where everything is decided by games.', 'The game of life begins.'),
(13, 'Mushoku Tensei: Jobless Reincarnation', 'Rifujin na Magonote', 'Light Novel', '2014-01-01', 1, 'cover_mushoku.jpg', '2025-01-21 06:40:19', 'A man is reincarnated into a magical world with the chance to live a better life.', 'A journey of redemption.'),
(14, 'That Time I Got Reincarnated as a Slime', 'Fuse', 'Light Novel', '2013-05-30', 1, 'cover_tensura.jpg', '2025-01-21 06:40:19', 'A man is reincarnated as a slime in a magical world and builds his own nation.', 'From slime to hero.'),
(15, 'The Melancholy of Haruhi Suzumiya', 'Nagaru Tanigawa', 'Light Novel', '2003-06-06', 1, 'cover_haruhi.jpg', '2025-01-21 06:40:19', 'A high school girl unknowingly has the power to alter reality, and her friends must manage her whims.', 'A world in her hands.'),
(16, 'Classroom of the Elite', 'Syougo Kinugasa', 'Light Novel', '2015-05-25', 1, 'cover_classroom.jpg', '2025-01-21 06:40:19', 'In a prestigious school, students compete using their intellect and strategy.', 'The fight for supremacy.'),
(17, 'Toradora!', 'Yuyuko Takemiya', 'Light Novel', '2006-03-10', 1, 'cover_toradora.jpg', '2025-01-21 06:40:19', 'A story about an unlikely friendship between two high school students with romantic entanglements.', 'A tiger and a dragon.'),
(18, 'A Certain Magical Index', 'Kazuma Kamachi', 'Light Novel', '2004-04-10', 1, 'cover_index.jpg', '2025-01-21 06:40:19', 'A young man with an unusual ability meets a nun holding the secrets of magical grimoires.', 'Science meets magic.'),
(19, 'Spice and Wolf', 'Isuna Hasekura', 'Light Novel', '2006-02-10', 1, 'cover_spicewolf.jpg', '2025-01-21 06:40:19', 'A traveling merchant teams up with a wolf deity to explore economics and relationships.', 'Trading with a goddess.'),
(20, '86 -Eighty Six-', 'Asato Asato', 'Light Novel', '2017-02-10', 1, 'cover_86.jpg', '2025-01-21 06:40:19', 'A war story about discrimination, technology, and survival between humanity and its unmanned enemies.', 'The unrecorded warriors.'),
(21, 'Konosuba: God’s Blessing on This Wonderful World!', 'Natsume Akatsuki', 'Light Novel', '2013-09-09', 1, 'cover_konosuba.jpg', '2025-01-21 06:40:19', 'A shut-in gamer dies and is reincarnated into a fantasy world with a useless goddess.', 'Adventures of chaos.'),
(22, 'The Irregular at Magic High School', 'Tsutomu Satou', 'Light Novel', '2008-07-10', 1, 'cover_irregular.jpg', '2025-01-21 06:40:19', 'In a world of magic, a sibling duo navigates school life and hidden conspiracies.', 'Magic, science, and secrets.'),
(23, 'Arifureta: From Commonplace to World’s Strongest', 'Ryo Shirakome', 'Light Novel', '2015-02-25', 1, 'cover_arifureta.jpg', '2025-01-21 06:40:19', 'A bullied student is betrayed and left for dead but rises to power in a fantasy world.', 'A rise from despair.'),
(24, 'Grimgar of Fantasy and Ash', 'Ao Jyumonji', 'Light Novel', '2013-06-25', 1, 'cover_grimgar.jpg', '2025-01-21 06:40:19', 'A group of strangers wakes up in a dangerous fantasy world with no memories.', 'Survival at all costs.'),
(25, 'The Devil is a Part-Timer!', 'Satoshi Wagahara', 'Light Novel', '2011-02-10', 1, 'cover_devil.jpg', '2025-01-21 06:40:19', 'The Demon King flees to modern Japan and starts working at a fast-food restaurant.', 'Evil goes part-time.'),
(26, 'Is It Wrong to Try to Pick Up Girls in a Dungeon?', 'Fujino Omori', 'Light Novel', '2013-01-15', 1, 'cover_danmachi.jpg', '2025-01-21 06:40:19', 'A young adventurer fights to grow stronger and protect those he loves.', 'A dungeon’s mystery.'),
(27, 'Bakemonogatari', 'Nisio Isin', 'Light Novel', '2006-11-10', 1, 'cover_bakemonogatari.jpg', '2025-01-21 06:40:19', 'A student who survived a vampire attack helps others deal with supernatural afflictions.', 'Supernatural tales.'),
(31, 'Zaregoto', 'Nisio Isin', 'Light Novel', '2002-02-05', 0, 'cover_zaregoto.jpg', '2025-01-21 06:42:51', 'A mystery novel series revolving around enigmatic crimes and bizarre characters.', 'Unsolvable mysteries.'),
(32, 'Baccano!', 'Ryohgo Narita', 'Light Novel', '2003-02-10', 1, 'cover_baccano.jpg', '2025-01-21 06:42:51', 'A story of immortals, gangsters, and chaos in Prohibition-era America.', 'Immortality meets crime.'),
(33, 'Boogiepop and Others', 'Kohei Kadono', 'Light Novel', '1998-02-25', 0, 'cover_boogiepop.jpg', '2025-01-21 06:42:51', 'A series of urban legends that intertwine with supernatural elements and dark mysteries.', 'Legends come to life.'),
(34, 'The Empty Box and Zeroth Maria', 'Eiji Mikage', 'Light Novel', '2009-01-01', 1, 'cover_emptybox.jpg', '2025-01-21 06:42:51', 'A surreal story about repeating timelines and the struggle to escape fate.', 'The ultimate dilemma.'),
(35, 'Rokka: Braves of the Six Flowers', 'Ishio Yamagata', 'Light Novel', '2011-08-25', 1, 'cover_rokka.jpg', '2025-01-21 06:42:51', 'Six heroes are chosen to defeat an ancient evil, but seven appear.', 'Who is the traitor?'),
(36, 'The Faraway Paladin', 'Kanata Yanagino', 'Light Novel', '2015-03-25', 1, 'cover_farawaypaladin.jpg', '2025-01-21 06:42:51', 'A human raised by undead beings embarks on a journey to become a hero.', 'A tale of growth.'),
(37, 'Hyouka', 'Honobu Yonezawa', 'Light Novel', '2001-10-31', 0, 'cover_hyouka.jpg', '2025-01-21 06:42:51', 'A student solves mundane but intriguing mysteries in a quiet town.', 'Ordinary mysteries, extraordinary resolutions.'),
(38, 'Gamers!', 'Sekina Aoi', 'Light Novel', '2015-03-25', 0, 'cover_gamers.jpg', '2025-01-21 06:42:51', 'A group of gamers navigates friendships, misunderstandings, and high school life.', 'A gaming comedy.'),
(39, 'My Youth Romantic Comedy Is Wrong, As I Expected', 'Wataru Watari', 'Light Novel', '2011-03-18', 1, 'cover_oregairu.jpg', '2025-01-21 06:42:51', 'A cynical student joins a club to help others but learns more about himself.', 'A journey of self-discovery.'),
(40, 'Date A Live', 'Koshi Tachibana', 'Light Novel', '2011-03-19', 0, 'cover_datealive.jpg', '2025-01-21 06:42:51', 'A high school boy must date powerful spirits to prevent their destruction.', 'Save the world by dating.'),
(41, 'Strike the Blood', 'Gakuto Mikumo', 'Light Novel', '2011-05-10', 0, 'cover_striketheblood.jpg', '2025-01-21 06:42:51', 'A vampire and his guardian fight against magical threats in their city.', 'A bond forged in battle.'),
(42, 'The Saga of Tanya the Evil', 'Carlo Zen', 'Light Novel', '2013-10-31', 1, 'cover_tanyatheevil.jpg', '2025-01-21 06:42:51', 'A salaryman reincarnates as a girl soldier in a magical world torn by war.', 'The devil in the battlefield.'),
(43, 'Akashic Records of Bastard Magic Instructor', 'Taro Hitsuji', 'Light Novel', '2014-07-19', 0, 'cover_akashicrecords.jpg', '2025-01-21 06:42:51', 'A lazy substitute teacher hides his genius while protecting his students.', 'Magic lessons with secrets.'),
(44, 'I Want to Eat Your Pancreas', 'Yoru Sumino', 'Light Novel', '2014-06-19', 1, 'cover_pancreas.jpg', '2025-01-21 06:42:51', 'A boy learns life lessons from a terminally ill girl.', 'A touching and bittersweet tale.'),
(45, 'Reincarnated as a Sword', 'Yuu Tanaka', 'Light Novel', '2015-07-30', 0, 'cover_reincarnatedsword.jpg', '2025-01-21 06:42:51', 'A man reincarnates as a sword and teams up with a catgirl adventurer.', 'An unconventional rebirth.'),
(46, 'Campione!', 'Jou Taketsuki', 'Light Novel', '2008-05-28', 1, 'cover_campione.jpg', '2025-01-21 06:42:51', 'A boy becomes a god slayer and attracts powerful beings.', 'A world of gods and champions.'),
(47, 'Katanagatari', 'Nisio Isin', 'Light Novel', '2007-01-25', 0, 'cover_katanagatari.jpg', '2025-01-21 06:42:51', 'A swordsman without a sword collects legendary blades for his strategist partner.', 'A tale of swords.'),
(48, 'Goblin Slayer', 'Kumo Kagyu', 'Light Novel', '2016-02-15', 1, 'cover_goblinslayer.jpg', '2025-01-21 06:42:51', 'A man dedicated to exterminating goblins becomes a legend.', 'No goblin left alive.'),
(49, 'Cautious Hero: The Hero Is Overpowered but Overly Cautious', 'Light Tuchihi', 'Light Novel', '2016-02-10', 0, 'cover_cautioushero.jpg', '2025-01-21 06:42:51', 'An overly cautious hero is summoned to save a world.', 'Preparation is key.'),
(50, 'Tower of Druaga', 'Ryo Mizuno', 'Light Novel', '2007-04-15', 0, 'cover_towerofdruaga.jpg', '2025-01-21 06:42:51', 'Adventurers climb a dangerous tower filled with monsters to find treasure.', 'Reach the top.'),
(64, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', NULL, 0, 'asset/image/catcher.jpg', '2025-01-21 04:14:07', 'A teenager’s journey through alienation and loss, struggling with his identity and place in the world.', NULL),
(65, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', NULL, 0, 'asset/image/lotr.jpg', '2025-01-21 04:14:07', 'An epic tale of a group of heroes seeking to destroy the One Ring and defeat the dark lord Sauron.', NULL),
(66, 'Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'Fantasy', NULL, 0, 'asset/image/harry_potter.jpg', '2025-01-21 04:14:07', 'A young boy discovers he is a wizard and attends Hogwarts, a magical school for witches and wizards.', NULL),
(67, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', NULL, 0, 'asset/image/hobbit.jpg', '2025-01-21 04:14:07', 'Bilbo Baggins embarks on a journey with a group of dwarves to reclaim their homeland from the dragon Smaug.', NULL),
(68, 'Brave New World', 'Aldous Huxley', 'Dystopian', NULL, 0, 'asset/image/brave_new_world.jpg', '2025-01-21 04:14:07', 'A society in which the government enforces peace and happiness through mass control, removing personal freedom.', NULL),
(69, 'Animal Farm', 'George Orwell', 'Allegory', NULL, 0, 'asset/image/animal_farm.jpg', '2025-01-21 04:14:07', 'A political allegory of farm animals overthrowing their human farmer, only to end up under an oppressive regime.', NULL),
(70, 'Wuthering Heights', 'Emily Brontë', 'Romance', NULL, 0, 'asset/image/wuthering_heights.jpg', '2025-01-21 04:14:07', 'The tragic love story of Heathcliff and Catherine, full of passion, vengeance, and redemption.', NULL),
(71, 'Frankenstein', 'Mary Shelley', 'Gothic Fiction', NULL, 0, 'asset/image/frankenstein.jpg', '2025-01-21 04:14:07', 'A scientist creates a monster who becomes his greatest challenge, leading to themes of creation, responsibility, and isolation.', NULL),
(72, 'The Odyssey', 'Homer', 'Epic', NULL, 0, 'asset/image/odyssey.jpg', '2025-01-21 04:14:07', 'The epic journey of Odysseus as he returns home after the Trojan War, facing many trials and tribulations along the way.', NULL),
(73, 'The Picture of Dorian Gray', 'Oscar Wilde', 'Gothic Fiction', NULL, 0, 'asset/image/dorian_gray.jpg', '2025-01-21 04:14:07', 'A man remains youthful while his portrait ages, reflecting his corrupt soul and immoral choices over time.', NULL),
(74, 'Dracula', 'Bram Stoker', 'Horror', NULL, 0, 'asset/image/dracula.jpg', '2025-01-21 04:14:07', 'A tale of the vampire Count Dracula’s attempt to move from Transylvania to England and his pursuit of the protagonist.', NULL),
(75, 'Les Misérables', 'Victor Hugo', 'Historical Fiction', NULL, 0, 'asset/image/les_miserables.jpg', '2025-01-21 04:14:07', 'A sweeping story of love, justice, and redemption in post-revolutionary France, centered around Jean Valjean.', NULL),
(76, 'Crime and Punishment', 'Fyodor Dostoevsky', 'Psychological Fiction', NULL, 0, 'asset/image/crime_punishment.jpg', '2025-01-21 04:14:07', 'A troubled student commits a crime and deals with the psychological aftermath of guilt, paranoia, and redemption.', NULL),
(77, 'War and Peace', 'Leo Tolstoy', 'Historical Fiction', NULL, 0, 'asset/image/war_peace.jpg', '2025-01-21 04:14:07', 'A historical epic set during the Napoleonic wars, examining the lives of multiple aristocratic families.', NULL),
(78, 'The Divine Comedy', 'Dante Alighieri', 'Epic', NULL, 0, 'asset/image/divine_comedy.jpg', '2025-01-21 04:14:07', 'Dante’s journey through Hell, Purgatory, and Heaven, exploring themes of justice, salvation, and the human soul.', NULL),
(79, 'The Trial', 'Franz Kafka', 'Absurdist Fiction', NULL, 0, 'asset/image/trial.jpg', '2025-01-21 04:14:07', 'A man is arrested and tried for an unspecified crime, depicting the bureaucratic nightmare and lack of individual freedom.', NULL),
(80, 'The Stranger', 'Albert Camus', 'Existentialism', NULL, 0, 'asset/image/stranger.jpg', '2025-01-21 04:14:07', 'A man’s indifferent response to life, death, and the absurdity of existence, leading to his eventual realization of meaninglessness.', NULL),
(81, 'One Hundred Years of Solitude', 'Gabriel García Márquez', 'Magical Realism', NULL, 0, 'asset/image/solitude.jpg', '2025-01-21 04:14:07', 'The multigenerational story of the Buendía family, blending magical events with the harsh reality of Colombia’s history.', NULL),
(82, 'Don Quixote', 'Miguel de Cervantes', 'Novel', NULL, 0, 'asset/image/don_quixote.jpg', '2025-01-21 04:14:07', 'A man’s adventures as he believes himself to be a knight, becoming a symbol of idealism versus reality in a changing world.', NULL),
(83, 'A Tale of Two Cities', 'Charles Dickens', 'Historical Fiction', NULL, 0, 'asset/image/tale_of_two_cities.jpg', '2025-01-21 04:14:07', 'The contrast between London and Paris during the French Revolution, focusing on themes of resurrection and sacrifice.', NULL),
(84, 'The Bell Jar', 'Sylvia Plath', 'Fiction', NULL, 0, 'asset/image/bell_jar.jpg', '2025-01-21 04:14:07', 'A young woman’s struggle with mental illness and her attempts to understand her place in the world amidst growing depression.', NULL),
(85, 'Catch-22', 'Joseph Heller', 'Satire', NULL, 0, 'asset/image/catch_22.jpg', '2025-01-21 04:14:07', 'A satirical novel about the absurdities of war and bureaucracy, particularly following the story of a soldier trying to escape it.', NULL),
(86, 'The Great Alone', 'Kristin Hannah', 'Historical Fiction', NULL, 0, 'asset/image/great_alone.jpg', '2025-01-21 04:14:07', 'A family’s survival in the Alaskan wilderness during the 1970s, exploring themes of love, trauma, and redemption.', NULL),
(87, 'The Shining', 'Stephen King', 'Horror', NULL, 0, 'asset/image/shining.jpg', '2025-01-21 04:14:07', 'A man’s mental deterioration, induced by isolation at a haunted hotel, threatens his family’s survival in the frozen wilderness.', NULL),
(88, 'A Game of Thrones', 'George R.R. Martin', 'Fantasy', NULL, 0, 'asset/image/game_of_thrones.jpg', '2025-01-21 04:14:07', 'Noble families battle for control of the Iron Throne in the fantasy world of Westeros, full of intrigue and betrayal.', NULL),
(89, 'The Girl on the Train', 'Paula Hawkins', 'Psychological Thriller', NULL, 0, 'asset/image/girl_on_train.jpg', '2025-01-21 04:14:07', 'A woman becomes entangled in a missing persons case after observing a seemingly perfect couple on her train ride each day.', NULL),
(90, 'The Silent Patient', 'Alex Michaelides', 'Thriller', NULL, 0, 'asset/image/silent_patient.jpg', '2025-01-21 04:14:07', 'A woman who shoots her husband in the face, and the psychotherapist trying to unravel the mystery of why she did it.', NULL),
(91, 'The Martian', 'Andy Weir', 'Science Fiction', NULL, 0, 'asset/image/martian.jpg', '2025-01-21 04:14:07', 'An astronaut’s survival on Mars after being left behind by his crew, using his ingenuity and humor to stay alive.', NULL),
(92, 'The Hunger Games', 'Suzanne Collins', 'Dystopian', NULL, 0, 'asset/image/hunger_games.jpg', '2025-01-21 04:14:07', 'A televised survival contest in a post-apocalyptic world where children fight to the death as a form of control and entertainment.', NULL),
(93, 'The Fault in Our Stars', 'John Green', 'Romance', NULL, 0, 'asset/image/fault_in_our_stars.jpg', '2025-01-21 04:14:07', 'Two teenagers with cancer fall in love, learning the beauty of life and love amidst their tragic health challenges.', NULL),
(94, 'The Help', 'Kathryn Stockett', 'Historical Fiction', NULL, 0, 'asset/image/help.jpg', '2025-01-21 04:14:07', 'The story of African-American maids working in white households in the 1960s South, and their courageous fight for equality.', NULL),
(95, 'The Outsiders', 'S.E. Hinton', 'Young Adult', NULL, 0, 'asset/image/outsiders.jpg', '2025-01-21 04:14:07', 'A gang of teenagers in a small town struggle with class division and find themselves caught in a tragic conflict with a rival gang.', NULL),
(96, 'The Giver', 'Lois Lowry', 'Dystopian', NULL, 0, 'asset/image/giver.jpg', '2025-01-21 04:14:07', 'A boy’s coming-of-age story in a seemingly perfect society, where emotions and choices are controlled to avoid pain.', NULL),
(97, 'Looking for Alaska', 'John Green', 'Young Adult', NULL, 0, 'asset/image/looking_for_alaska.jpg', '2025-01-21 04:14:07', 'A teenager searches for meaning in his life while attending boarding school and coping with personal loss.', NULL),
(98, 'Little Women', 'Louisa May Alcott', 'Historical Fiction', NULL, 0, 'asset/image/little_women.jpg', '2025-01-21 04:14:07', 'The story of four sisters growing up in Massachusetts during the American Civil War, focusing on family bonds and personal growth.', NULL),
(99, 'The Secret Garden', 'Frances Hodgson Burnett', 'Children\'s Fiction', NULL, 0, 'asset/image/secret_garden.jpg', '2025-01-21 04:14:07', 'A lonely girl discovers an overgrown garden that brings healing to both her and those around her.', NULL),
(100, 'The Wind in the Willows', 'Kenneth Grahame', 'Children\'s Fiction', NULL, 0, 'asset/image/wind_in_the_willows.jpg', '2025-01-21 04:14:07', 'The whimsical adventures of Mole, Ratty, Toad, and Badger as they enjoy life on the riverbank and in the English countryside.', NULL),
(101, 'Charlotte\'s Web', 'E.B. White', 'Children\'s Fiction', NULL, 0, 'asset/image/charlottes_web.jpg', '2025-01-21 04:14:07', 'The heartwarming story of a pig named Wilbur and his friendship with a spider named Charlotte who saves him from slaughter.', NULL),
(102, 'The Lion, the Witch and the Wardrobe', 'C.S. Lewis', 'Fantasy', NULL, 0, 'asset/image/lion_witch_wardrobe.jpg', '2025-01-21 04:14:07', 'Four siblings discover a magical land called Narnia, where they fight the White Witch and restore peace to the land.', NULL),
(103, 'Anne of Green Gables', 'L.M. Montgomery', 'Children\'s Fiction', NULL, 0, 'asset/image/anne_green_gables.jpg', '2025-01-21 04:14:07', 'A lively orphan named Anne brings joy and chaos to the residents of Green Gables and grows into a bright young woman.', NULL),
(104, 'Alice\'s Adventures in Wonderland', 'Lewis Carroll', 'Fantasy', NULL, 0, 'asset/image/alice_wonderland.jpg', '2025-01-21 04:14:07', 'A curious girl named Alice falls down a rabbit hole and experiences strange adventures in a nonsensical world.', NULL),
(105, 'The Wonderful Wizard of Oz', 'L. Frank Baum', 'Fantasy', NULL, 0, 'asset/image/wonderful_wizard_oz.jpg', '2025-01-21 04:14:07', 'A young girl named Dorothy is swept away to the magical land of Oz, where she must confront a wicked witch and find her way home.', NULL),
(106, 'The Chronicles of Narnia', 'C.S. Lewis', 'Fantasy', NULL, 0, 'asset/image/chronicles_narnia.jpg', '2025-01-21 04:14:07', 'A collection of seven stories about the magical world of Narnia, where children and creatures battle for good and evil.', NULL),
(107, 'Peter Pan', 'J.M. Barrie', 'Fantasy', NULL, 0, 'asset/image/peter_pan.jpg', '2025-01-21 04:14:07', 'A boy who never grows up takes children to Neverland, where they face pirates, fairies, and adventures.', NULL),
(111, 'How a Realist Hero Rebuilt the Kingdom', 'Dojyomaru', 'Light Novel', '2014-05-31', 1, 'cover_realisthero.jpg', '2025-01-21 06:44:32', 'A summoned hero uses politics and economics to save a kingdom.', 'Realism in another world.'),
(114, 'Accel World', 'Reki Kawahara', 'Light Novel', '2009-02-10', 1, 'cover_accelworld.jpg', '2025-01-21 06:44:32', 'A bullied boy discovers a virtual game where he can find strength.', 'Virtual battles and growth.'),
(115, 'Hataraku Maou-sama! (The Devil is a Part-Timer!)', 'Satoshi Wagahara', 'Light Novel', '2011-02-10', 1, 'cover_hataraku.jpg', '2025-01-21 06:44:32', 'A demon lord works at a fast-food restaurant in the modern world.', 'Comedy with a twist.'),
(116, 'Log Horizon', 'Mamare Touno', 'Light Novel', '2011-03-10', 1, 'cover_loghorizon.jpg', '2025-01-21 06:44:32', 'Players trapped in a game world must build a society to survive.', 'A strategic isekai.'),
(119, 'High School DxD', 'Ichiei Ishibumi', 'Light Novel', '2008-09-20', 0, 'cover_hsdxd.jpg', '2025-01-21 06:44:32', 'A boy reborn as a demon navigates a life of battles and romance.', 'Angels, demons, and chaos.'),
(120, 'Black Bullet', 'Shiden Kanzaki', 'Light Novel', '2011-05-10', 0, 'cover_blackbullet.jpg', '2025-01-21 06:44:32', 'A boy and his cursed partner fight to save humanity from monsters.', 'Action and tragedy.'),
(121, 'Problem Children Are Coming from Another World, Aren’t They?', 'Taro Tatsunoko', 'Light Novel', '2011-04-01', 1, 'cover_problemchildren.jpg', '2025-01-21 06:44:32', 'Gifted children summoned to another world compete in deadly games.', 'Strength beyond imagination.'),
(127, 'Sword Art Online', 'Reki Kawahara', 'Light Novel', '2009-04-10', 1, 'cover_sao.jpg', '2025-01-21 06:44:32', 'Players trapped in a VR game must fight their way out.', 'A fight for survival.'),
(128, 'Erased', 'Kei Sanbe', 'Light Novel', '2012-11-04', 1, 'cover_erased.jpg', '2025-01-21 06:44:32', 'A man travels back in time to prevent a series of kidnappings.', 'A mystery thriller.'),
(129, 'Tokyo Ravens', 'Kohei Azano', 'Light Novel', '2010-05-01', 0, 'cover_tokyoravens.jpg', '2025-01-21 06:44:32', 'A boy discovers his hidden power in a world of magic and curses.', 'Magic and destiny.'),
(133, 'Durarara!!', 'Ryohgo Narita', 'Light Novel', '2004-04-25', 1, 'cover_durarara.jpg', '2025-01-21 06:44:51', 'A headless rider and quirky characters collide in Ikebukuro.', 'Urban legend meets reality.'),
(134, 'Zaregoto Series', 'Nisio Isin', 'Light Novel', '2002-02-05', 1, 'cover_zaregoto.jpg', '2025-01-21 06:44:51', 'A narrator gets involved in gruesome mysteries on an isolated island.', 'Murder and deduction.'),
(136, 'Gekkou', 'Natsuki Mamiya', 'Light Novel', '2003-03-15', 0, 'cover_gekkou.jpg', '2025-01-21 06:44:51', 'A boy is drawn into a deadly mystery by a beautiful girl.', 'Romance and suspense.'),
(138, 'Saekano: How to Raise a Boring Girlfriend', 'Fumiaki Maruto', 'Light Novel', '2012-07-10', 0, 'cover_saekano.jpg', '2025-01-21 06:44:51', 'A boy creates a game with a team of eccentric girls.', 'Comedy and romance.'),
(140, 'All You Need Is Kill', 'Hiroshi Sakurazaka', 'Light Novel', '2004-12-18', 1, 'cover_allyouneed.jpg', '2025-01-21 06:44:51', 'A soldier trapped in a time loop battles alien invaders.', 'Action and repetition.'),
(141, 'Welcome to the NHK', 'Tatsuhiko Takimoto', 'Light Novel', '2002-01-28', 0, 'cover_nhk.jpg', '2025-01-21 06:44:51', 'A recluse tries to escape his hikikomori lifestyle with the help of a strange girl.', 'Dark comedy.'),
(142, 'Shakugan no Shana', 'Yashichiro Takahashi', 'Light Novel', '2002-11-09', 1, 'cover_shakugan.jpg', '2025-01-21 06:44:51', 'A boy becomes involved in a battle between flame haze and monsters.', 'Action-packed fantasy.'),
(143, 'Magical Girl Raising Project', 'Asari Endou', 'Light Novel', '2012-06-30', 1, 'cover_magicalgirl.jpg', '2025-01-21 06:44:51', 'A magical girl competition turns into a deadly survival game.', 'Dark magical girl story.'),
(146, 'When Hikaru Was on the Earth...', 'Natsuo Kirino', 'Light Novel', '1999-03-10', 1, 'cover_hikaru.jpg', '2025-01-21 06:44:51', 'A boy deals with grief and the supernatural after his friend’s death.', 'Touching and eerie.'),
(147, 'Kami-sama no Memochou (Heaven’s Memo Pad)', 'Hikaru Sugii', 'Light Novel', '2007-01-10', 1, 'cover_memopad.jpg', '2025-01-21 06:44:51', 'A shut-in detective solves cases with the help of a young man.', 'Detective story.'),
(148, 'Arslan Senki (The Heroic Legend of Arslan)', 'Yoshiki Tanaka', 'Light Novel', '1986-04-25', 1, 'cover_arslan.jpg', '2025-01-21 06:44:51', 'A prince must reclaim his throne in a war-torn land.', 'Epic fantasy.'),
(150, 'Record of Lodoss War', 'Ryo Mizuno', 'Light Novel', '1988-01-10', 1, 'cover_lodosswar.jpg', '2025-01-21 06:44:51', 'A group of adventurers battles to save their world from destruction.', 'Classic fantasy.');

-- --------------------------------------------------------

--
-- Table structure for table `borrowrecords`
--

CREATE TABLE `borrowrecords` (
  `record_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `borrow_date` date DEFAULT curdate(),
  `return_date` date DEFAULT NULL,
  `status` enum('borrowed','returned') DEFAULT 'borrowed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favorite_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`favorite_id`, `user_id`, `book_id`) VALUES
(10, 4, 1),
(7, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `history_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `access_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`history_id`, `user_id`, `book_id`, `access_time`) VALUES
(6, 4, 1, '2025-01-21 04:01:46'),
(7, 4, 2, '2025-01-21 04:01:49'),
(8, 6, 65, '2025-01-21 06:31:54'),
(9, 8, 3, '2025-01-21 08:38:45');

-- --------------------------------------------------------

--
-- Table structure for table `loginattempts`
--

CREATE TABLE `loginattempts` (
  `attempt_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `attempt_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `success` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `show_description` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `role`, `created_at`, `show_description`) VALUES
(1, 'admin', 'admin123', 'admin@library.com', 'admin', '2025-01-21 01:19:14', 1),
(2, 'user1', 'user123', 'user1@example.com', 'user', '2025-01-21 01:19:14', 1),
(3, 'user2', 'User123', 'user2@example.com', 'user', '2025-01-21 01:19:14', 1),
(4, 'Kamado', '$2y$10$3iK010L3st.30zhxrYKgV.WEL8R6b1Nt96IUnOQBntrmYXdnM2ODa', 'Tanshiru@ex.co.id', 'user', '2025-01-21 01:51:27', 0),
(6, 'Nishimiya', '$2y$10$MqlSbJ8YgnN/WhiUDXPuEubA8Gb/8Se3nRlzonH34hpjR7Jlr5PPK', 'kohakunchosu@ming.jp', 'user', '2025-01-21 05:46:08', 1),
(7, 'Farid', '$2y$10$SBeiwyeLMbsvN1ScsFABVe.Ki43okpE4oIO5FDsDiPxBti1FUkv4O', 'farid@makan.co.id', 'user', '2025-01-21 07:49:24', 1),
(8, 'wisno', '$2y$10$ta5/DPYUplzLFvS2dmXAeOW6iqhE.WXjnxtiCXMSEhPGsWp59Ot3S', 'manusia@yahuu.id', 'user', '2025-01-21 08:37:50', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `borrowrecords`
--
ALTER TABLE `borrowrecords`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `loginattempts`
--
ALTER TABLE `loginattempts`
  ADD PRIMARY KEY (`attempt_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `borrowrecords`
--
ALTER TABLE `borrowrecords`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `loginattempts`
--
ALTER TABLE `loginattempts`
  MODIFY `attempt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrowrecords`
--
ALTER TABLE `borrowrecords`
  ADD CONSTRAINT `borrowrecords_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `borrowrecords_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);

--
-- Constraints for table `loginattempts`
--
ALTER TABLE `loginattempts`
  ADD CONSTRAINT `loginattempts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"db_libraryrz\",\"table\":\"users\"},{\"db\":\"db_libraryrz\",\"table\":\"history\"},{\"db\":\"db_libraryrz\",\"table\":\"books\"},{\"db\":\"db_libraryrz\",\"table\":\"borrowrecords\"},{\"db\":\"db_libraryrz\",\"table\":\"favorites\"},{\"db\":\"db_libraryrz\",\"table\":\"loginattempts\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'db_libraryrz', 'users', '{\"sorted_col\":\"`users`.`show_description` ASC\"}', '2025-01-21 05:31:53');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-01-21 08:43:05', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
