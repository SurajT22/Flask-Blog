-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2020 at 05:41 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thesmartness`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone`, `message`, `date`) VALUES
(1, 'first post ', 'suraj_firstpost@gmail.com', '12345678910', 'first post', '2020-08-23 19:49:01'),
(2, 'fist page', 'first@gmail.com', '93788885052', 'hiiiooo', NULL),
(8, 'sam', 'sam12@gmail.com', '98503477498', 'dst', '2020-08-27 21:42:20'),
(9, 'hiiiname', 'hi_2@gmail.com', '93745155971', 'HIIIHKS', '2020-08-27 21:43:05'),
(10, 'hiiiname', 'hi_2@gmail.com', '93745155971', 'HIIIHKS', '2020-08-27 21:48:10'),
(11, 'sam', 'sam12@gmail.com', '98503477498', 'dst', '2020-08-27 22:12:39');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(50) NOT NULL,
  `Title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(50) NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `Title`, `tagline`, `slug`, `content`, `img_file`, `Date`) VALUES
(1, 'Lets Learn About Stock Market', 'This is first post', 'first-post', 'Stock (also capital stock) of a corporation, is all of the shares into which ownership of the corporation is divided.[1] In American English, the shares are collectively known as \"stock\".[1] A single share of the stock represents fractional ownership of the corporation in proportion to the total number of shares. This typically entitles the stockholder to that fraction of the company\'s earnings, proceeds from liquidation of assets (after discharge of all senior claims such as secured and unsecured debt),[2] or voting power, often dividing these up in proportion to the amount of money each stockholder has invested. Not all stock is necessarily equal, as certain classes of stock may be issued for example without voting rights, with enhanced voting rights, or with a certain priority to receive profits or liquidation proceeds before or after other classes of shareholders.', '4.jpg', '2020-08-28 16:18:07'),
(2, 'This is second post', 'coolest post ever', 'second-post', 'Man must explore, and this is exploration at its greatest', 'about-bg.jpg', '2020-08-28 18:45:53'),
(3, 'Tesla', 'Tesla most commonly refers to:\r\n\r\nNikola Tesla (1856–1943), a Serbian-American electrical engineer and inventor\r\nTesla, Inc., an American electric vehicle and clean energy company, formerly Tesla Motors, Inc.', 'fifth-post', 'Companies and organizations\r\nTesla (Czechoslovak company), a former state-owned conglomerate in the former Czechoslovakia\r\nTesla Electric Light and Manufacturing, a former company in Rahway, New Jersey, US\r\nTesla Science Center at Wardenclyffe, a proposed science museum in New York, US\r\nMedia and entertainment\r\nTesla (2016 film), a 2016 film by David Grubin\r\nTesla (2020 film), a 2020 film by Michael Almereyda\r\nTesla (band), an American hard rock band formed in Sacramento, California in late 1981\r\nTesla - Lightning in His Hand, an opera by Constantine Koukias\r\n\"Tesla\", a song on the 2013 album Nanobots by They Might Be Giants\r\nPlaces\r\nTesla, a former coal mining town in Corral Hollow, California, US\r\nTesla, West Virginia, US\r\nTesla Fault, a geological formation in the Diablo Range, California, US\r\nTesla River, Romania\r\nSpace\r\n2244 Tesla, an asteroid discovered in 1952\r\nTesla (crater), a lunar crater\r\nScience and technology\r\nTesla (microarchitecture), a microarchitecture developed by Nvidia\r\nTesla (unit) (symbol: T), the SI derived unit of magnetic flux density\r\nTeraelectronvolt Energy Superconducting Linear Accelerator, a proposed particle collider, now part of the International Linear Collider project\r\nTesla valve, a fixed-geometry passive check valve\r\nNvidia Tesla, a brand of GPGPU cards with the Tesla microarchitecture\r\nTesla coil, a type of resonant transformer circuit\r\nSee also\r\nList of things named after Nikola Tesla\r\nList of Nikola Tesla patents\r\nNikola Tesla (disambiguation)\r\nAll pages with titles containing Tesla\r\nAll pages with titles beginning with Tesla\r\nTesler, a surname\r\nTSLAQ, a loose collective critical of Tesla', 'tesla.jpg', '2020-08-28 20:29:39'),
(4, 'spacex work', '\"Space exploration technologies\" redirects here. For the general topics, see Space exploration and Space technology.', 'six-post', 'Space Exploration Technologies Corp., trading as SpaceX, is an American aerospace manufacturer and space transportation services company headquartered in Hawthorne, California. It was founded in 2002 by Elon Musk with the goal of reducing space transportation costs to enable the colonization of Mars.[9][10][11] SpaceX has developed several launch vehicles, the Starlink satellite constellation, the Dragon cargo spacecraft, and flown humans to the International Space Station on the Crew Dragon Demo-2.\r\n\r\nSpaceX\'s achievements include the first privately funded liquid-propellant rocket to reach orbit (Falcon 1 in 2008),[12] the first private company to successfully launch, orbit, and recover a spacecraft (Dragon in 2010), the first private company to send a spacecraft to the International Space Station (Dragon in 2012),[13] the first propulsive landing for an orbital rocket (Falcon 9 in 2015), the first reuse of an orbital rocket (Falcon 9 in 2017), the first private company to launch an object into orbit around the Sun (Falcon Heavy\'s payload of a Tesla Roadster in 2018), and the first private company to send astronauts to the International Space Station (SpaceX Crew Dragon Demo-2 Mission in 2020).[14] SpaceX has flown 20[15] cargo resupply missions to the International Space Station (ISS) under a partnership with NASA,[16] as well as an uncrewed demonstration flight of the human-rated Dragon 2 spacecraft (Crew Demo-1) on March 2, 2019, and the first crewed Dragon 2 flight on May 30, 2020.[14]\r\n\r\nIn December 2015, a Falcon 9 accomplished a propulsive vertical landing. This was the first such achievement by a rocket for orbital spaceflight.[17] In April 2016, with the launch of CRS-8, SpaceX successfully vertically landed the first stage on an ocean drone ship landing platform.[18] In May 2016, in another first, SpaceX again landed the first stage, but during a significantly more energetic geostationary transfer orbit mission.[19] In March 2017, SpaceX became the first to successfully re-launch and land the first stage of an orbital rocket.[20] In January 2020, with the third launch of the Starlink project, SpaceX became the largest commercial satellite constellation operator in the world.[21][22]\r\n\r\nIn September 2016, Musk unveiled the Interplanetary Transport System—subsequently renamed Starship—a privately funded launch system to develop spaceflight technology for use in crewed interplanetary spaceflight. In 2017, Musk unveiled an updated configuration of the system which is intended to handle interplanetary missions plus become the primary SpaceX orbital vehicle after the early 2020s, as SpaceX has announced it intends to eventually replace its existing Falcon 9 launch vehicles and Dragon space capsule fleet with Starship, even in the Earth-orbit satellite delivery market.[23][24][25]:24:50–27:05 Starship is planned to be fully reusable and will be the largest rocket ever on its debut, scheduled for the early 2020s.[26][27]\r\n\r\n\r\n', 'spacex.jpg', '2020-08-28 20:29:39'),
(5, 'Ensite hartbeat', 'masta wali tagline', 'third-post', 'I believe every human has a finite number of heartbeats.\r\nI don\'t intend to waste any of mine..\r\nThe world economy or global economy is the economy of all humans of the world, considered as the international exchange of goods and services that is expressed in monetary units of account.[1] In some contexts, the two terms are distinct \"international\" or \"global economy\" being measured separately and distinguished from national economies while the \"world economy\" is simply an aggregate of the separate countries\' measurements. Beyond the minimum standard concerning value in production, use and exchange the definitions, representations, models and valuations of the world economy vary widely. It is inseparable from the geography and ecology of Earth.', '1.jpg', '2020-08-28 20:29:50'),
(6, 'Tesla Motor', '\"Tesla Motors\" redirects here. For Nikola Tesla\'s motors, see induction motor and AC motor.', 'forth-post', 'Tesla, Inc. (formerly Tesla Motors, Inc.) is an American electric vehicle and clean energy company based in Palo Alto, California.[10] The company specializes in electric vehicle manufacturing, battery energy storage from home to grid scale and, through its acquisition of SolarCity, solar panel and solar roof tile manufacturing.[11]\r\n\r\nFounded in July 2003 by engineers Martin Eberhard and Marc Tarpenning as Tesla Motors, the company’s name is a tribute to inventor and electrical engineer Nikola Tesla. The next three employees were Ian Wright, Elon Musk, and J. B. Straubel, all of whom are named as co-founders of the company.[2] Musk, who formerly served as chairman and is the current CEO, said that he envisioned Tesla Motors as a technology company and independent automaker, aimed at eventually offering electric cars at prices affordable to the average consumer. In February 2017, Tesla Motors shortened its name to Tesla, Inc.\r\n\r\nTesla\'s current products include cars (the Model S,[12] Model 3,[13] Model X,[14] and Model Y[15]), batteries (the Powerwall,[16] Powerpack,[17] and Megapack[18]), solar products (solar panels[19] and solar roof tiles[20]) and related products[21] and services.[22][23] To produce these, Tesla operates multiple production and assembly plants. Its main vehicle manufacturing facility is at Tesla Factory[24] in Fremont, California. Other facilities are Giga Nevada,[25] Giga New York, and Giga Shanghai.', 'post-sample.jpg', '2020-08-28 20:29:50'),
(8, 'sam2', 'dame`', 'go', 'Suraj is the best in World, so don`t compare any one', '1.jpg', '2020-09-02 17:44:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
