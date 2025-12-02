-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 02, 2025 at 12:13 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Umang_Staffing_DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Candidates`
--

CREATE TABLE `Candidates` (
  `CandidateID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `ResumeURL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Candidates`
--

INSERT INTO `Candidates` (`CandidateID`, `FirstName`, `LastName`, `Email`, `Phone`, `City`, `State`, `ResumeURL`) VALUES
(2001, 'Maria', 'Garcia', 'maria.garcia@gmail.com', '703-555-1001', 'Arlington', 'VA', 'https://resumes.storage.com/2001_garcia.pdf'),
(2002, 'David', 'Smith', 'd.smith88@yahoo.com', '571-555-1002', 'Alexandria', 'VA', 'https://resumes.storage.com/2002_smith.pdf'),
(2003, 'Jessica', 'Chen', 'jessica_chen@outlook.com', '202-555-1003', 'Washington', 'DC', 'https://resumes.storage.com/2003_chen.pdf'),
(2004, 'Michael', 'Williams', 'michael.williams@gmail.com', '301-555-1004', 'Bethesda', 'MD', 'https://resumes.storage.com/2004_williams.pdf'),
(2005, 'Sarah', 'Johnson', 'sjohnson@icloud.com', '703-555-1005', 'Fairfax', 'VA', 'https://resumes.storage.com/2005_johnson.pdf'),
(2006, 'James', 'Brown', 'james.brown22@yahoo.com', '212-555-1006', 'New York', 'NY', 'https://resumes.storage.com/2006_brown.pdf'),
(2007, 'Jennifer', 'Lee', 'jennifer.lee@gmail.com', '571-555-1007', 'Reston', 'VA', 'https://resumes.storage.com/2007_lee.pdf'),
(2008, 'Christopher', 'Jones', 'cjones_work@outlook.com', '240-555-1008', 'Rockville', 'MD', 'https://resumes.storage.com/2008_jones.pdf'),
(2009, 'Emily', 'Patel', 'emily.patel@gmail.com', '703-555-1009', 'Falls Church', 'VA', 'https://resumes.storage.com/2009_patel.pdf'),
(2010, 'Daniel', 'Rodriguez', 'daniel.rodriguez@yahoo.com', '415-555-1010', 'San Francisco', 'CA', 'https://resumes.storage.com/2010_rodriguez.pdf'),
(2011, 'Linda', 'Nguyen', 'l.nguyen@gmail.com', '571-555-1011', 'Arlington', 'VA', 'https://resumes.storage.com/2011_nguyen.pdf'),
(2012, 'Matthew', 'Kim', 'mkim5@outlook.com', '202-555-1012', 'Washington', 'DC', 'https://resumes.storage.com/2012_kim.pdf'),
(2013, 'Ashley', 'Davis', 'ashley_davis@yahoo.com', '301-555-1013', 'Silver Spring', 'MD', 'https://resumes.storage.com/2013_davis.pdf'),
(2014, 'Robert', 'Wilson', 'robert.wilson@gmail.com', '703-555-1014', 'Alexandria', 'VA', 'https://resumes.storage.com/2014_wilson.pdf'),
(2015, 'Elizabeth', 'Taylor', 'etaylor1990@icloud.com', '312-555-1015', 'Chicago', 'IL', 'https://resumes.storage.com/2015_taylor.pdf'),
(2016, 'William', 'Martinez', 'will.martinez@gmail.com', '571-555-1016', 'Herndon', 'VA', 'https://resumes.storage.com/2016_martinez.pdf'),
(2017, 'Amanda', 'Anderson', 'amanda.anderson@yahoo.com', '202-555-1017', 'Washington', 'DC', 'https://resumes.storage.com/2017_anderson.pdf'),
(2018, 'Joseph', 'Hernandez', 'joseph.h@outlook.com', '703-555-1018', 'Arlington', 'VA', 'https://resumes.storage.com/2018_hernandez.pdf'),
(2019, 'Megan', 'Thomas', 'megan.thomas7@gmail.com', '240-555-1019', 'Gaithersburg', 'MD', 'https://resumes.storage.com/2019_thomas.pdf'),
(2020, 'Richard', 'Moore', 'richard_moore@yahoo.com', '512-555-1020', 'Austin', 'TX', 'https://resumes.storage.com/2020_moore.pdf'),
(2021, 'Susan', 'Jackson', 'susan.jackson@gmail.com', '703-555-1021', 'Fairfax', 'VA', 'https://resumes.storage.com/2021_jackson.pdf'),
(2022, 'Anthony', 'Martin', 'a.martin@outlook.com', '301-555-1022', 'Bethesda', 'MD', 'https://resumes.storage.com/2022_martin.pdf'),
(2023, 'Karen', 'White', 'karen.white@icloud.com', '571-555-1023', 'Ashburn', 'VA', 'https://resumes.storage.com/2023_white.pdf'),
(2024, 'Mark', 'Thompson', 'm.thompson@gmail.com', '202-555-1024', 'Washington', 'DC', 'https://resumes.storage.com/2024_thompson.pdf'),
(2025, 'Patricia', 'Harris', 'patricia.harris@yahoo.com', '617-555-1025', 'Boston', 'MA', 'https://resumes.storage.com/2025_harris.pdf'),
(2026, 'Kevin', 'Clark', 'kevin_clark@gmail.com', '703-555-1026', 'Arlington', 'VA', 'https://resumes.storage.com/2026_clark.pdf'),
(2027, 'Nancy', 'Lewis', 'nancy.lewis3@outlook.com', '571-555-1027', 'Alexandria', 'VA', 'https://resumes.storage.com/2027_lewis.pdf'),
(2028, 'Brian', 'Robinson', 'brian.r@gmail.com', '202-555-1028', 'Washington', 'DC', 'https://resumes.storage.com/2028_robinson.pdf'),
(2029, 'Laura', 'Walker', 'laura.walker@yahoo.com', '301-555-1029', 'Silver Spring', 'MD', 'https://resumes.storage.com/2029_walker.pdf'),
(2030, 'Paul', 'Young', 'paul_young_dev@gmail.com', '206-555-1030', 'Seattle', 'WA', 'https://resumes.storage.com/2030_young.pdf'),
(2031, 'Cynthia', 'Hall', 'c.hall@icloud.com', '703-555-1031', 'Reston', 'VA', 'https://resumes.storage.com/2031_hall.pdf'),
(2032, 'Jason', 'Allen', 'jason.allen@gmail.com', '240-555-1032', 'Rockville', 'MD', 'https://resumes.storage.com/2032_allen.pdf'),
(2033, 'Donna', 'King', 'donna.k.king@yahoo.com', '571-555-1033', 'Arlington', 'VA', 'https://resumes.storage.com/2033_king.pdf'),
(2034, 'Steven', 'Wright', 'steven.wright@outlook.com', '202-555-1034', 'Washington', 'DC', 'https://resumes.storage.com/2034_wright.pdf'),
(2035, 'Rebecca', 'Scott', 'rebecca.scott@gmail.com', '303-555-1035', 'Denver', 'CO', 'https://resumes.storage.com/2035_scott.pdf'),
(2036, 'Edward', 'Green', 'edward_green@yahoo.com', '703-555-1036', 'Falls Church', 'VA', 'https://resumes.storage.com/2036_green.pdf'),
(2037, 'Sharon', 'Adams', 'sharon.adams@icloud.com', '301-555-1037', 'Bethesda', 'MD', 'https://resumes.storage.com/2037_adams.pdf'),
(2038, 'Charles', 'Baker', 'charlesbaker@gmail.com', '571-555-1038', 'Alexandria', 'VA', 'https://resumes.storage.com/2038_baker.pdf'),
(2039, 'Michelle', 'Nelson', 'm.nelson@outlook.com', '202-555-1039', 'Washington', 'DC', 'https://resumes.storage.com/2039_nelson.pdf'),
(2040, 'George', 'Carter', 'george.carter@gmail.com', '404-555-1040', 'Atlanta', 'GA', 'https://resumes.storage.com/2040_carter.pdf'),
(2041, 'Kimberly', 'Mitchell', 'kim.mitchell@yahoo.com', '703-555-1041', 'Arlington', 'VA', 'https://resumes.storage.com/2041_mitchell.pdf'),
(2042, 'Thomas', 'Perez', 't.perez@gmail.com', '571-555-1042', 'Herndon', 'VA', 'https://resumes.storage.com/2042_perez.pdf'),
(2043, 'Deborah', 'Roberts', 'deborah_r@outlook.com', '240-555-1043', 'Gaithersburg', 'MD', 'https://resumes.storage.com/2043_roberts.pdf'),
(2044, 'Frank', 'Turner', 'frank.turner@gmail.com', '202-555-1044', 'Washington', 'DC', 'https://resumes.storage.com/2044_turner.pdf'),
(2045, 'Sandra', 'Phillips', 'sandra.phillips@yahoo.com', '212-555-1045', 'New York', 'NY', 'https://resumes.storage.com/2045_phillips.pdf'),
(2046, 'Ronald', 'Campbell', 'ronald.c@icloud.com', '703-555-1046', 'Fairfax', 'VA', 'https://resumes.storage.com/2046_campbell.pdf'),
(2047, 'Mary', 'Parker', 'mary_parker_75@gmail.com', '301-555-1047', 'Silver Spring', 'MD', 'https://resumes.storage.com/2047_parker.pdf'),
(2048, 'Kenneth', 'Evans', 'k.evans@outlook.com', '571-555-1048', 'Arlington', 'VA', 'https://resumes.storage.com/2048_evans.pdf'),
(2049, 'Lisa', 'Edwards', 'lisa.edwards@yahoo.com', '202-555-1049', 'Washington', 'DC', 'https://resumes.storage.com/2049_edwards.pdf'),
(2050, 'Ryan', 'Collins', 'ryan.collins@gmail.com', '312-555-1050', 'Chicago', 'IL', 'https://resumes.storage.com/2050_collins.pdf'),
(2051, 'Brenda', 'Stewart', 'brenda.stewart@yahoo.com', '703-555-1051', 'Alexandria', 'VA', 'https://resumes.storage.com/2051_stewart.pdf'),
(2052, 'Gary', 'Sanchez', 'gary.s@icloud.com', '240-555-1052', 'Rockville', 'MD', 'https://resumes.storage.com/2052_sanchez.pdf'),
(2053, 'Melissa', 'Morris', 'melissa.m.morris@gmail.com', '571-555-1053', 'Reston', 'VA', 'https://resumes.storage.com/2053_morris.pdf'),
(2054, 'Eric', 'Rogers', 'eric_rogers_dev@outlook.com', '202-555-1054', 'Washington', 'DC', 'https://resumes.storage.com/2054_rogers.pdf'),
(2055, 'Carol', 'Reed', 'carol.reed@gmail.com', '415-555-1055', 'San Francisco', 'CA', 'https://resumes.storage.com/2055_reed.pdf'),
(2056, 'Stephen', 'Cook', 'stephen.cook@yahoo.com', '703-555-1056', 'Arlington', 'VA', 'https://resumes.storage.com/2056_cook.pdf'),
(2057, 'Pamela', 'Morgan', 'pamela_morgan@icloud.com', '301-555-1057', 'Bethesda', 'MD', 'https://resumes.storage.com/2057_morgan.pdf'),
(2058, 'Justin', 'Bell', 'j.bell@gmail.com', '571-555-1058', 'Falls Church', 'VA', 'https://resumes.storage.com/2058_bell.pdf'),
(2059, 'Maria', 'Cooper', 'maria.cooper@outlook.com', '202-555-1059', 'Washington', 'DC', 'https://resumes.storage.com/2059_cooper.pdf'),
(2060, 'Adam', 'Richardson', 'adam.richardson@gmail.com', '512-555-1060', 'Austin', 'TX', 'https://resumes.storage.com/2060_richardson.pdf'),
(2061, 'Rachel', 'Cox', 'rachel.cox@yahoo.com', '703-555-1061', 'Fairfax', 'VA', 'https://resumes.storage.com/2061_cox.pdf'),
(2062, 'Scott', 'Howard', 'scott_howard@icloud.com', '240-555-1062', 'Silver Spring', 'MD', 'https://resumes.storage.com/2062_howard.pdf'),
(2063, 'Stephanie', 'Ward', 'stephanie.ward8@gmail.com', '571-555-1063', 'Arlington', 'VA', 'https://resumes.storage.com/2063_ward.pdf'),
(2064, 'Jose', 'Torres', 'jose.t@outlook.com', '202-555-1064', 'Washington', 'DC', 'https://resumes.storage.com/2064_torres.pdf'),
(2065, 'Catherine', 'Peterson', 'catherine_p@gmail.com', '617-555-1065', 'Boston', 'MA', 'https://resumes.storage.com/2065_peterson.pdf'),
(2066, 'Jerry', 'Gray', 'jerry.gray@yahoo.com', '703-555-1066', 'Alexandria', 'VA', 'https://resumes.storage.com/2066_gray.pdf'),
(2067, 'Christine', 'Ramirez', 'christine.ramirez@icloud.com', '301-555-1067', 'Bethesda', 'MD', 'https://resumes.storage.com/2067_ramirez.pdf'),
(2068, 'Samuel', 'James', 'samuel_james@gmail.com', '571-555-1068', 'Herndon', 'VA', 'https://resumes.storage.com/2068_james.pdf'),
(2069, 'Heather', 'Watson', 'h.watson@outlook.com', '202-555-1069', 'Washington', 'DC', 'https://resumes.storage.com/2069_watson.pdf'),
(2070, 'Patrick', 'Brooks', 'patrick.brooks@gmail.com', '206-555-1070', 'Seattle', 'WA', 'https://resumes.storage.com/2070_brooks.pdf'),
(2071, 'Debra', 'Kelly', 'debra.kelly@yahoo.com', '703-555-1071', 'Arlington', 'VA', 'https://resumes.storage.com/2071_kelly.pdf'),
(2072, 'Benjamin', 'Sanders', 'ben.sanders@icloud.com', '240-555-1072', 'Rockville', 'MD', 'https://resumes.storage.com/2072_sanders.pdf'),
(2073, 'Cynthia', 'Price', 'cynthia.price@gmail.com', '571-555-1073', 'Reston', 'VA', 'https://resumes.storage.com/2073_price.pdf'),
(2074, 'Raymond', 'Bennett', 'raymond_b@outlook.com', '202-555-1074', 'Washington', 'DC', 'https://resumes.storage.com/2074_bennett.pdf'),
(2075, 'Kathleen', 'Wood', 'kathleen.wood@gmail.com', '303-555-1075', 'Denver', 'CO', 'https://resumes.storage.com/2075_wood.pdf'),
(2076, 'Dennis', 'Barnes', 'd.barnes@yahoo.com', '703-555-1076', 'Fairfax', 'VA', 'https://resumes.storage.com/2076_barnes.pdf'),
(2077, 'Anna', 'Ross', 'anna.ross@icloud.com', '301-555-1077', 'Silver Spring', 'MD', 'https://resumes.storage.com/2077_ross.pdf'),
(2078, 'Gregory', 'Henderson', 'gregoryh@gmail.com', '571-555-1078', 'Alexandria', 'VA', 'https://resumes.storage.com/2078_henderson.pdf'),
(2079, 'Janet', 'Coleman', 'janet.coleman@outlook.com', '202-555-1079', 'Washington', 'DC', 'https://resumes.storage.com/2079_coleman.pdf'),
(2080, 'Jack', 'Jenkins', 'jack.jenkins@gmail.com', '404-555-1080', 'Atlanta', 'GA', 'https://resumes.storage.com/2080_jenkins.pdf'),
(2081, 'Christina', 'Perry', 'christina.perry@yahoo.com', '703-555-1081', 'Arlington', 'VA', 'https://resumes.storage.com/2081_perry.pdf'),
(2082, 'Walter', 'Powell', 'w.powell@icloud.com', '240-555-1082', 'Gaithersburg', 'MD', 'https://resumes.storage.com/2082_powell.pdf'),
(2083, 'Tyler', 'Long', 'tyler.long@gmail.com', '571-555-1083', 'Ashburn', 'VA', 'https://resumes.storage.com/2083_long.pdf'),
(2084, 'Victoria', 'Patterson', 'v.patterson@outlook.com', '202-555-1084', 'Washington', 'DC', 'https://resumes.storage.com/2084_patterson.pdf'),
(2085, 'Henry', 'Hughes', 'henry.hughes@gmail.com', '212-555-1085', 'New York', 'NY', 'https://resumes.storage.com/2085_hughes.pdf'),
(2086, 'Joyce', 'Flores', 'joyce.f@yahoo.com', '703-555-1086', 'Falls Church', 'VA', 'https://resumes.storage.com/2086_flores.pdf'),
(2087, 'Terry', 'Washington', 'terry.washington@icloud.com', '301-555-1087', 'Bethesda', 'MD', 'https://resumes.storage.com/2087_washington.pdf'),
(2088, 'Alice', 'Butler', 'alice.butler@gmail.com', '571-555-1088', 'Arlington', 'VA', 'https://resumes.storage.com/2088_butler.pdf'),
(2089, 'Randy', 'Simmons', 'randy.simmons@outlook.com', '202-555-1089', 'Washington', 'DC', 'https://resumes.storage.com/2089_simmons.pdf'),
(2090, 'Sara', 'Foster', 'sara.foster@gmail.com', '312-555-1090', 'Chicago', 'IL', 'https://resumes.storage.com/2090_foster.pdf'),
(2091, 'Willie', 'Gonzales', 'willie.g@yahoo.com', '703-555-1091', 'Alexandria', 'VA', 'https://resumes.storage.com/2091_gonzales.pdf'),
(2092, 'Nicole', 'Bryant', 'nicole.bryant@icloud.com', '240-555-1092', 'Rockville', 'MD', 'https://resumes.storage.com/2092_bryant.pdf'),
(2093, 'Aaron', 'Alexander', 'aaron_alex@gmail.com', '571-555-1093', 'Herndon', 'VA', 'https://resumes.storage.com/2093_alexander.pdf'),
(2094, 'Beverly', 'Russell', 'b.russell@outlook.com', '202-555-1094', 'Washington', 'DC', 'https://resumes.storage.com/2094_russell.pdf'),
(2095, 'Denise', 'Griffin', 'denise.griffin@gmail.com', '415-555-1095', 'San Francisco', 'CA', 'https://resumes.storage.com/2095_griffin.pdf'),
(2096, 'Billy', 'Diaz', 'billy_diaz@yahoo.com', '703-555-1096', 'Fairfax', 'VA', 'https://resumes.storage.com/2096_diaz.pdf'),
(2097, 'Marilyn', 'Hayes', 'marilyn.hayes@icloud.com', '301-555-1097', 'Silver Spring', 'MD', 'https://resumes.storage.com/2097_hayes.pdf'),
(2098, 'Carl', 'Myers', 'carl.myers@gmail.com', '571-555-1098', 'Arlington', 'VA', 'https://resumes.storage.com/2098_myers.pdf'),
(2099, 'Theresa', 'Ford', 'theresa.ford@outlook.com', '202-555-1099', 'Washington', 'DC', 'https://resumes.storage.com/2099_ford.pdf'),
(2100, 'Arthur', 'Hamilton', 'arthur.h@gmail.com', '512-555-1100', 'Austin', 'TX', 'https://resumes.storage.com/2100_hamilton.pdf'),
(2101, 'Juan', 'Gomez', 'juan.gomez@yahoo.com', '703-555-1101', 'Alexandria', 'VA', 'https://resumes.storage.com/2101_gomez.pdf'),
(2102, 'Judith', 'Ortiz', 'judith.ortiz@icloud.com', '240-555-1102', 'Rockville', 'MD', 'https://resumes.storage.com/2102_ortiz.pdf'),
(2103, 'Roger', 'Sullivan', 'roger.s@gmail.com', '571-555-1103', 'Reston', 'VA', 'https://resumes.storage.com/2103_sullivan.pdf'),
(2104, 'Evelyn', 'Wallace', 'evelyn_wallace@outlook.com', '202-555-1104', 'Washington', 'DC', 'https://resumes.storage.com/2104_wallace.pdf'),
(2105, 'Keith', 'Woods', 'keith.woods@gmail.com', '617-555-1105', 'Boston', 'MA', 'https://resumes.storage.com/2105_woods.pdf'),
(2106, 'Cheryl', 'Cole', 'cheryl.cole@yahoo.com', '703-555-1106', 'Arlington', 'VA', 'https://resumes.storage.com/2106_cole.pdf'),
(2107, 'Larry', 'West', 'larry.west@icloud.com', '301-555-1107', 'Bethesda', 'MD', 'https://resumes.storage.com/2107_west.pdf'),
(2108, 'Teresa', 'Jordan', 'teresa.jordan@gmail.com', '571-555-1108', 'Falls Church', 'VA', 'https://resumes.storage.com/2108_jordan.pdf'),
(2109, 'Albert', 'Reyes', 'albert.reyes@outlook.com', '202-555-1109', 'Washington', 'DC', 'https://resumes.storage.com/2109_reyes.pdf'),
(2110, 'Frances', 'Owens', 'frances.owens@gmail.com', '206-555-1110', 'Seattle', 'WA', 'https://resumes.storage.com/2110_owens.pdf'),
(2111, 'Joan', 'Fisher', 'joan.fisher@yahoo.com', '703-555-1111', 'Fairfax', 'VA', 'https://resumes.storage.com/2111_fisher.pdf'),
(2112, 'Ralph', 'Armstrong', 'ralph.armstrong@icloud.com', '240-555-1112', 'Silver Spring', 'MD', 'https://resumes.storage.com/2112_armstrong.pdf'),
(2113, 'Gloria', 'Hamilton', 'gloria.h@gmail.com', '571-555-1113', 'Alexandria', 'VA', 'https://resumes.storage.com/2113_hamilton.pdf'),
(2114, 'Vincent', 'Warren', 'vincent.warren@outlook.com', '202-555-1114', 'Washington', 'DC', 'https://resumes.storage.com/2114_warren.pdf'),
(2115, 'Rose', 'Johnston', 'rose.johnston@gmail.com', '303-555-1115', 'Denver', 'CO', 'https://resumes.storage.com/2115_johnston.pdf'),
(2116, 'Eugene', 'Ray', 'eugene.ray@yahoo.com', '703-555-1116', 'Arlington', 'VA', 'https://resumes.storage.com/2116_ray.pdf'),
(2117, 'Doris', 'Watkins', 'doris.watkins@icloud.com', '301-555-1117', 'Bethesda', 'MD', 'https://resumes.storage.com/2117_watkins.pdf'),
(2118, 'Russell', 'Mills', 'russell_mills@gmail.com', '571-555-1118', 'Herndon', 'VA', 'https://resumes.storage.com/2118_mills.pdf'),
(2119, 'Virginia', 'Chapman', 'virginia.c@outlook.com', '202-555-1119', 'Washington', 'DC', 'https://resumes.storage.com/2119_chapman.pdf'),
(2120, 'Bobby', 'Gordon', 'bobby.gordon@gmail.com', '404-555-1120', 'Atlanta', 'GA', 'https://resumes.storage.com/2120_gordon.pdf'),
(2121, 'Lois', 'Harper', 'lois.harper@yahoo.com', '703-555-1121', 'Fairfax', 'VA', 'https://resumes.storage.com/2121_harper.pdf'),
(2122, 'Philip', 'George', 'philip_george@icloud.com', '240-555-1122', 'Gaithersburg', 'MD', 'https://resumes.storage.com/2122_george.pdf'),
(2124, 'Johnny', 'Hunt', 'johnny.hunt@outlook.com', '202-555-1124', 'Washington', 'DC', 'https://resumes.storage.com/2124_hunt.pdf'),
(2125, 'Kathy', 'Spencer', 'kathy.spencer@gmail.com', '212-555-1125', 'New York', 'NY', 'https://resumes.storage.com/2125_spencer.pdf'),
(2126, 'Gerald', 'Gardner', 'gerald.g@yahoo.com', '703-555-1126', 'Falls Church', 'VA', 'https://resumes.storage.com/2126_gardner.pdf'),
(2127, 'Judith', 'Payne', 'judith.payne@icloud.com', '301-555-1127', 'Bethesda', 'MD', 'https://resumes.storage.com/2127_payne.pdf'),
(2128, 'Wayne', 'Pierce', 'wayne.pierce@gmail.com', '571-555-1128', 'Arlington', 'VA', 'https://resumes.storage.com/2128_pierce.pdf'),
(2129, 'Jacqueline', 'Andrews', 'jacqueline.a@outlook.com', '202-555-1129', 'Washington', 'DC', 'https://resumes.storage.com/2129_andrews.pdf'),
(2130, 'Roy', 'Holmes', 'roy.holmes@gmail.com', '312-555-1130', 'Chicago', 'IL', 'https://resumes.storage.com/2130_holmes.pdf'),
(2131, 'Kathryn', 'Palmer', 'kathryn_palmer@yahoo.com', '703-555-1131', 'Alexandria', 'VA', 'https://resumes.storage.com/2131_palmer.pdf'),
(2132, 'Jordan', 'Mason', 'jordan.mason@icloud.com', '240-555-1132', 'Rockville', 'MD', 'https://resumes.storage.com/2132_mason.pdf'),
(2133, 'Brandon', 'Dunn', 'brandon.dunn@gmail.com', '571-555-1133', 'Herndon', 'VA', 'https://resumes.storage.com/2133_dunn.pdf'),
(2134, 'Ann', 'Berry', 'ann.berry@outlook.com', '202-555-1134', 'Washington', 'DC', 'https://resumes.storage.com/2134_berry.pdf'),
(2135, 'Albert', 'Simpson', 'albert.simpson@gmail.com', '415-555-1135', 'San Francisco', 'CA', 'https://resumes.storage.com/2135_simpson.pdf'),
(2136, 'Jean', 'Fox', 'jean.fox@yahoo.com', '703-555-1136', 'Fairfax', 'VA', 'https://resumes.storage.com/2136_fox.pdf'),
(2137, 'Erica', 'Oliver', 'erica.oliver@icloud.com', '301-555-1137', 'Silver Spring', 'MD', 'https://resumes.storage.com/2137_oliver.pdf'),
(2138, 'Joshua', 'Chavez', 'joshua.chavez@gmail.com', '571-555-1138', 'Arlington', 'VA', 'https://resumes.storage.com/2138_chavez.pdf'),
(2139, 'Denise', 'Porter', 'denise.porter@outlook.com', '202-555-1139', 'Washington', 'DC', 'https://resumes.storage.com/2139_porter.pdf'),
(2140, 'Sean', 'Hunter', 'sean.hunter@gmail.com', '512-555-1140', 'Austin', 'TX', 'https://resumes.storage.com/2140_hunter.pdf'),
(2141, 'Marie', 'Hicks', 'marie.hicks@yahoo.com', '703-555-1141', 'Alexandria', 'VA', 'https://resumes.storage.com/2141_hicks.pdf'),
(2142, 'Douglas', 'Crawford', 'douglas.crawford@icloud.com', '240-555-1142', 'Bethesda', 'MD', 'https://resumes.storage.com/2142_crawford.pdf'),
(2143, 'Shirley', 'Henry', 'shirley.henry@gmail.com', '571-555-1143', 'Reston', 'VA', 'https://resumes.storage.com/2143_henry.pdf'),
(2144, 'Harold', 'Boyd', 'harold.boyd@outlook.com', '202-555-1144', 'Washington', 'DC', 'https://resumes.storage.com/2144_boyd.pdf'),
(2145, 'Diane', 'Warren', 'diane.warren@gmail.com', '617-555-1145', 'Boston', 'MA', 'https://resumes.storage.com/2145_warren.pdf'),
(2146, 'Clarence', 'Morales', 'clarence.morales@yahoo.com', '703-555-1146', 'Arlington', 'VA', 'https://resumes.storage.com/2146_morales.pdf'),
(2147, 'Lillian', 'Kennedy', 'lillian.kennedy@icloud.com', '301-555-1147', 'Rockville', 'MD', 'https://resumes.storage.com/2147_kennedy.pdf'),
(2148, 'Alan', 'Dixon', 'alan.dixon@gmail.com', '571-555-1148', 'Fairfax', 'VA', 'https://resumes.storage.com/2148_dixon.pdf'),
(2149, 'Irene', 'Ramos', 'irene.ramos@outlook.com', '202-555-1149', 'Washington', 'DC', 'https://resumes.storage.com/2149_ramos.pdf'),
(2150, 'Noah', 'Reynolds', 'noah.reynolds@gmail.com', '206-555-1150', 'Seattle', 'WA', 'https://resumes.storage.com/2150_reynolds.pdf'),
(2151, 'Ruby', 'Burns', 'ruby.burns@yahoo.com', '703-555-1151', 'Alexandria', 'VA', 'https://resumes.storage.com/2151_burns.pdf'),
(2152, 'Harry', 'Gordon', 'harry.gordon@icloud.com', '240-555-1152', 'Silver Spring', 'MD', 'https://resumes.storage.com/2152_gordon.pdf'),
(2153, 'Janice', 'Shaw', 'janice.shaw@gmail.com', '571-555-1153', 'Arlington', 'VA', 'https://resumes.storage.com/2153_shaw.pdf'),
(2154, 'Ernest', 'Holmes', 'ernest.holmes@outlook.com', '202-555-1154', 'Washington', 'DC', 'https://resumes.storage.com/2154_holmes.pdf'),
(2155, 'Mildred', 'Rice', 'mildred.rice@gmail.com', '303-555-1155', 'Denver', 'CO', 'https://resumes.storage.com/2155_rice.pdf'),
(2156, 'Jonathan', 'Snyder', 'jonathan.snyder@yahoo.com', '703-555-1156', 'Falls Church', 'VA', 'https://resumes.storage.com/2156_snyder.pdf'),
(2157, 'Julia', 'Daniels', 'julia.daniels@icloud.com', '301-555-1157', 'Bethesda', 'MD', 'https://resumes.storage.com/2157_daniels.pdf'),
(2158, 'Phillip', 'Robertson', 'phillip.robertson@gmail.com', '571-555-1158', 'Reston', 'VA', 'https://resumes.storage.com/2158_robertson.pdf'),
(2159, 'Rose', 'Collins', 'rose.collins@outlook.com', '202-555-1159', 'Washington', 'DC', 'https://resumes.storage.com/2159_collins.pdf'),
(2160, 'Jesse', 'Hart', 'jesse.hart@gmail.com', '404-555-1160', 'Atlanta', 'GA', 'https://resumes.storage.com/2160_hart.pdf'),
(2161, 'Norma', 'Stone', 'norma.stone@yahoo.com', '703-555-1161', 'Arlington', 'VA', 'https://resumes.storage.com/2161_stone.pdf'),
(2162, 'Earl', 'Woods', 'earl.woods@icloud.com', '240-555-1162', 'Gaithersburg', 'MD', 'https://resumes.storage.com/2162_woods.pdf'),
(2163, 'Rebecca', 'Kennedy', 'rebecca.kennedy@gmail.com', '571-555-1163', 'Alexandria', 'VA', 'https://resumes.storage.com/2163_kennedy.pdf'),
(2164, 'Kyle', 'Medina', 'kyle.medina@outlook.com', '202-555-1164', 'Washington', 'DC', 'https://resumes.storage.com/2164_medina.pdf'),
(2165, 'Gladys', 'Stevens', 'gladys.stevens@gmail.com', '212-555-1165', 'New York', 'NY', 'https://resumes.storage.com/2165_stevens.pdf'),
(2166, 'Antonio', 'Tucker', 'antonio.tucker@yahoo.com', '703-555-1166', 'Fairfax', 'VA', 'https://resumes.storage.com/2166_tucker.pdf'),
(2167, 'Yolanda', 'Webb', 'yolanda.webb@icloud.com', '301-555-1167', 'Silver Spring', 'MD', 'https://resumes.storage.com/2167_webb.pdf'),
(2168, 'Carlos', 'Fowler', 'carlos.fowler@gmail.com', '571-555-1168', 'Arlington', 'VA', 'https://resumes.storage.com/2168_fowler.pdf'),
(2169, 'Beth', 'Garza', 'beth.garza@outlook.com', '202-555-1169', 'Washington', 'DC', 'https://resumes.storage.com/2169_garza.pdf'),
(2170, 'Glenn', 'Hawkins', 'glenn.hawkins@gmail.com', '312-555-1170', 'Chicago', 'IL', 'https://resumes.storage.com/2170_hawkins.pdf'),
(2171, 'Crystal', 'Hunter', 'crystal.hunter@yahoo.com', '703-555-1171', 'Alexandria', 'VA', 'https://resumes.storage.com/2171_hunter.pdf'),
(2172, 'Fred', 'Perkins', 'fred.perkins@icloud.com', '240-555-1172', 'Rockville', 'MD', 'https://resumes.storage.com/2172_perkins.pdf'),
(2173, 'Wanda', 'Matthews', 'wanda.matthews@gmail.com', '571-555-1173', 'Herndon', 'VA', 'https://resumes.storage.com/2173_matthews.pdf'),
(2174, 'Oscar', 'Arnold', 'oscar.arnold@outlook.com', '202-555-1174', 'Washington', 'DC', 'https://resumes.storage.com/2174_arnold.pdf'),
(2175, 'Connie', 'Wagner', 'connie.wagner@gmail.com', '415-555-1175', 'San Francisco', 'CA', 'https://resumes.storage.com/2175_wagner.pdf'),
(2176, 'Darlene', 'Mills', 'darlene.mills@yahoo.com', '703-555-1176', 'Fairfax', 'VA', 'https://resumes.storage.com/2176_mills.pdf'),
(2177, 'Travis', 'Warren', 'travis.warren@icloud.com', '301-555-1177', 'Bethesda', 'MD', 'https://resumes.storage.com/2177_warren.pdf'),
(2178, 'Vicki', 'Burke', 'vicki.burke@gmail.com', '571-555-1178', 'Arlington', 'VA', 'https://resumes.storage.com/2178_burke.pdf'),
(2179, 'Cory', 'Day', 'cory.day@outlook.com', '202-555-1179', 'Washington', 'DC', 'https://resumes.storage.com/2179_day.pdf'),
(2180, 'Wendy', 'Rose', 'wendy.rose@gmail.com', '512-555-1180', 'Austin', 'TX', 'https://resumes.storage.com/2180_rose.pdf'),
(2181, 'Clayton', 'Elliott', 'clayton.elliott@yahoo.com', '703-555-1181', 'Alexandria', 'VA', 'https://resumes.storage.com/2181_elliott.pdf'),
(2182, 'Elaine', 'Jacobs', 'elaine.jacobs@icloud.com', '240-555-1182', 'Silver Spring', 'MD', 'https://resumes.storage.com/2182_jacobs.pdf'),
(2183, 'Darrell', 'Graham', 'darrell.graham@gmail.com', '571-555-1183', 'Reston', 'VA', 'https://resumes.storage.com/2183_graham.pdf'),
(2184, 'Sylvia', 'Larson', 'sylvia.larson@outlook.com', '202-555-1184', 'Washington', 'DC', 'https://resumes.storage.com/2184_larson.pdf'),
(2185, 'Jeffery', 'Gilbert', 'jeffery.gilbert@gmail.com', '617-555-1185', 'Boston', 'MA', 'https://resumes.storage.com/2185_gilbert.pdf'),
(2186, 'Nina', 'Fuller', 'nina.fuller@yahoo.com', '703-555-1186', 'Arlington', 'VA', 'https://resumes.storage.com/2186_fuller.pdf'),
(2187, 'Duane', 'George', 'duane.george@icloud.com', '301-555-1187', 'Rockville', 'MD', 'https://resumes.storage.com/2187_george.pdf'),
(2188, 'Maggie', 'Reyes', 'maggie.reyes@gmail.com', '571-555-1188', 'Fairfax', 'VA', 'https://resumes.storage.com/2188_reyes.pdf'),
(2189, 'Lee', 'Garrett', 'lee.garrett@outlook.com', '202-555-1189', 'Washington', 'DC', 'https://resumes.storage.com/2189_garrett.pdf'),
(2190, 'Max', 'Romero', 'max.romero@gmail.com', '206-555-1190', 'Seattle', 'WA', 'https://resumes.storage.com/2190_romero.pdf'),
(2191, 'Monica', 'Kim', 'monica.kim@yahoo.com', '703-555-1191', 'Alexandria', 'VA', 'https://resumes.storage.com/2191_kim.pdf'),
(2192, 'Shane', 'Welch', 'shane.welch@icloud.com', '240-555-1192', 'Bethesda', 'MD', 'https://resumes.storage.com/2192_welch.pdf'),
(2193, 'Rodney', 'Hanson', 'rodney.hanson@gmail.com', '571-555-1193', 'Arlington', 'VA', 'https://resumes.storage.com/2193_hanson.pdf'),
(2194, 'Heidi', 'Grant', 'heidi.grant@outlook.com', '202-555-1194', 'Washington', 'DC', 'https://resumes.storage.com/2194_grant.pdf'),
(2195, 'Clifford', 'Knight', 'clifford.knight@gmail.com', '303-555-1195', 'Denver', 'CO', 'https://resumes.storage.com/2195_knight.pdf'),
(2196, 'Gilbert', 'Goodman', 'gilbert.goodman@yahoo.com', '703-555-1196', 'Falls Church', 'VA', 'https://resumes.storage.com/2196_goodman.pdf'),
(2197, 'Dianne', 'Gregory', 'dianne.gregory@icloud.com', '301-555-1197', 'Silver Spring', 'MD', 'https://resumes.storage.com/2197_gregory.pdf'),
(2198, 'Marion', 'Walters', 'marion.walters@gmail.com', '571-555-1198', 'Reston', 'VA', 'https://resumes.storage.com/2198_walters.pdf'),
(2199, 'Tracy', 'Webb', 'tracy.webb@outlook.com', '202-555-1199', 'Washington', 'DC', 'https://resumes.storage.com/2199_webb.pdf'),
(2200, 'Seth', 'Lucas', 'seth.lucas@gmail.com', '404-555-1200', 'Atlanta', 'GA', 'https://resumes.storage.com/2200_lucas.pdf'),
(2201, 'Lydia', 'Holland', 'lydia.holland@yahoo.com', '703-555-1201', 'Arlington', 'VA', 'https://resumes.storage.com/2201_holland.pdf'),
(2202, 'Kent', 'Douglas', 'kent.douglas@icloud.com', '240-555-1202', 'Gaithersburg', 'MD', 'https://resumes.storage.com/2202_douglas.pdf'),
(2203, 'Jeanne', 'Fleming', 'jeanne.fleming@gmail.com', '571-555-1203', 'Alexandria', 'VA', 'https://resumes.storage.com/2203_fleming.pdf'),
(2204, 'Alfred', 'Jensen', 'alfred.jensen@outlook.com', '202-555-1204', 'Washington', 'DC', 'https://resumes.storage.com/2204_jensen.pdf'),
(2205, 'Vernon', 'Vargas', 'vernon.vargas@gmail.com', '212-555-1205', 'New York', 'NY', 'https://resumes.storage.com/2205_vargas.pdf'),
(2206, 'Sue', 'Byrd', 'sue.byrd@yahoo.com', '703-555-1206', 'Fairfax', 'VA', 'https://resumes.storage.com/2206_byrd.pdf'),
(2207, 'Constance', 'Davidson', 'constance.davidson@icloud.com', '301-555-1207', 'Bethesda', 'MD', 'https://resumes.storage.com/2207_davidson.pdf'),
(2208, 'Francisco', 'Hopkins', 'francisco.hopkins@gmail.com', '571-555-1208', 'Arlington', 'VA', 'https://resumes.storage.com/2208_hopkins.pdf'),
(2209, 'Shelly', 'May', 'shelly.may@outlook.com', '202-555-1209', 'Washington', 'DC', 'https://resumes.storage.com/2209_may.pdf'),
(2210, 'Terrence', 'Terry', 'terrence.terry@gmail.com', '312-555-1210', 'Chicago', 'IL', 'https://resumes.storage.com/2210_terry.pdf'),
(2211, 'Marc', 'Herrera', 'marc.herrera@yahoo.com', '703-555-1211', 'Alexandria', 'VA', 'https://resumes.storage.com/2211_herrera.pdf'),
(2212, 'Sherri', 'Wade', 'sherri.wade@icloud.com', '240-555-1212', 'Rockville', 'MD', 'https://resumes.storage.com/2212_wade.pdf'),
(2213, 'Levi', 'Sutton', 'levi.sutton@gmail.com', '571-555-1213', 'Herndon', 'VA', 'https://resumes.storage.com/2213_sutton.pdf'),
(2214, 'Ora', 'Ball', 'ora.ball@outlook.com', '202-555-1214', 'Washington', 'DC', 'https://resumes.storage.com/2214_ball.pdf'),
(2215, 'Jackie', 'Little', 'jackie.little@gmail.com', '415-555-1215', 'San Francisco', 'CA', 'https://resumes.storage.com/2215_little.pdf'),
(2216, 'Brent', 'Caldwell', 'brent.caldwell@yahoo.com', '703-555-1216', 'Fairfax', 'VA', 'https://resumes.storage.com/2216_caldwell.pdf'),
(2217, 'Brenda', 'Miles', 'brenda.miles@icloud.com', '301-555-1217', 'Silver Spring', 'MD', 'https://resumes.storage.com/2217_miles.pdf'),
(2218, 'Derrick', 'Swanson', 'derrick.swanson@gmail.com', '571-555-1218', 'Arlington', 'VA', 'https://resumes.storage.com/2218_swanson.pdf'),
(2219, 'Kristen', 'Case', 'kristen.case@outlook.com', '202-555-1219', 'Washington', 'DC', 'https://resumes.storage.com/2219_case.pdf'),
(2220, 'Damon', 'Lowe', 'damon.lowe@gmail.com', '512-555-1220', 'Austin', 'TX', 'https://resumes.storage.com/2220_lowe.pdf'),
(2221, 'Loretta', 'Newman', 'loretta.newman@yahoo.com', '703-555-1221', 'Alexandria', 'VA', 'https://resumes.storage.com/2221_newman.pdf'),
(2222, 'Floyd', 'Figueroa', 'floyd.figueroa@icloud.com', '240-555-1222', 'Bethesda', 'MD', 'https://resumes.storage.com/2222_figueroa.pdf'),
(2223, 'Eileen', 'Patton', 'eileen.patton@gmail.com', '571-555-1223', 'Reston', 'VA', 'https://resumes.storage.com/2223_patton.pdf'),
(2224, 'Rene', 'Patrick', 'rene.patrick@outlook.com', '202-555-1224', 'Washington', 'DC', 'https://resumes.storage.com/2224_patrick.pdf'),
(2225, 'Misty', 'Hogan', 'misty.hogan@gmail.com', '617-555-1225', 'Boston', 'MA', 'https://resumes.storage.com/2225_hogan.pdf'),
(2226, 'Van', 'Bowers', 'van.bowers@yahoo.com', '703-555-1226', 'Arlington', 'VA', 'https://resumes.storage.com/2226_bowers.pdf'),
(2227, 'Glenda', 'Farmer', 'glenda.farmer@icloud.com', '301-555-1227', 'Rockville', 'MD', 'https://resumes.storage.com/2227_farmer.pdf'),
(2228, 'Leo', 'Lamb', 'leo.lamb@gmail.com', '571-555-1228', 'Fairfax', 'VA', 'https://resumes.storage.com/2228_lamb.pdf'),
(2229, 'Tonya', 'Mccarthy', 'tonya.mccarthy@outlook.com', '202-555-1229', 'Washington', 'DC', 'https://resumes.storage.com/2229_mccarthy.pdf'),
(2230, 'Franklin', 'Strickland', 'franklin.strickland@gmail.com', '206-555-1230', 'Seattle', 'WA', 'https://resumes.storage.com/2230_strickland.pdf'),
(2231, 'Sabrina', 'Navarro', 'sabrina.navarro@yahoo.com', '703-555-1231', 'Alexandria', 'VA', 'https://resumes.storage.com/2231_navarro.pdf'),
(2232, 'Daryl', 'Townsend', 'daryl.townsend@icloud.com', '240-555-1232', 'Silver Spring', 'MD', 'https://resumes.storage.com/2232_townsend.pdf'),
(2233, 'Blanca', 'Wise', 'blanca.wise@gmail.com', '571-555-1233', 'Arlington', 'VA', 'https://resumes.storage.com/2233_wise.pdf'),
(2234, 'Neil', 'Dalton', 'neil.dalton@outlook.com', '202-555-1234', 'Washington', 'DC', 'https://resumes.storage.com/2234_dalton.pdf'),
(2235, 'Ervin', 'Barton', 'ervin.barton@gmail.com', '303-555-1235', 'Denver', 'CO', 'https://resumes.storage.com/2235_barton.pdf'),
(2236, 'Kelli', 'Chan', 'kelli.chan@yahoo.com', '703-555-1236', 'Falls Church', 'VA', 'https://resumes.storage.com/2236_chan.pdf'),
(2237, 'Wilbur', 'Manning', 'wilbur.manning@icloud.com', '301-555-1237', 'Bethesda', 'MD', 'https://resumes.storage.com/2237_manning.pdf'),
(2238, 'Tabitha', 'Cohen', 'tabitha.cohen@gmail.com', '571-555-1238', 'Reston', 'VA', 'https://resumes.storage.com/2238_cohen.pdf'),
(2239, 'Pat', 'Mcdaniel', 'pat.mcdaniel@outlook.com', '202-555-1239', 'Washington', 'DC', 'https://resumes.storage.com/2239_mcdaniel.pdf'),
(2240, 'Melvin', 'Phelps', 'melvin.phelps@gmail.com', '404-555-1240', 'Atlanta', 'GA', 'https://resumes.storage.com/2240_phelps.pdf'),
(2241, 'Dana', 'Haynes', 'dana.haynes@yahoo.com', '703-555-1241', 'Arlington', 'VA', 'https://resumes.storage.com/2241_haynes.pdf'),
(2242, 'Jodi', 'Obrien', 'jodi.obrien@icloud.com', '240-555-1242', 'Gaithersburg', 'MD', 'https://resumes.storage.com/2242_obrien.pdf'),
(2243, 'Tommie', 'Watts', 'tommie.watts@gmail.com', '571-555-1243', 'Alexandria', 'VA', 'https://resumes.storage.com/2243_watts.pdf'),
(2244, 'Kurt', 'Vaughn', 'kurt.vaughn@outlook.com', '202-555-1244', 'Washington', 'DC', 'https://resumes.storage.com/2244_vaughn.pdf'),
(2245, 'Regina', 'Love', 'regina.love@gmail.com', '212-555-1245', 'New York', 'NY', 'https://resumes.storage.com/2245_love.pdf'),
(2246, 'Darin', 'Cain', 'darin.cain@yahoo.com', '703-555-1246', 'Fairfax', 'VA', 'https://resumes.storage.com/2246_cain.pdf'),
(2247, 'Holly', 'Hale', 'holly.hale@icloud.com', '301-555-1247', 'Silver Spring', 'MD', 'https://resumes.storage.com/2247_hale.pdf'),
(2248, 'Angelo', 'Richard', 'angelo.richard@gmail.com', '571-555-1248', 'Arlington', 'VA', 'https://resumes.storage.com/2248_richard.pdf'),
(2249, 'Desiree', 'Nash', 'desiree.nash@outlook.com', '202-555-1249', 'Washington', 'DC', 'https://resumes.storage.com/2249_nash.pdf'),
(2250, 'Krystal', 'Wilkins', 'krystal.wilkins@gmail.com', '312-555-1250', 'Chicago', 'IL', 'https://resumes.storage.com/2250_wilkins.pdf'),
(2251, 'Cecilia', 'Bridges', 'cecilia.bridges@yahoo.com', '703-555-1251', 'Alexandria', 'VA', 'https://resumes.storage.com/2251_bridges.pdf'),
(2252, 'Alvin', 'Barker', 'alvin.barker@icloud.com', '240-555-1252', 'Rockville', 'MD', 'https://resumes.storage.com/2252_barker.pdf'),
(2253, 'Tim', 'Wolf', 'tim.wolf@gmail.com', '571-555-1253', 'Herndon', 'VA', 'https://resumes.storage.com/2253_wolf.pdf'),
(2254, 'Everett', 'Valdez', 'everett.valdez@outlook.com', '202-555-1254', 'Washington', 'DC', 'https://resumes.storage.com/2254_valdez.pdf'),
(2255, 'Hope', 'England', 'hope.england@gmail.com', '415-555-1255', 'San Francisco', 'CA', 'https://resumes.storage.com/2255_england.pdf'),
(2256, 'Gwendolyn', 'Bradford', 'gwendolyn.bradford@yahoo.com', '703-555-1256', 'Fairfax', 'VA', 'https://resumes.storage.com/2256_bradford.pdf'),
(2257, 'Darnell', 'Kirby', 'darnell.kirby@icloud.com', '301-555-1257', 'Bethesda', 'MD', 'https://resumes.storage.com/2257_kirby.pdf'),
(2258, 'Jerome', 'Flowers', 'jerome.flowers@gmail.com', '571-555-1258', 'Arlington', 'VA', 'https://resumes.storage.com/2258_flowers.pdf'),
(2259, 'Kristi', 'Downs', 'kristi.downs@outlook.com', '202-555-1259', 'Washington', 'DC', 'https://resumes.storage.com/2259_downs.pdf'),
(2260, 'Leon', 'Hoover', 'leon.hoover@gmail.com', '512-555-1260', 'Austin', 'TX', 'https://resumes.storage.com/2260_hoover.pdf'),
(2261, 'Stacy', 'Pugh', 'stacy.pugh@yahoo.com', '703-555-1261', 'Alexandria', 'VA', 'https://resumes.storage.com/2261_pugh.pdf'),
(2262, 'Elmer', 'Short', 'elmer.short@icloud.com', '240-555-1262', 'Silver Spring', 'MD', 'https://resumes.storage.com/2262_short.pdf'),
(2263, 'Raul', 'Brady', 'raul.brady@gmail.com', '571-555-1263', 'Reston', 'VA', 'https://resumes.storage.com/2263_brady.pdf'),
(2264, 'Brandi', 'Miranda', 'brandi.miranda@outlook.com', '202-555-1264', 'Washington', 'DC', 'https://resumes.storage.com/2264_miranda.pdf'),
(2265, 'Rogelio', 'Mosley', 'rogelio.mosley@gmail.com', '617-555-1265', 'Boston', 'MA', 'https://resumes.storage.com/2265_mosley.pdf'),
(2266, 'Stuart', 'Pham', 'stuart.pham@yahoo.com', '703-555-1266', 'Arlington', 'VA', 'https://resumes.storage.com/2266_pham.pdf'),
(2267, 'Wilma', 'Costa', 'wilma.costa@icloud.com', '301-555-1267', 'Rockville', 'MD', 'https://resumes.storage.com/2267_costa.pdf'),
(2268, 'Lonnie', 'Herman', 'lonnie.herman@gmail.com', '571-555-1268', 'Fairfax', 'VA', 'https://resumes.storage.com/2268_herman.pdf'),
(2269, 'Latoya', 'Sheppard', 'latoya.sheppard@outlook.com', '202-555-1269', 'Washington', 'DC', 'https://resumes.storage.com/2269_sheppard.pdf'),
(2270, 'Doyle', 'Hubbard', 'doyle.hubbard@gmail.com', '206-555-1270', 'Seattle', 'WA', 'https://resumes.storage.com/2270_hubbard.pdf'),
(2271, 'Santos', 'Cervantes', 'santos.cervantes@yahoo.com', '703-555-1271', 'Alexandria', 'VA', 'https://resumes.storage.com/2271_cervantes.pdf'),
(2272, 'Whitney', 'Weeks', 'whitney.weeks@icloud.com', '240-555-1272', 'Bethesda', 'MD', 'https://resumes.storage.com/2272_weeks.pdf'),
(2273, 'Ramon', 'Kramer', 'ramon.kramer@gmail.com', '571-555-1273', 'Arlington', 'VA', 'https://resumes.storage.com/2273_kramer.pdf'),
(2274, 'Sonja', 'Heath', 'sonja.heath@outlook.com', '202-555-1274', 'Washington', 'DC', 'https://resumes.storage.com/2274_heath.pdf'),
(2275, 'Cedric', 'Robles', 'cedric.robles@gmail.com', '303-555-1275', 'Denver', 'CO', 'https://resumes.storage.com/2275_robles.pdf'),
(2276, 'Deanna', 'Dudley', 'deanna.dudley@yahoo.com', '703-555-1276', 'Falls Church', 'VA', 'https://resumes.storage.com/2276_dudley.pdf'),
(2277, 'Noel', 'Duke', 'noel.duke@icloud.com', '301-555-1277', 'Silver Spring', 'MD', 'https://resumes.storage.com/2277_duke.pdf'),
(2278, 'Roland', 'Walter', 'roland.walter@gmail.com', '571-555-1278', 'Reston', 'VA', 'https://resumes.storage.com/2278_walter.pdf'),
(2279, 'Fredrick', 'Hardy', 'fredrick.hardy@outlook.com', '202-555-1279', 'Washington', 'DC', 'https://resumes.storage.com/2279_hardy.pdf'),
(2280, 'Kerry', 'Walsh', 'kerry.walsh@gmail.com', '404-555-1280', 'Atlanta', 'GA', 'https://resumes.storage.com/2280_walsh.pdf'),
(2281, 'Jasmine', 'Contreras', 'jasmine.contreras@yahoo.com', '703-555-1281', 'Arlington', 'VA', 'https://resumes.storage.com/2281_contreras.pdf'),
(2282, 'Alonzo', 'Guerra', 'alonzo.guerra@icloud.com', '240-555-1282', 'Gaithersburg', 'MD', 'https://resumes.storage.com/2282_guerra.pdf'),
(2283, 'Traci', 'Cannon', 'traci.cannon@gmail.com', '571-555-1283', 'Alexandria', 'VA', 'https://resumes.storage.com/2283_cannon.pdf'),
(2284, 'Reynaldo', 'Guerrero', 'reynaldo.guerrero@outlook.com', '202-555-1284', 'Washington', 'DC', 'https://resumes.storage.com/2284_guerrero.pdf'),
(2285, 'Guadalupe', 'Mack', 'guadalupe.mack@gmail.com', '212-555-1285', 'New York', 'NY', 'https://resumes.storage.com/2285_mack.pdf'),
(2286, 'Dwayne', 'Pollard', 'dwayne.pollard@yahoo.com', '703-555-1286', 'Fairfax', 'VA', 'https://resumes.storage.com/2286_pollard.pdf'),
(2287, 'Joann', 'Stanton', 'joann.stanton@icloud.com', '301-555-1287', 'Bethesda', 'MD', 'https://resumes.storage.com/2287_stanton.pdf'),
(2288, 'Kristine', 'Robbins', 'kristine.robbins@gmail.com', '571-555-1288', 'Arlington', 'VA', 'https://resumes.storage.com/2288_robbins.pdf'),
(2289, 'Israel', 'Gibbs', 'israel.gibbs@outlook.com', '202-555-1289', 'Washington', 'DC', 'https://resumes.storage.com/2289_gibbs.pdf'),
(2290, 'Doreen', 'Boone', 'doreen.boone@gmail.com', '312-555-1290', 'Chicago', 'IL', 'https://resumes.storage.com/2290_boone.pdf'),
(2291, 'Ellis', 'Reed', 'ellis.reed@yahoo.com', '703-555-1291', 'Alexandria', 'VA', 'https://resumes.storage.com/2291_reed.pdf'),
(2292, 'Ignacio', 'Mcbride', 'ignacio.mcbride@icloud.com', '240-555-1292', 'Rockville', 'MD', 'https://resumes.storage.com/2292_mcbride.pdf'),
(2293, 'Kari', 'Higgins', 'kari.higgins@gmail.com', '571-555-1293', 'Herndon', 'VA', 'https://resumes.storage.com/2293_higgins.pdf'),
(2294, 'Delores', 'Blair', 'delores.blair@outlook.com', '202-555-1294', 'Washington', 'DC', 'https://resumes.storage.com/2294_blair.pdf'),
(2295, 'Waldo', 'Olsen', 'waldo.olsen@gmail.com', '415-555-1295', 'San Francisco', 'CA', 'https://resumes.storage.com/2295_olsen.pdf'),
(2296, 'Esther', 'Chen', 'esther.chen@yahoo.com', '703-555-1296', 'Fairfax', 'VA', 'https://resumes.storage.com/2296_chen.pdf'),
(2297, 'Dina', 'Serrano', 'dina.serrano@icloud.com', '301-555-1297', 'Silver Spring', 'MD', 'https://resumes.storage.com/2297_serrano.pdf'),
(2298, 'Emilio', 'Peters', 'emilio.peters@gmail.com', '571-555-1298', 'Arlington', 'VA', 'https://resumes.storage.com/2298_peters.pdf'),
(2299, 'Mona', 'Chase', 'mona.chase@outlook.com', '202-555-1299', 'Washington', 'DC', 'https://resumes.storage.com/2299_chase.pdf'),
(2300, 'Everette', 'Hodge', 'everette.hodge@gmail.com', '512-555-1300', 'Austin', 'TX', 'https://resumes.storage.com/2300_hodge.pdf'),
(2301, 'Kendra', 'Lynn', 'kendra.lynn@yahoo.com', '703-555-1301', 'Alexandria', 'VA', 'https://resumes.storage.com/2301_lynn.pdf'),
(2302, 'Cornell', 'Yates', 'cornell.yates@icloud.com', '240-555-1302', 'Bethesda', 'MD', 'https://resumes.storage.com/2302_yates.pdf'),
(2303, 'Terra', 'Osborne', 'terra.osborne@gmail.com', '571-555-1303', 'Reston', 'VA', 'https://resumes.storage.com/2303_osborne.pdf'),
(2304, 'Efrain', 'Joyce', 'efrain.joyce@outlook.com', '202-555-1304', 'Washington', 'DC', 'https://resumes.storage.com/2304_joyce.pdf'),
(2305, 'Gale', 'Mckinney', 'gale.mckinney@gmail.com', '617-555-1305', 'Boston', 'MA', 'https://resumes.storage.com/2305_mckinney.pdf'),
(2306, 'Rolando', 'Horn', 'rolando.horn@yahoo.com', '703-555-1306', 'Arlington', 'VA', 'https://resumes.storage.com/2306_horn.pdf'),
(2307, 'Trisha', 'Rich', 'trisha.rich@icloud.com', '301-555-1307', 'Rockville', 'MD', 'https://resumes.storage.com/2307_rich.pdf'),
(2308, 'Horace', 'Horton', 'horace.horton@gmail.com', '571-555-1308', 'Fairfax', 'VA', 'https://resumes.storage.com/2308_horton.pdf'),
(2309, 'Anita', 'Mclean', 'anita.mclean@outlook.com', '202-555-1309', 'Washington', 'DC', 'https://resumes.storage.com/2309_mclean.pdf'),
(2310, 'Willard', 'Mccormick', 'willard.mccormick@gmail.com', '206-555-1310', 'Seattle', 'WA', 'https://resumes.storage.com/2310_mccormick.pdf'),
(2311, 'Janie', 'Woodward', 'janie.woodward@yahoo.com', '703-555-1311', 'Alexandria', 'VA', 'https://resumes.storage.com/2311_woodward.pdf'),
(2312, 'Malcolm', 'Randolph', 'malcolm.randolph@icloud.com', '240-555-1312', 'Silver Spring', 'MD', 'https://resumes.storage.com/2312_randolph.pdf'),
(2313, 'Earnest', 'Poole', 'earnest.poole@gmail.com', '571-555-1313', 'Arlington', 'VA', 'https://resumes.storage.com/2313_poole.pdf'),
(2314, 'Rosetta', 'Waller', 'rosetta.waller@outlook.com', '202-555-1314', 'Washington', 'DC', 'https://resumes.storage.com/2314_waller.pdf'),
(2315, 'Myron', 'Gentry', 'myron.gentry@gmail.com', '303-555-1315', 'Denver', 'CO', 'https://resumes.storage.com/2315_gentry.pdf'),
(2316, 'Lana', 'Pacheco', 'lana.pacheco@yahoo.com', '703-555-1316', 'Falls Church', 'VA', 'https://resumes.storage.com/2316_pacheco.pdf'),
(2317, 'Jimmie', 'Potter', 'jimmie.potter@icloud.com', '301-555-1317', 'Bethesda', 'MD', 'https://resumes.storage.com/2317_potter.pdf'),
(2318, 'Dora', 'Salas', 'dora.salas@gmail.com', '571-555-1318', 'Reston', 'VA', 'https://resumes.storage.com/2318_salas.pdf'),
(2319, 'Cornell', 'Atkins', 'cornell.atkins@outlook.com', '202-555-1319', 'Washington', 'DC', 'https://resumes.storage.com/2319_atkins.pdf'),
(2320, 'Krista', 'Michael', 'krista.michael@gmail.com', '404-555-1320', 'Atlanta', 'GA', 'https://resumes.storage.com/2320_michael.pdf'),
(2321, 'Rochelle', 'Stuart', 'rochelle.stuart@yahoo.com', '703-555-1321', 'Arlington', 'VA', 'https://resumes.storage.com/2321_stuart.pdf'),
(2322, 'Efren', 'Farrell', 'efren.farrell@icloud.com', '240-555-1322', 'Gaithersburg', 'MD', 'https://resumes.storage.com/2322_farrell.pdf'),
(2323, 'Marci', 'Trujillo', 'marci.trujillo@gmail.com', '571-555-1323', 'Alexandria', 'VA', 'https://resumes.storage.com/2323_trujillo.pdf'),
(2324, 'Domingo', 'Lang', 'domingo.lang@outlook.com', '202-555-1324', 'Washington', 'DC', 'https://resumes.storage.com/2324_lang.pdf'),
(2325, 'Minerva', 'Bentley', 'minerva.bentley@gmail.com', '212-555-1325', 'New York', 'NY', 'https://resumes.storage.com/2325_bentley.pdf'),
(2326, 'Elvia', 'Rowe', 'elvia.rowe@yahoo.com', '703-555-1326', 'Fairfax', 'VA', 'https://resumes.storage.com/2326_rowe.pdf'),
(2327, 'Jeri', 'Mercado', 'jeri.mercado@icloud.com', '301-555-1327', 'Silver Spring', 'MD', 'https://resumes.storage.com/2327_mercado.pdf'),
(2328, 'Forrest', 'Valenzuela', 'forrest.valenzuela@gmail.com', '571-555-1328', 'Arlington', 'VA', 'https://resumes.storage.com/2328_valenzuela.pdf'),
(2329, 'Jillian', 'Callahan', 'jillian.callahan@outlook.com', '202-555-1329', 'Washington', 'DC', 'https://resumes.storage.com/2329_callahan.pdf'),
(2330, 'Antonia', 'Knox', 'antonia.knox@gmail.com', '312-555-1330', 'Chicago', 'IL', 'https://resumes.storage.com/2330_knox.pdf'),
(2331, 'Hubert', 'Pate', 'hubert.pate@yahoo.com', '703-555-1331', 'Alexandria', 'VA', 'https://resumes.storage.com/2331_pate.pdf'),
(2332, 'Sonya', 'Frye', 'sonya.frye@icloud.com', '240-555-1332', 'Rockville', 'MD', 'https://resumes.storage.com/2332_frye.pdf'),
(2333, 'Stacie', 'Buckley', 'stacie.buckley@gmail.com', '571-555-1333', 'Herndon', 'VA', 'https://resumes.storage.com/2333_buckley.pdf'),
(2334, 'Avis', 'Chang', 'avis.chang@outlook.com', '202-555-1334', 'Washington', 'DC', 'https://resumes.storage.com/2334_chang.pdf'),
(2335, 'Colleen', 'Rivers', 'colleen.rivers@gmail.com', '415-555-1335', 'San Francisco', 'CA', 'https://resumes.storage.com/2335_rivers.pdf'),
(2336, 'Gayle', 'Oconnell', 'gayle.oconnell@yahoo.com', '703-555-1336', 'Fairfax', 'VA', 'https://resumes.storage.com/2336_oconnell.pdf'),
(2337, 'Chandra', 'Bauer', 'chandra.bauer@icloud.com', '301-555-1337', 'Bethesda', 'MD', 'https://resumes.storage.com/2337_bauer.pdf'),
(2338, 'Lila', 'Donovan', 'lila.donovan@gmail.com', '571-555-1338', 'Arlington', 'VA', 'https://resumes.storage.com/2338_donovan.pdf'),
(2339, 'Letitia', 'Hardin', 'letitia.hardin@outlook.com', '202-555-1339', 'Washington', 'DC', 'https://resumes.storage.com/2339_hardin.pdf'),
(2340, 'Sharlene', 'Mcclure', 'sharlene.mcclure@gmail.com', '512-555-1340', 'Austin', 'TX', 'https://resumes.storage.com/2340_mcclure.pdf'),
(2341, 'Bennie', 'Yang', 'bennie.yang@yahoo.com', '703-555-1341', 'Alexandria', 'VA', 'https://resumes.storage.com/2341_yang.pdf'),
(2342, 'Jolene', 'Sawyer', 'jolene.sawyer@icloud.com', '240-555-1342', 'Silver Spring', 'MD', 'https://resumes.storage.com/2342_sawyer.pdf'),
(2343, 'Dan', 'Dalton', 'dan.dalton@gmail.com', '571-555-1343', 'Reston', 'VA', 'https://resumes.storage.com/2343_dalton.pdf'),
(2344, 'Bernice', 'Conner', 'bernice.conner@outlook.com', '202-555-1344', 'Washington', 'DC', 'https://resumes.storage.com/2344_conner.pdf'),
(2345, 'Janine', 'Oneal', 'janine.oneal@gmail.com', '617-555-1345', 'Boston', 'MA', 'https://resumes.storage.com/2345_oneal.pdf'),
(2346, 'Kermit', 'Kelley', 'kermit.kelley@yahoo.com', '703-555-1346', 'Arlington', 'VA', 'https://resumes.storage.com/2346_kelley.pdf'),
(2347, 'Ismael', 'Rosales', 'ismael.rosales@icloud.com', '301-555-1347', 'Rockville', 'MD', 'https://resumes.storage.com/2347_rosales.pdf'),
(2348, 'Valerie', 'Flynn', 'valerie.flynn@gmail.com', '571-555-1348', 'Fairfax', 'VA', 'https://resumes.storage.com/2348_flynn.pdf'),
(2349, 'Amos', 'Salazar', 'amos.salazar@outlook.com', '202-555-1349', 'Washington', 'DC', 'https://resumes.storage.com/2349_salazar.pdf'),
(2350, 'Elva', 'Barr', 'elva.barr@gmail.com', '206-555-1350', 'Seattle', 'WA', 'https://resumes.storage.com/2350_barr.pdf'),
(2351, 'Grover', 'Moody', 'grover.moody@yahoo.com', '703-555-1351', 'Alexandria', 'VA', 'https://resumes.storage.com/2351_moody.pdf'),
(2352, 'Jana', 'Blankenship', 'jana.blankenship@icloud.com', '240-555-1352', 'Bethesda', 'MD', 'https://resumes.storage.com/2352_blankenship.pdf'),
(2353, 'Lacy', 'Benton', 'lacy.benton@gmail.com', '571-555-1353', 'Arlington', 'VA', 'https://resumes.storage.com/2353_benton.pdf'),
(2354, 'Clinton', 'Estes', 'clinton.estes@outlook.com', '202-555-1354', 'Washington', 'DC', 'https://resumes.storage.com/2354_estes.pdf'),
(2355, 'Sherman', 'Sandoval', 'sherman.sandoval@gmail.com', '303-555-1355', 'Denver', 'CO', 'https://resumes.storage.com/2355_sandoval.pdf'),
(2356, 'Gretchen', 'Barlow', 'gretchen.barlow@yahoo.com', '703-555-1356', 'Falls Church', 'VA', 'https://resumes.storage.com/2356_barlow.pdf'),
(2357, 'Margarita', 'Mcintosh', 'margarita.mcintosh@icloud.com', '301-555-1357', 'Silver Spring', 'MD', 'https://resumes.storage.com/2357_mcintosh.pdf'),
(2358, 'Wilson', 'Wilcox', 'wilson.wilcox@gmail.com', '571-555-1358', 'Reston', 'VA', 'https://resumes.storage.com/2358_wilcox.pdf'),
(2359, 'Gregg', 'Giles', 'gregg.giles@outlook.com', '202-555-1359', 'Washington', 'DC', 'https://resumes.storage.com/2359_giles.pdf'),
(2360, 'Dewayne', 'Landry', 'dewayne.landry@gmail.com', '404-555-1360', 'Atlanta', 'GA', 'https://resumes.storage.com/2360_landry.pdf'),
(2361, 'Helene', 'Durham', 'helene.durham@yahoo.com', '703-555-1361', 'Arlington', 'VA', 'https://resumes.storage.com/2361_durham.pdf'),
(2362, 'Tomas', 'Bullock', 'tomas.bullock@icloud.com', '240-555-1362', 'Gaithersburg', 'MD', 'https://resumes.storage.com/2362_bullock.pdf'),
(2363, 'Les', 'Mcmahon', 'les.mcmahon@gmail.com', '571-555-1363', 'Alexandria', 'VA', 'https://resumes.storage.com/2363_mcmahon.pdf'),
(2364, 'Leona', 'Guy', 'leona.guy@outlook.com', '202-555-1364', 'Washington', 'DC', 'https://resumes.storage.com/2364_guy.pdf'),
(2365, 'Karin', 'Beach', 'karin.beach@gmail.com', '212-555-1365', 'New York', 'NY', 'https://resumes.storage.com/2365_beach.pdf'),
(2366, 'Esteban', 'Aguilar', 'esteban.aguilar@yahoo.com', '703-555-1366', 'Fairfax', 'VA', 'https://resumes.storage.com/2366_aguilar.pdf'),
(2367, 'Patsy', 'Strong', 'patsy.strong@icloud.com', '301-555-1367', 'Bethesda', 'MD', 'https://resumes.storage.com/2367_strong.pdf'),
(2368, 'Carmelo', 'Mooney', 'carmelo.mooney@gmail.com', '571-555-1368', 'Arlington', 'VA', 'https://resumes.storage.com/2368_mooney.pdf'),
(2369, 'Alisa', 'Buck', 'alisa.buck@outlook.com', '202-555-1369', 'Washington', 'DC', 'https://resumes.storage.com/2369_buck.pdf'),
(2370, 'Boyd', 'Burch', 'boyd.burch@gmail.com', '312-555-1370', 'Chicago', 'IL', 'https://resumes.storage.com/2370_burch.pdf'),
(2371, 'Susanne', 'Riggs', 'susanne.riggs@yahoo.com', '703-555-1371', 'Alexandria', 'VA', 'https://resumes.storage.com/2371_riggs.pdf'),
(2372, 'Erna', 'Kidd', 'erna.kidd@icloud.com', '240-555-1372', 'Rockville', 'MD', 'https://resumes.storage.com/2372_kidd.pdf');
INSERT INTO `Candidates` (`CandidateID`, `FirstName`, `LastName`, `Email`, `Phone`, `City`, `State`, `ResumeURL`) VALUES
(2373, 'Raquel', 'Rollins', 'raquel.rollins@gmail.com', '571-555-1373', 'Herndon', 'VA', 'https://resumes.storage.com/2373_rollins.pdf'),
(2374, 'Richie', 'Weiss', 'richie.weiss@outlook.com', '202-555-1374', 'Washington', 'DC', 'https://resumes.storage.com/2374_weiss.pdf'),
(2375, 'Booker', 'Finley', 'booker.finley@gmail.com', '415-555-1375', 'San Francisco', 'CA', 'https://resumes.storage.com/2375_finley.pdf'),
(2376, 'Petra', 'Stokes', 'petra.stokes@yahoo.com', '703-555-1376', 'Fairfax', 'VA', 'https://resumes.storage.com/2376_stokes.pdf'),
(2377, 'Wilfredo', 'Cochran', 'wilfredo.cochran@icloud.com', '301-555-1377', 'Silver Spring', 'MD', 'https://resumes.storage.com/2377_cochran.pdf'),
(2378, 'Janell', 'Glass', 'janell.glass@gmail.com', '571-555-1378', 'Arlington', 'VA', 'https://resumes.storage.com/2378_glass.pdf'),
(2379, 'Darrin', 'Rojas', 'darrin.rojas@outlook.com', '202-555-1379', 'Washington', 'DC', 'https://resumes.storage.com/2379_rojas.pdf'),
(2380, 'Emilia', 'York', 'emilia.york@gmail.com', '512-555-1380', 'Austin', 'TX', 'https://resumes.storage.com/2380_york.pdf'),
(2381, 'Martha', 'Chavez', 'martha.chavez@yahoo.com', '703-555-1381', 'Alexandria', 'VA', 'https://resumes.storage.com/2381_chavez.pdf'),
(2382, 'Louis', 'Fisher', 'louis.fisher@icloud.com', '240-555-1382', 'Rockville', 'MD', 'https://resumes.storage.com/2382_fisher.pdf'),
(2383, 'Marie', 'Vasquez', 'marie.v@gmail.com', '571-555-1383', 'Reston', 'VA', 'https://resumes.storage.com/2383_vasquez.pdf'),
(2384, 'Alan', 'Olson', 'alan_olson_profile@outlook.com', '202-555-1384', 'Washington', 'DC', 'https://resumes.storage.com/2384_olson.pdf'),
(2385, 'Andrea', 'Gordon', 'andrea.gordon@gmail.com', '617-555-1385', 'Boston', 'MA', 'https://resumes.storage.com/2385_gordon.pdf'),
(2386, 'Chris', 'Snyder', 'chris.snyder@yahoo.com', '703-555-1386', 'Arlington', 'VA', 'https://resumes.storage.com/2386_snyder.pdf'),
(2387, 'Evelyn', 'Gibson', 'evelyn.gibson@icloud.com', '301-555-1387', 'Bethesda', 'MD', 'https://resumes.storage.com/2387_gibson.pdf'),
(2388, 'Juan', 'Ellis', 'juan.ellis@gmail.com', '571-555-1388', 'Falls Church', 'VA', 'https://resumes.storage.com/2388_ellis.pdf'),
(2389, 'Judith', 'Harrison', 'judith.harrison@outlook.com', '202-555-1389', 'Washington', 'DC', 'https://resumes.storage.com/2389_harrison.pdf'),
(2390, 'Roy', 'Murray', 'roy.murray@gmail.com', '206-555-1390', 'Seattle', 'WA', 'https://resumes.storage.com/2390_murray.pdf'),
(2391, 'Kelly', 'Wells', 'kelly.wells@yahoo.com', '703-555-1391', 'Fairfax', 'VA', 'https://resumes.storage.com/2391_wells.pdf'),
(2392, 'Roger', 'Ford', 'roger.ford@icloud.com', '240-555-1392', 'Silver Spring', 'MD', 'https://resumes.storage.com/2392_ford.pdf'),
(2393, 'Jean', 'Marshall', 'jean.marshall@gmail.com', '571-555-1393', 'Alexandria', 'VA', 'https://resumes.storage.com/2393_marshall.pdf'),
(2394, 'Terry', 'Owens', 'terry.owens@outlook.com', '202-555-1394', 'Washington', 'DC', 'https://resumes.storage.com/2394_owens.pdf'),
(2395, 'Grace', 'Harper', 'grace.harper@gmail.com', '303-555-1395', 'Denver', 'CO', 'https://resumes.storage.com/2395_harper.pdf'),
(2396, 'Austin', 'Fox', 'austin.fox@yahoo.com', '703-555-1396', 'Arlington', 'VA', 'https://resumes.storage.com/2396_fox.pdf'),
(2397, 'Doris', 'Riley', 'doris.riley@icloud.com', '301-555-1397', 'Bethesda', 'MD', 'https://resumes.storage.com/2397_riley.pdf'),
(2398, 'Noah', 'Armstrong', 'noah.armstrong@gmail.com', '571-555-1398', 'Herndon', 'VA', 'https://resumes.storage.com/2398_armstrong.pdf'),
(2399, 'Shirley', 'Carpenter', 'shirley.carpenter@outlook.com', '202-555-1399', 'Washington', 'DC', 'https://resumes.storage.com/2399_carpenter.pdf'),
(2400, 'Vincent', 'Mendoza', 'vincent.mendoza@gmail.com', '404-555-1400', 'Atlanta', 'GA', 'https://resumes.storage.com/2400_mendoza.pdf');

--
-- Triggers `Candidates`
--
DELIMITER $$
CREATE TRIGGER `trg_Candidates_Before_Insert_Lowercase_Email` BEFORE INSERT ON `Candidates` FOR EACH ROW BEGIN
    -- Set the Email value in the new row to its lowercase version
    SET NEW.Email = LOWER(NEW.Email);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `CANDIDATE_SKILLS`
--

CREATE TABLE `CANDIDATE_SKILLS` (
  `CandidateID` int(11) NOT NULL,
  `SkillID` bigint(20) NOT NULL,
  `ProficiencyLevel` enum('Beginner','Intermediate','Expert') NOT NULL DEFAULT 'Beginner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CANDIDATE_SKILLS`
--

INSERT INTO `CANDIDATE_SKILLS` (`CandidateID`, `SkillID`, `ProficiencyLevel`) VALUES
(2001, 25, 'Expert'),
(2001, 26, 'Intermediate'),
(2001, 56, 'Intermediate'),
(2001, 59, 'Expert'),
(2001, 60, 'Intermediate'),
(2002, 30, 'Expert'),
(2002, 31, 'Intermediate'),
(2002, 32, 'Intermediate'),
(2002, 33, 'Expert'),
(2002, 58, 'Intermediate'),
(2003, 3, 'Expert'),
(2003, 7, 'Intermediate'),
(2003, 8, 'Expert'),
(2003, 9, 'Intermediate'),
(2003, 44, 'Beginner'),
(2003, 57, 'Intermediate'),
(2004, 1, 'Expert'),
(2004, 4, 'Expert'),
(2004, 11, 'Intermediate'),
(2004, 12, 'Intermediate'),
(2004, 15, 'Beginner'),
(2004, 58, 'Expert'),
(2005, 37, 'Intermediate'),
(2005, 39, 'Expert'),
(2005, 40, 'Intermediate'),
(2005, 45, 'Beginner'),
(2005, 56, 'Expert'),
(2006, 17, 'Expert'),
(2006, 18, 'Intermediate'),
(2006, 19, 'Intermediate'),
(2006, 36, 'Expert'),
(2006, 58, 'Intermediate'),
(2007, 3, 'Expert'),
(2007, 7, 'Expert'),
(2007, 8, 'Expert'),
(2007, 9, 'Intermediate'),
(2007, 44, 'Intermediate'),
(2007, 57, 'Expert'),
(2008, 49, 'Expert'),
(2008, 50, 'Expert'),
(2008, 51, 'Intermediate'),
(2008, 56, 'Intermediate'),
(2008, 57, 'Expert'),
(2009, 1, 'Intermediate'),
(2009, 4, 'Expert'),
(2009, 21, 'Expert'),
(2009, 23, 'Intermediate'),
(2009, 58, 'Intermediate'),
(2010, 25, 'Expert'),
(2010, 26, 'Expert'),
(2010, 27, 'Intermediate'),
(2010, 56, 'Expert'),
(2010, 59, 'Expert'),
(2010, 60, 'Intermediate'),
(2011, 30, 'Expert'),
(2011, 31, 'Intermediate'),
(2011, 32, 'Expert'),
(2011, 33, 'Intermediate'),
(2011, 58, 'Intermediate'),
(2012, 1, 'Expert'),
(2012, 4, 'Expert'),
(2012, 11, 'Expert'),
(2012, 12, 'Intermediate'),
(2012, 15, 'Intermediate'),
(2012, 58, 'Expert'),
(2013, 37, 'Intermediate'),
(2013, 38, 'Beginner'),
(2013, 39, 'Expert'),
(2013, 40, 'Intermediate'),
(2013, 45, 'Intermediate'),
(2013, 56, 'Expert'),
(2014, 17, 'Intermediate'),
(2014, 18, 'Intermediate'),
(2014, 19, 'Expert'),
(2014, 36, 'Expert'),
(2014, 58, 'Intermediate'),
(2015, 3, 'Expert'),
(2015, 7, 'Expert'),
(2015, 8, 'Expert'),
(2015, 10, 'Intermediate'),
(2015, 44, 'Expert'),
(2015, 57, 'Intermediate'),
(2016, 1, 'Expert'),
(2016, 4, 'Expert'),
(2016, 21, 'Intermediate'),
(2016, 22, 'Beginner'),
(2016, 23, 'Intermediate'),
(2016, 58, 'Expert'),
(2017, 25, 'Expert'),
(2017, 26, 'Intermediate'),
(2017, 27, 'Intermediate'),
(2017, 56, 'Expert'),
(2017, 59, 'Expert'),
(2017, 60, 'Intermediate'),
(2018, 49, 'Expert'),
(2018, 50, 'Expert'),
(2018, 51, 'Intermediate'),
(2018, 56, 'Expert'),
(2018, 57, 'Intermediate'),
(2019, 30, 'Expert'),
(2019, 31, 'Expert'),
(2019, 32, 'Intermediate'),
(2019, 33, 'Expert'),
(2019, 58, 'Intermediate'),
(2020, 3, 'Expert'),
(2020, 7, 'Expert'),
(2020, 8, 'Intermediate'),
(2020, 9, 'Intermediate'),
(2020, 44, 'Beginner'),
(2020, 57, 'Expert');

-- --------------------------------------------------------

--
-- Table structure for table `Clients`
--

CREATE TABLE `Clients` (
  `ClientID` bigint(20) NOT NULL,
  `CompanyName` varchar(50) NOT NULL,
  `Industry` varchar(50) DEFAULT NULL,
  `ContactPerson` varchar(50) DEFAULT NULL,
  `ContactEmail` varchar(100) DEFAULT NULL CHECK (`ContactEmail` is null or `ContactEmail` regexp '^[^@]+@[^@]+\\.[^@]+$'),
  `ContactPhone` char(15) DEFAULT NULL CHECK (`ContactPhone` is null or `ContactPhone` regexp '^[0-9()+\\-\\s]{7,15}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Clients`
--

INSERT INTO `Clients` (`ClientID`, `CompanyName`, `Industry`, `ContactPerson`, `ContactEmail`, `ContactPhone`) VALUES
(101, 'QuantumLeap Analytics LLC', 'Technology', 'Jennifer Smith', 'jennifer.smith@quantumleapanalytics.com', '703-555-0101'),
(102, 'Starlight Logistics Group', 'Logistics', 'Michael Johnson', 'michael.johnson@starlightlogistics.com', '212-555-0102'),
(103, 'BlueWave Financial Inc.', 'Finance', 'Emily Williams', 'emily.williams@bluewavefinancial.com', '310-555-0103'),
(104, 'Precision Health Corp.', 'Healthcare', 'David Brown', 'david.brown@precisionhealth.com', '415-555-0104'),
(105, 'Apex Manufacturing Solutions', 'Manufacturing', 'Jessica Jones', 'jessica.jones@apexmanufacturing.com', '312-555-0105'),
(106, 'NextGen Retailers Ltd.', 'Retail', 'Christopher Garcia', 'christopher.garcia@nextgenretailers.com', '214-555-0106'),
(107, 'Meridian Consulting Group', 'Consulting', 'Amanda Miller', 'amanda.miller@meridianconsulting.com', '404-555-0107'),
(108, 'Dynamic Energy Partners', 'Energy', 'Daniel Davis', 'daniel.davis@dynamicenergy.com', '713-555-0108'),
(109, 'Horizon Real Estate Inc.', 'Real Estate', 'Melissa Rodriguez', 'melissa.rodriguez@horizonrealestate.com', '305-555-0109'),
(110, 'Synergy Marketing Corp.', 'Marketing', 'James Martinez', 'james.martinez@synergymarketing.com', '617-555-0110'),
(111, 'Innovate Education LLC', 'Education', 'Patricia Hernandez', 'patricia.hernandez@innovateeducation.com', '206-555-0111'),
(112, 'SilverLining Hospitality', 'Hospitality', 'Robert Lopez', 'robert.lopez@silverlininghospitality.com', '702-555-0112'),
(113, 'Vertex Technologies Inc.', 'Technology', 'Linda Gonzalez', 'linda.gonzalez@vertextechnologies.com', '408-555-0113'),
(114, 'GlobalTrust Finance LLC', 'Finance', 'William Wilson', 'william.wilson@globaltrustfinance.com', '212-555-0114'),
(115, 'CareFirst Medical Group', 'Healthcare', 'Elizabeth Anderson', 'elizabeth.anderson@carefirstmedical.com', '612-555-0115'),
(116, 'Keystone Assembly Corp.', 'Manufacturing', 'Richard Thomas', 'richard.thomas@keystoneassembly.com', '313-555-0116'),
(117, 'The Retail Hub Ltd.', 'Retail', 'Susan Taylor', 'susan.taylor@theretailhub.com', '312-555-0117'),
(118, 'Insightful Consultants', 'Consulting', 'Joseph Moore', 'joseph.moore@insightfulconsultants.com', '202-555-0118'),
(119, 'GeoSource Energy Inc.', 'Energy', 'Karen Jackson', 'karen.jackson@geosourceenergy.com', '713-555-0119'),
(120, 'Urban Properties Group', 'Real Estate', 'Charles Martin', 'charles.martin@urbanproperties.com', '213-555-0120'),
(121, 'BrightSpark Marketing', 'Marketing', 'Nancy Lee', 'nancy.lee@brightsparkmarketing.com', '415-555-0121'),
(122, 'Summit Learning Systems', 'Education', 'Thomas Perez', 'thomas.perez@summitlearningsystems.com', '617-555-0122'),
(123, 'Oasis Resorts LLC', 'Hospitality', 'Sarah Thompson', 'sarah.thompson@oasisresorts.com', '305-555-0123'),
(124, 'CodeGen Software Inc.', 'Technology', 'Daniel White', 'daniel.white@codegensoftware.com', '512-555-0124'),
(125, 'SecureInvest Financial', 'Finance', 'Maria Harris', 'maria.harris@secureinvestfinancial.com', '704-555-0125'),
(126, 'Wellness Partners Clinic', 'Healthcare', 'Matthew Sanchez', 'matthew.sanchez@wellnesspartners.com', '602-555-0126'),
(127, 'IronWorks Manufacturing', 'Manufacturing', 'Ashley Clark', 'ashley.clark@ironworksmanufacturing.com', '412-555-0127'),
(128, 'Evergreen Goods Ltd.', 'Retail', 'Joshua Lewis', 'joshua.lewis@evergreengoods.com', '206-555-0128'),
(129, 'Momentum Consulting LLC', 'Consulting', 'Megan Robinson', 'megan.robinson@momentumconsulting.com', '312-555-0129'),
(130, 'Solaris Power Corp.', 'Energy', 'Andrew Walker', 'andrew.walker@solarispower.com', '602-555-0130'),
(131, 'Skyline Realty Partners', 'Real Estate', 'Nicole Young', 'nicole.young@skylinerealty.com', '212-555-0131'),
(132, 'Vivid Creations Marketing', 'Marketing', 'Justin Allen', 'justin.allen@vividcreations.com', '213-555-0132'),
(133, 'KnowledgeTree Tutors', 'Education', 'Heather King', 'heather.king@knowledgetreetutors.com', '512-555-0133'),
(134, 'Golden Rule Hotels Inc.', 'Hospitality', 'Brian Wright', 'brian.wright@goldenrulehotels.com', '702-555-0134'),
(135, 'DataWeave Solutions Corp.', 'Technology', 'Stephanie Scott', 'stephanie.scott@dataweavesolutions.com', '408-555-0135'),
(136, 'Capital Gains Finance', 'Finance', 'Kevin Green', 'kevin.green@capitalgains.com', '704-555-0136'),
(137, 'Unity Health Systems', 'Healthcare', 'Laura Adams', 'laura.adams@unityhealth.com', '215-555-0137'),
(138, 'DuraForm Industries', 'Manufacturing', 'Jason Baker', 'jason.baker@duraformindustries.com', '313-555-0138'),
(139, 'The Modern Shopper LLC', 'Retail', 'Rebecca Nelson', 'rebecca.nelson@themodernshopper.com', '612-555-0139'),
(140, 'Strategic Edge Consulting', 'Consulting', 'Brandon Carter', 'brandon.carter@strategicedge.com', '404-555-0140'),
(141, 'PetroLink Energy Group', 'Energy', 'Kimberly Mitchell', 'kimberly.mitchell@petrolinkenergy.com', '713-555-0141'),
(142, 'Cornerstone Properties', 'Real Estate', 'Samuel Perez', 'samuel.perez@cornerstoneproperties.com', '305-555-0142'),
(143, 'BrandBuilders Agency', 'Marketing', 'Michelle Roberts', 'michelle.roberts@brandbuilders.com', '212-555-0143'),
(144, 'Future Scholars Academy', 'Education', 'Adam Turner', 'adam.turner@futurescholars.com', '617-555-0144'),
(145, 'Coastal Breeze Resorts', 'Hospitality', 'Cynthia Phillips', 'cynthia.phillips@coastalbreeze.com', '808-555-0145'),
(146, 'LogicGate Technologies', 'Technology', 'Mark Campbell', 'mark.campbell@logicgatetech.com', '512-555-0146'),
(147, 'Prosperity Bank Corp.', 'Finance', 'Debra Parker', 'debra.parker@prosperitybank.com', '212-555-0147'),
(148, 'HealFast Medical Inc.', 'Healthcare', 'Ronald Evans', 'ronald.evans@healfastmedical.com', '617-555-0148'),
(149, 'SteelCore Fabricators', 'Manufacturing', 'Amanda Edwards', 'amanda.edwards@steelcorefabs.com', '412-555-0149'),
(150, 'Bargain Barn Ltd.', 'Retail', 'George Collins', 'george.collins@bargainbarn.com', '214-555-0150'),
(151, 'Visionary Ventures LLC', 'Consulting', 'Sharon Stewart', 'sharon.stewart@visionaryventures.com', '415-555-0151'),
(152, 'TerraFirma Energy', 'Energy', 'Steven Morris', 'steven.morris@terrafirmaenergy.com', '713-555-0152'),
(153, 'Metropolis Realty Inc.', 'Real Estate', 'Sandra Rogers', 'sandra.rogers@metropolisrealty.com', '312-555-0153'),
(154, 'AdAstra Marketing Group', 'Marketing', 'Edward Reed', 'edward.reed@adastramarketing.com', '213-555-0154'),
(155, 'Bright Horizons Learning', 'Education', 'Donna Cook', 'donna.cook@brighthorizons.com', '206-555-0155'),
(156, 'Serenity Stays Hospitality', 'Hospitality', 'Paul Morgan', 'paul.morgan@serenitystays.com', '702-555-0156'),
(157, 'CloudNine Solutions', 'Technology', 'Carol Bell', 'carol.bell@cloudninesolutions.com', '408-555-0157'),
(158, 'Summit Financial Partners', 'Finance', 'Jose Murphy', 'jose.murphy@summitfinancial.com', '704-555-0158'),
(159, 'LifeLine Health Services', 'Healthcare', 'Brenda Bailey', 'brenda.bailey@lifelinehealth.com', '602-555-0159'),
(160, 'Precision Parts Co.', 'Manufacturing', 'Raymond Rivera', 'raymond.rivera@precisionparts.com', '313-555-0160'),
(161, 'Urban Outfitters Collective', 'Retail', 'Pamela Cooper', 'pamela.cooper@urbanoutfitters.com', '212-555-0161'),
(162, 'GrowthPoint Consulting', 'Consulting', 'Gregory Richardson', 'gregory.richardson@growthpoint.com', '404-555-0162'),
(163, 'Voltaic Energy Corp.', 'Energy', 'Catherine Cox', 'catherine.cox@voltaicenergy.com', '602-555-0163'),
(164, 'First Choice Realty', 'Real Estate', 'Jack Howard', 'jack.howard@firstchoicerealty.com', '305-555-0164'),
(165, 'MarketMinds Agency', 'Marketing', 'Dennis Ward', 'dennis.ward@marketminds.com', '312-555-0165'),
(166, 'Charter School Systems', 'Education', 'Ruth Torres', 'ruth.torres@charterschools.com', '512-555-0166'),
(167, 'Grandeur Hotels Group', 'Hospitality', 'Jerry Peterson', 'jerry.peterson@grandeurhotels.com', '702-555-0167'),
(168, 'ByteForce Technologies', 'Technology', 'Ann Gray', 'ann.gray@byteforce.com', '415-555-0168'),
(169, 'EagleEye Investments', 'Finance', 'Larry Ramirez', 'larry.ramirez@eagleeyeinvest.com', '212-555-0169'),
(170, 'Wellspring Health Clinic', 'Healthcare', 'Frances James', 'frances.james@wellspring.com', '612-555-0170'),
(171, 'BuiltRight Industries', 'Manufacturing', 'Henry Watson', 'henry.watson@builtright.com', '412-555-0171'),
(172, 'The Corner Store Inc.', 'Retail', 'Martha Brooks', 'martha.brooks@thecornerstore.com', '617-555-0172'),
(173, 'Synergy Solutions Partners', 'Consulting', 'Walter Kelly', 'walter.kelly@synergysolutions.com', '202-555-0173'),
(174, 'GreenLeaf Power LLC', 'Energy', 'Joyce Sanders', 'joyce.sanders@greenleafpower.com', '713-555-0174'),
(175, 'Keystone Real Estate', 'Real Estate', 'Peter Price', 'peter.price@keystonere.com', '215-555-0175'),
(176, 'Digital Wave Marketing', 'Marketing', 'Julie Bennett', 'julie.bennett@digitalwave.com', '415-555-0176'),
(177, 'Lincoln Prep Academy', 'Education', 'Alan Wood', 'alan.wood@lincolnprep.com', '312-555-0177'),
(178, 'Pinnacle Lodging Inc.', 'Hospitality', 'Cheryl Barnes', 'cheryl.barnes@pinnaclelodging.com', '303-555-0178'),
(179, 'InfraNet Systems', 'Technology', 'Gary Ross', 'gary.ross@infranetsystems.com', '408-555-0179'),
(180, 'Anchor Financial Group', 'Finance', 'Irene Henderson', 'irene.henderson@anchorfinancial.com', '704-555-0180'),
(181, 'NextCare Health', 'Healthcare', 'Jeremy Coleman', 'jeremy.coleman@nextcarehealth.com', '602-555-0181'),
(182, 'Prime Mover Manufacturing', 'Manufacturing', 'Gloria Jenkins', 'gloria.jenkins@primemover.com', '313-555-0182'),
(183, 'StyleSphere Retail', 'Retail', 'Philip Perry', 'philip.perry@stylesphere.com', '212-555-0183'),
(184, 'Ascend Consulting Firm', 'Consulting', 'Lori Powell', 'lori.powell@ascendconsulting.com', '404-555-0184'),
(185, 'ClearView Energy Ltd.', 'Energy', 'Russell Long', 'russell.long@clearviewenergy.com', '713-555-0185'),
(186, 'Homestead Properties', 'Real Estate', 'Sara Patterson', 'sara.patterson@homestead.com', '214-555-0186'),
(187, 'RocketFuel Ads Inc.', 'Marketing', 'Todd Hughes', 'todd.hughes@rocketfuelads.com', '213-555-0187'),
(188, 'Erudite Learning Centers', 'Education', 'Janet Flores', 'janet.flores@eruditelearning.com', '512-555-0188'),
(189, 'The Royal Crest Hotel', 'Hospitality', 'Wayne Washington', 'wayne.washington@royalcrest.com', '702-555-0189'),
(190, 'NetSphere Technologies', 'Technology', 'Evelyn Butler', 'evelyn.butler@netspheretech.com', '415-555-0190'),
(191, 'Liberty Capital Finance', 'Finance', 'Roy Simmons', 'roy.simmons@libertycapital.com', '617-555-0191'),
(192, 'Aegis Medical Group', 'Healthcare', 'Denise Foster', 'denise.foster@aegismedical.com', '612-555-0192'),
(193, 'Titan Fabricators Inc.', 'Manufacturing', 'Terry Gonzales', 'terry.gonzales@titanfabs.com', '412-555-0193'),
(194, 'The General Goods Co.', 'Retail', 'Jacqueline Bryant', 'jacqueline.bryant@generalgoods.com', '214-555-0194'),
(195, 'Pivot Point Advisors', 'Consulting', 'Keith Alexander', 'keith.alexander@pivotpoint.com', '202-555-0195'),
(196, 'North Star Energy', 'Energy', 'Kathryn Russell', 'kathryn.russell@northstarenergy.com', '713-555-0196'),
(197, 'Golden Gate Realty', 'Real Estate', 'Harry Griffin', 'harry.griffin@goldengaterealty.com', '415-555-0197'),
(198, 'BuzzWorks Media', 'Marketing', 'Theresa Diaz', 'theresa.diaz@buzzworks.com', '213-555-0198'),
(199, 'Ivy League Tutors LLC', 'Education', 'Ralph Hayes', 'ralph.hayes@ivyleaguetutors.com', '617-555-0199'),
(200, 'Paradise Found Resorts', 'Hospitality', 'Diane Meyer', 'diane.meyer@paradisefound.com', '808-555-0200'),
(201, 'CodeGenius Software', 'Technology', 'Roger Graham', 'roger.graham@codegenius.com', '512-555-0201'),
(202, 'EquiTrust Financial', 'Finance', 'Alice Sullivan', 'alice.sullivan@equitrust.com', '704-555-0202'),
(203, 'Compassion Care Centers', 'Healthcare', 'Carl Wallace', 'carl.wallace@compassioncare.com', '602-555-0203'),
(204, 'FlexiForm Industries', 'Manufacturing', 'Joan Woods', 'joan.woods@flexiform.com', '313-555-0204'),
(205, 'The People\'s Market', 'Retail', 'Shawn Cole', 'shawn.cole@peoplesmarket.com', '206-555-0205'),
(206, 'Alpha Omega Consulting', 'Consulting', 'Billy West', 'billy.west@alphaomega.com', '404-555-0206'),
(207, 'Fusion Fuels Inc.', 'Energy', 'Doris Jordan', 'doris.jordan@fusionfuels.com', '713-555-0207'),
(208, 'Prime Properties Group', 'Real Estate', 'Chris Owens', 'chris.owens@primeproperties.com', '305-555-0208'),
(209, 'Hyperion Marketing', 'Marketing', 'Victoria Reynolds', 'victoria.reynolds@hyperion.com', '312-555-0209'),
(210, 'Scholastic Solutions', 'Education', 'Steve Fisher', 'steve.fisher@scholasticsolutions.com', '617-555-0210'),
(211, 'Tranquil Inns LLC', 'Hospitality', 'Mildred Ellis', 'mildred.ellis@tranquilinns.com', '702-555-0211'),
(212, 'CircuitBoard Solutions', 'Technology', 'Arthur Harrison', 'arthur.harrison@circuitboard.com', '408-555-0212'),
(213, 'First Fidelity Finance', 'Finance', 'Jane Gibson', 'jane.gibson@firstfidelity.com', '212-555-0213'),
(214, 'Guardian Health Network', 'Healthcare', 'Howard Mcdonald', 'howard.mcdonald@guardianhealth.com', '612-555-0214'),
(215, 'Industrial Strength Co.', 'Manufacturing', 'Lillian Cruz', 'lillian.cruz@industrialstrength.com', '412-555-0215'),
(216, 'The Trendsetter\'s Closet', 'Retail', 'Justin Marshall', 'justin.marshall@trendsetters.com', '212-555-0216'),
(217, 'Apex Advisory Group', 'Consulting', 'Beverly Ortiz', 'beverly.ortiz@apexadvisory.com', '202-555-0217'),
(218, 'BioFuel Innovations', 'Energy', 'Jonathan Gomez', 'jonathan.gomez@biofuel.com', '713-555-0218'),
(219, 'Redwood Realty Inc.', 'Real Estate', 'Hannah Murray', 'hannah.murray@redwoodrealty.com', '415-555-0219'),
(220, 'Momentum Media', 'Marketing', 'Ryan Freeman', 'ryan.freeman@momentummedia.com', '213-555-0220'),
(221, 'LearnWell Academy', 'Education', 'Frank Wells', 'frank.wells@learnwell.com', '512-555-0221'),
(222, 'The Gilded Spoon Hotels', 'Hospitality', 'Marilyn Webb', 'marilyn.webb@gildedspoon.com', '702-555-0222'),
(223, 'NextLayer Technology', 'Technology', 'Patrick Simpson', 'patrick.simpson@nextlayer.com', '512-555-0223'),
(224, 'Legacy Wealth Management', 'Finance', 'Andrea Stevens', 'andrea.stevens@legacywealth.com', '704-555-0224'),
(225, 'CureAll Pharmaceuticals', 'Healthcare', 'Benjamin Tucker', 'benjamin.tucker@cureallpharma.com', '617-555-0225'),
(226, 'Sterling Steelworks', 'Manufacturing', 'Angela Porter', 'angela.porter@sterlingsteel.com', '412-555-0226'),
(227, 'Urban Essentials Retail', 'Retail', 'Randy Hunter', 'randy.hunter@urbanessentials.com', '312-555-0227'),
(228, 'Catalyst Consulting', 'Consulting', 'Kathleen Hicks', 'kathleen.hicks@catalystconsulting.com', '404-555-0228'),
(229, 'Helios Energy Solutions', 'Energy', 'Willie Crawford', 'willie.crawford@heliosenergy.com', '602-555-0229'),
(230, 'Empire Estates Realty', 'Real Estate', 'Kelly Henry', 'kelly.henry@empireestates.com', '212-555-0230'),
(231, 'Adroit Advertising', 'Marketing', 'Brenda Boyd', 'brenda.boyd@adroitads.com', '213-555-0231'),
(232, 'Strive Education Inc.', 'Education', 'Johnny Mason', 'johnny.mason@striveeducation.com', '617-555-0232'),
(233, 'Horizon Hospitality Group', 'Hospitality', 'Scott Morales', 'scott.morales@horizonhospitality.com', '305-555-0233'),
(234, 'Alpha Systems Corp.', 'Technology', 'Nicole Kennedy', 'nicole.kennedy@alphasystems.com', '408-555-0234'),
(235, 'Meridian Financial', 'Finance', 'Deborah Warren', 'deborah.warren@meridianfinancial.com', '212-555-0235'),
(236, 'ProHealth Clinics', 'Healthcare', 'Timothy Armstrong', 'timothy.armstrong@prohealth.com', '612-555-0236'),
(237, 'MightyBuilt Manufacturing', 'Manufacturing', 'Dorothy Hamilton', 'dorothy.hamilton@mightybuilt.com', '313-555-0237'),
(238, 'The Daily Deal Warehouse', 'Retail', 'Rose Ray', 'rose.ray@dailydeal.com', '214-555-0238'),
(239, 'Insight Partners Group', 'Consulting', 'David Watkins', 'david.watkins@insightpartners.com', '202-555-0239'),
(240, 'GeoThermal Power Inc.', 'Energy', 'Daniel Olson', 'daniel.olson@geothermal.com', '713-555-0240'),
(241, 'Crestview Properties', 'Real Estate', 'Nancy Carroll', 'nancy.carroll@crestview.com', '213-555-0241'),
(242, 'BrandVantage Marketing', 'Marketing', 'Mark Ford', 'mark.ford@brandvantage.com', '415-555-0242'),
(243, 'Progressive Learning', 'Education', 'Karen Freeman', 'karen.freeman@progressivelearning.com', '512-555-0243'),
(244, 'Azure Sky Resorts', 'Hospitality', 'Paul Gutierrez', 'paul.gutierrez@azuresky.com', '808-555-0244'),
(245, 'DataSphere Inc.', 'Technology', 'Donna Burns', 'donna.burns@datasphere.com', '415-555-0245'),
(246, 'Keystone Capital', 'Finance', 'George Shaw', 'george.shaw@keystonecapital.com', '617-555-0246'),
(247, 'WellCare Medical', 'Healthcare', 'Linda Gordon', 'linda.gordon@wellcare.com', '602-555-0247'),
(248, 'Rhino Tough Industries', 'Manufacturing', 'Edward Jacobs', 'edward.jacobs@rhinotough.com', '412-555-0248'),
(249, 'Metro Mart LLC', 'Retail', 'Patricia Snyder', 'patricia.snyder@metromart.com', '312-555-0249'),
(250, 'Summit Strategy Advisors', 'Consulting', 'Brian Rice', 'brian.rice@summitstrategy.com', '404-555-0250'),
(251, 'Tidal Wave Energy', 'Energy', 'Susan Robertson', 'susan.robertson@tidalwave.com', '713-555-0251'),
(252, 'Blue Ribbon Realty', 'Real Estate', 'Jason Stone', 'jason.stone@blueribbonrealty.com', '305-555-0252'),
(253, 'Creative Spark Agency', 'Marketing', 'Rebecca Hart', 'rebecca.hart@creativespark.com', '212-555-0253'),
(254, 'Global Learning Initiative', 'Education', 'Sharon Holmes', 'sharon.holmes@globallearning.com', '617-555-0254'),
(255, 'The Harbor View Inn', 'Hospitality', 'William Hunt', 'william.hunt@harborview.com', '702-555-0255'),
(256, 'LogicFlow Solutions', 'Technology', 'Laura Black', 'laura.black@logicflow.com', '408-555-0256'),
(257, 'Prosper Financial Group', 'Finance', 'Kevin Gardner', 'kevin.gardner@prosperfinancial.com', '704-555-0257'),
(258, 'Unity Medical Center', 'Healthcare', 'Cynthia Myers', 'cynthia.myers@unitymedical.com', '612-555-0258'),
(259, 'Durasteel Manufacturing', 'Manufacturing', 'Gary Fox', 'gary.fox@durasteel.com', '313-555-0259'),
(260, 'The Gadgetorium', 'Retail', 'Sandra Medina', 'sandra.medina@gadgetorium.com', '214-555-0260'),
(261, 'Momentum Consulting Inc.', 'Consulting', 'Deborah Mendoza', 'deborah.mendoza@momentum.com', '202-555-0261'),
(262, 'SolarFlare Power', 'Energy', 'Steven Mills', 'steven.mills@solarflare.com', '602-555-0262'),
(263, 'Avalon Real Estate', 'Real Estate', 'Sharon Hansen', 'sharon.hansen@avalonre.com', '213-555-0263'),
(264, 'The Marketing Machine', 'Marketing', 'Paul Day', 'paul.day@marketingmachine.com', '415-555-0264'),
(265, 'BrightMinds Academy', 'Education', 'Kimberly Cunningham', 'kimberly.cunningham@brightminds.com', '512-555-0265'),
(266, 'Serene Retreats LLC', 'Hospitality', 'Jessica Vasquez', 'jessica.vasquez@sereneretreats.com', '808-555-0266'),
(267, 'Quantum Computing Corp.', 'Technology', 'Larry Pearson', 'larry.pearson@quantum.com', '408-555-0267'),
(268, 'Vanguard Investments', 'Finance', 'Frances Gilbert', 'frances.gilbert@vanguardinvest.com', '617-555-0268'),
(269, 'NextGen Health Solutions', 'Healthcare', 'Carl Bradley', 'carl.bradley@nextgenhealth.com', '602-555-0269'),
(270, 'Precision Tool & Die', 'Manufacturing', 'Joyce George', 'joyce.george@precisiontool.com', '412-555-0270'),
(271, 'The Artisan\'s Corner', 'Retail', 'Raymond Castillo', 'raymond.castillo@artisanscorner.com', '206-555-0271'),
(272, 'Synergistic Strategies', 'Consulting', 'Lori Elliott', 'lori.elliott@synergistic.com', '404-555-0272'),
(273, 'PetroDynamics Energy', 'Energy', 'Jose Hopkins', 'jose.hopkins@petrodynamics.com', '713-555-0273'),
(274, 'Homeward Bound Realty', 'Real Estate', 'Irene Hawkins', 'irene.hawkins@homewardbound.com', '305-555-0274'),
(275, 'Digital Canvas Marketing', 'Marketing', 'Jeremy Franklin', 'jeremy.franklin@digitalcanvas.com', '312-555-0275'),
(276, 'The Scholar\'s Guild', 'Education', 'Gloria Woods', 'gloria.woods@scholarsguild.com', '617-555-0276'),
(277, 'The Grand Hotel Experience', 'Hospitality', 'Benjamin Kelley', 'benjamin.kelley@grandhotel.com', '702-555-0277'),
(278, 'Byte-Wise Systems', 'Technology', 'Marilyn Lawson', 'marilyn.lawson@bytewise.com', '512-555-0278'),
(279, 'IronClad Financial', 'Finance', 'Adam Nichols', 'adam.nichols@ironclad.com', '704-555-0279'),
(280, 'Aura Health & Wellness', 'Healthcare', 'Cheryl Fields', 'cheryl.fields@aurahealth.com', '612-555-0280'),
(281, 'WeldRight Fabricators', 'Manufacturing', 'Jonathan Riley', 'jonathan.riley@weldright.com', '313-555-0281'),
(282, 'The Value Vault Inc.', 'Retail', 'Jacqueline Alvarez', 'jacqueline.alvarez@valuevault.com', '214-555-0282'),
(283, 'The Catalyst Group', 'Consulting', 'Terry Hudson', 'terry.hudson@catalyst.com', '202-555-0283'),
(284, 'Windmill Power Co.', 'Energy', 'Evelyn Spencer', 'evelyn.spencer@windmillpower.com', '713-555-0284'),
(285, 'Urban Oasis Properties', 'Real Estate', 'Ralph Gardner', 'ralph.gardner@urbanoasis.com', '213-555-0285'),
(286, 'Brand Logic Agency', 'Marketing', 'Keith Payne', 'keith.payne@brandlogic.com', '415-555-0286'),
(287, 'Pinnacle Prep School', 'Education', 'Diane Stephens', 'diane.stephens@pinnacleprep.com', '617-555-0288'),
(288, 'The Regal Resort & Spa', 'Hospitality', 'Theresa Pierce', 'theresa.pierce@regalresort.com', '808-555-0288'),
(289, 'NetWeavers Inc.', 'Technology', 'Ryan Berry', 'ryan.berry@netweavers.com', '408-555-0289'),
(290, 'Bedrock Financial', 'Finance', 'Billy Matthews', 'billy.matthews@bedrock.com', '212-555-0290'),
(291, 'Evergreen Medical', 'Healthcare', 'Alice Arnold', 'alice.arnold@evergreen.com', '602-555-0291'),
(292, 'Alpha Manufacturing', 'Manufacturing', 'Willie Wagner', 'willie.wagner@alphamfg.com', '412-555-0292'),
(293, 'The Emporium', 'Retail', 'Chris Mills', 'chris.mills@emporium.com', '312-555-0293'),
(294, 'Visionary Consulting', 'Consulting', 'Victoria Chapman', 'victoria.chapman@visionary.com', '404-555-0294'),
(295, 'Clean Energy Collective', 'Energy', 'Mildred Ferguson', 'mildred.ferguson@cleanenergy.com', '713-555-0295'),
(296, 'First Equity Real Estate', 'Real Estate', 'Steve Dunn', 'steve.dunn@firstequity.com', '305-555-0296'),
(297, 'Go-To-Market Pros', 'Marketing', 'Arthur Perkins', 'arthur.perkins@gotomarket.com', '213-555-0297'),
(298, 'Charter Oak Academy', 'Education', 'Jane Boyd', 'jane.boyd@charteroak.com', '512-555-0298'),
(299, 'The Golden Palm Hotel', 'Hospitality', 'Howard Mason', 'howard.mason@goldenpalm.com', '702-555-0299'),
(300, 'CyberCore Solutions', 'Technology', 'Frank Hansen', 'frank.hansen@cybercore.com', '512-555-0300'),
(301, 'Summit Trust Bank', 'Finance', 'Lillian Little', 'lillian.little@summittrust.com', '704-555-0301'),
(302, 'Allied Health Partners', 'Healthcare', 'Justin Burton', 'justin.burton@alliedhealth.com', '612-555-0302'),
(303, 'ForgePoint Industries', 'Manufacturing', 'Beverly Wright', 'beverly.wright@forgepoint.com', '313-555-0303'),
(304, 'ShopSmart Retail Group', 'Retail', 'Jonathan Peterson', 'jonathan.peterson@shopsmart.com', '214-555-0304'),
(305, 'The A-Team Advisors', 'Consulting', 'Hannah Clark', 'hannah.clark@a-team.com', '202-555-0305'),
(306, 'TerraVolt Energy', 'Energy', 'Ryan Rodriguez', 'ryan.rodriguez@terravolt.com', '713-555-0306'),
(307, 'RedBrick Realty', 'Real Estate', 'Frank Lewis', 'frank.lewis@redbrickrealty.com', '212-555-0307'),
(308, 'BrandStorm Inc.', 'Marketing', 'Marilyn Hill', 'marilyn.hill@brandstorm.com', '415-555-0308'),
(309, 'Ivy Prep Learning', 'Education', 'Patrick Scott', 'patrick.scott@ivyprep.com', '617-555-0309'),
(310, 'The Silver Key Inn', 'Hospitality', 'Andrea Green', 'andrea.green@silverkey.com', '702-555-0310'),
(311, 'LogicSphere Tech', 'Technology', 'Benjamin Adams', 'benjamin.adams@logicsphere.com', '408-555-0311'),
(312, 'Cornerstone Finance', 'Finance', 'Angela Nelson', 'angela.nelson@cornerstone.com', '212-555-0312'),
(313, 'CureWell Medical', 'Healthcare', 'Randy Baker', 'randy.baker@curewell.com', '602-555-0313'),
(314, 'MakersMark Manufacturing', 'Manufacturing', 'Kathleen Gonzalez', 'kathleen.gonzalez@makersmark.com', '412-555-0314'),
(315, 'The Bargain Bin', 'Retail', 'Willie Carter', 'willie.carter@bargainbin.com', '214-555-0315'),
(316, 'Catalystic Advisors', 'Consulting', 'Kelly Mitchell', 'kelly.mitchell@catalystic.com', '404-555-0316'),
(317, 'GeoCore Energy', 'Energy', 'Brenda Perez', 'brenda.perez@geocore.com', '713-555-0317'),
(318, 'Empire Realty Partners', 'Real Estate', 'Scott Roberts', 'scott.roberts@empirerealty.com', '305-555-0318'),
(319, 'AdVantage Media', 'Marketing', 'Deborah Turner', 'deborah.turner@advantage.com', '213-555-0319'),
(320, 'Newton Learning Center', 'Education', 'Mark Phillips', 'mark.phillips@newton.com', '512-555-0320'),
(321, 'The Crimson Carpet Hotel', 'Hospitality', 'Donna Campbell', 'donna.campbell@crimsoncarpet.com', '702-555-0321'),
(322, 'DataStream Solutions', 'Technology', 'George Parker', 'george.parker@datastream.com', '415-555-0322'),
(323, 'Fidelity First Bank', 'Finance', 'Linda Evans', 'linda.evans@fidelityfirst.com', '617-555-0323'),
(324, 'ProActive Health', 'Healthcare', 'Edward Edwards', 'edward.edwards@proactive.com', '612-555-0324'),
(325, 'SteelForge Industries', 'Manufacturing', 'Patricia Collins', 'patricia.collins@steelforge.com', '313-555-0325'),
(326, 'The Merchant\'s Guild', 'Retail', 'William Stewart', 'william.stewart@merchantsguild.com', '312-555-0326'),
(327, 'Insightful Strategies', 'Consulting', 'Elizabeth Morris', 'elizabeth.morris@insightful.com', '202-555-0327'),
(328, 'Solaris Systems', 'Energy', 'Richard Rogers', 'richard.rogers@solaris.com', '602-555-0328'),
(329, 'Greenwood Properties', 'Real Estate', 'Susan Reed', 'susan.reed@greenwood.com', '206-555-0329'),
(330, 'Brand Architects', 'Marketing', 'Joseph Cook', 'joseph.cook@brandarchitects.com', '415-555-0330'),
(331, 'Elite Scholars Program', 'Education', 'Karen Morgan', 'karen.morgan@elitescholars.com', '617-555-0331'),
(332, 'The Royal Palm Resort', 'Hospitality', 'Charles Bell', 'charles.bell@royalpalm.com', '808-555-0332'),
(333, 'NetLogic Corporation', 'Technology', 'Nancy Murphy', 'nancy.murphy@netlogic.com', '408-555-0333'),
(334, 'Capital Trust Financial', 'Finance', 'Thomas Bailey', 'thomas.bailey@capitaltrust.com', '704-555-0334'),
(335, 'Aura Wellness Clinics', 'Healthcare', 'Sarah Rivera', 'sarah.rivera@aurawellness.com', '602-555-0335'),
(336, 'Omni-Weld Solutions', 'Manufacturing', 'Daniel Cooper', 'daniel.cooper@omniweld.com', '412-555-0336'),
(337, 'The General Storehouse', 'Retail', 'Maria Richardson', 'maria.richardson@generalstore.com', '214-555-0337'),
(338, 'The Summit Group', 'Consulting', 'Matthew Cox', 'matthew.cox@summitgroup.com', '404-555-0338'),
(339, 'WindStream Energy', 'Energy', 'Ashley Howard', 'ashley.howard@windstream.com', '713-555-0339'),
(340, 'BlueSky Realty', 'Real Estate', 'Joshua Ward', 'joshua.ward@bluesky.com', '305-555-0340'),
(341, 'Creative Juices Agency', 'Marketing', 'Megan Torres', 'megan.torres@creativejuices.com', '213-555-0341'),
(342, 'Knowledge First Tutors', 'Education', 'Andrew Peterson', 'andrew.peterson@knowledgefirst.com', '512-555-0342'),
(343, 'The Velvet Rope Hotels', 'Hospitality', 'Nicole Gray', 'nicole.gray@velvetrope.com', '702-555-0343'),
(344, 'CyberSphere Inc.', 'Technology', 'Justin Ramirez', 'justin.ramirez@cybersphere.com', '512-555-0344'),
(345, 'Equity One Bank', 'Finance', 'Heather James', 'heather.james@equityone.com', '212-555-0345'),
(346, 'First Response Medical', 'Healthcare', 'Brian Watson', 'brian.watson@firstresponse.com', '612-555-0346'),
(347, 'Industrial Matrix Co.', 'Manufacturing', 'Stephanie Brooks', 'stephanie.brooks@industrialmatrix.com', '313-555-0347'),
(348, 'The Modern Mercantile', 'Retail', 'Kevin Kelly', 'kevin.kelly@modernmercantile.com', '312-555-0348'),
(349, 'Pivot Point Consulting', 'Consulting', 'Laura Sanders', 'laura.sanders@pivotpoint.com', '202-555-0349'),
(350, 'Terra Firma Resources', 'Energy', 'Jason Price', 'jason.price@terrafirma.com', '713-555-0350'),
(351, 'Golden Key Real Estate', 'Real Estate', 'Rebecca Bennett', 'rebecca.bennett@goldenkey.com', '213-555-0351'),
(352, 'BrandWorks Media', 'Marketing', 'Brandon Wood', 'brandon.wood@brandworks.com', '415-555-0352'),
(353, 'The Learning Curve', 'Education', 'Kimberly Barnes', 'kimberly.barnes@learningcurve.com', '617-555-0353'),
(354, 'The Oasis Inn', 'Hospitality', 'Samuel Ross', 'samuel.ross@oasisinn.com', '702-555-0354'),
(355, 'InfoStream Technologies', 'Technology', 'Michelle Henderson', 'michelle.henderson@infostream.com', '408-555-0355'),
(356, 'Sterling Financial', 'Finance', 'Adam Coleman', 'adam.coleman@sterling.com', '704-555-0356'),
(357, 'BioGen Health', 'Healthcare', 'Cynthia Jenkins', 'cynthia.jenkins@biogen.com', '617-555-0357'),
(358, 'DuraBuild Industries', 'Manufacturing', 'Mark Perry', 'mark.perry@durabuild.com', '412-555-0358'),
(359, 'The Retail Connection', 'Retail', 'Debra Powell', 'debra.powell@retailconnection.com', '214-555-0359'),
(360, 'Strategic Alliance Group', 'Consulting', 'Ronald Long', 'ronald.long@strategicalliance.com', '404-555-0360'),
(361, 'HelioSource Energy', 'Energy', 'Amanda Patterson', 'amanda.patterson@heliosource.com', '602-555-0361'),
(362, 'Metro Realty Group', 'Real Estate', 'George Hughes', 'george.hughes@metrorealty.com', '312-555-0362'),
(363, 'The Ad Agency Inc.', 'Marketing', 'Sharon Flores', 'sharon.flores@theadagency.com', '213-555-0363'),
(364, 'The Education Network', 'Education', 'Edward Washington', 'edward.washington@educationnet.com', '512-555-0364'),
(365, 'The Platinum Stay Hotels', 'Hospitality', 'Sandra Butler', 'sandra.butler@platinumstay.com', '702-555-0365'),
(366, 'LogicCore Systems', 'Technology', 'Edward Simmons', 'edward.simmons@logiccore.com', '408-555-0366'),
(367, 'Trustworthy Capital', 'Finance', 'Donna Foster', 'donna.foster@trustworthy.com', '212-555-0367'),
(368, 'HealPoint Medical', 'Healthcare', 'Paul Gonzales', 'paul.gonzales@healpoint.com', '602-555-0368'),
(369, 'StrongArm Manufacturing', 'Manufacturing', 'Carol Bryant', 'carol.bryant@strongarm.com', '313-555-0369'),
(370, 'The Corner Market', 'Retail', 'Jose Alexander', 'jose.alexander@cornermarket.com', '214-555-0370'),
(371, 'Synergy Point Consulting', 'Consulting', 'Brenda Russell', 'brenda.russell@synergypoint.com', '202-555-0371'),
(372, 'GreenVolt Power', 'Energy', 'Raymond Griffin', 'raymond.griffin@greenvolt.com', '713-555-0372'),
(373, 'The Property Exchange', 'Real Estate', 'Pamela Diaz', 'pamela.diaz@propertyexchange.com', '305-555-0373'),
(374, 'Brand Champions', 'Marketing', 'Gregory Hayes', 'gregory.hayes@brandchampions.com', '415-555-0374'),
(375, 'The Knowledge Box', 'Education', 'Catherine Meyer', 'catherine.meyer@knowledgebox.com', '617-555-0375'),
(376, 'The Gilded Lily Hotels', 'Hospitality', 'Jack Graham', 'jack.graham@gildedlily.com', '702-555-0376'),
(377, 'NextGen Software Inc.', 'Technology', 'Dennis Sullivan', 'dennis.sullivan@nextgensoftware.com', '512-555-0377'),
(378, 'Capital Edge Finance', 'Finance', 'Ruth Wallace', 'ruth.wallace@capitaledge.com', '704-555-0378'),
(379, 'WellBeing Health System', 'Healthcare', 'Jerry Woods', 'jerry.woods@wellbeing.com', '612-555-0379'),
(380, 'Makers Guild Industries', 'Manufacturing', 'Ann Cole', 'ann.cole@makersguild.com', '412-555-0380'),
(381, 'The Local Merchant', 'Retail', 'Larry West', 'larry.west@localmerchant.com', '206-555-0381'),
(382, 'Apex Strategy Partners', 'Consulting', 'Frances Jordan', 'frances.jordan@apexstrategy.com', '404-555-0382'),
(383, 'Fusion Power Corp.', 'Energy', 'Henry Owens', 'henry.owens@fusionpower.com', '713-555-0383'),
(384, 'Prime Real Estate Group', 'Real Estate', 'Martha Reynolds', 'martha.reynolds@primere.com', '212-555-0384'),
(385, 'HyperDrive Marketing', 'Marketing', 'Walter Fisher', 'walter.fisher@hyperdrive.com', '213-555-0385'),
(386, 'The Scholar\'s Hub', 'Education', 'Joyce Ellis', 'joyce.ellis@scholarshub.com', '512-555-0386'),
(387, 'The Serene Villa Hotels', 'Hospitality', 'Peter Harrison', 'peter.harrison@serenevilla.com', '808-555-0387'),
(388, 'CircuitWorks Tech', 'Technology', 'Julie Gibson', 'julie.gibson@circuitworks.com', '408-555-0388'),
(389, 'First Pillar Bank', 'Finance', 'Alan Mcdonald', 'alan.mcdonald@firstpillar.com', '617-555-0389'),
(390, 'GuardianAngel Health', 'Healthcare', 'Cheryl Cruz', 'cheryl.cruz@guardianangel.com', '602-555-0390'),
(391, 'Industrial Logic Co.', 'Manufacturing', 'Frank Marshall', 'frank.marshall@industriallogic.com', '313-555-0391'),
(392, 'The Trendsetter\'s Bazaar', 'Retail', 'Marilyn Ortiz', 'marilyn.ortiz@trendsetters.com', '212-555-0392'),
(393, 'Alpha Tier Consulting', 'Consulting', 'Patrick Gomez', 'patrick.gomez@alphatier.com', '202-555-0393'),
(394, 'BioGen Fuels', 'Energy', 'Victoria Murray', 'victoria.murray@biogenfuels.com', '713-555-0394'),
(395, 'Red Door Realty', 'Real Estate', 'Steve Freeman', 'steve.freeman@reddoorrealty.com', '305-555-0395'),
(396, 'Momentum Marketing', 'Marketing', 'Mildred Wells', 'mildred.wells@momentum.com', '312-555-0396'),
(397, 'LearnSmart Academy', 'Education', 'Arthur Webb', 'arthur.webb@learnsmart.com', '617-555-0397'),
(398, 'The Sapphire Suites', 'Hospitality', 'Joan Simpson', 'joan.simpson@sapphire.com', '702-555-0398'),
(399, 'Next Wave Technologies', 'Technology', 'Billy Stevens', 'billy.stevens@nextwave.com', '512-555-0399'),
(400, 'Legacy Bank & Trust', 'Finance', 'Doris Tucker', 'doris.tucker@legacybank.com', '704-555-0400');

--
-- Triggers `Clients`
--
DELIMITER $$
CREATE TRIGGER `trg_Client_Before_Insert_Set_Industry` BEFORE INSERT ON `Clients` FOR EACH ROW BEGIN
    -- If the new row is trying to insert a NULL value for Industry,
    -- set it to 'Unknown' instead.
    IF NEW.Industry IS NULL THEN
        SET NEW.Industry = 'Unknown';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ELIGIBLE_CANDIDATES`
--

CREATE TABLE `ELIGIBLE_CANDIDATES` (
  `CandidateID` int(11) NOT NULL,
  `JOBID` bigint(20) NOT NULL,
  `HR_ID` bigint(20) NOT NULL,
  `ApplicationStatus` varchar(50) NOT NULL DEFAULT 'PENDING',
  `ApplyDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ELIGIBLE_CANDIDATES`
--

INSERT INTO `ELIGIBLE_CANDIDATES` (`CandidateID`, `JOBID`, `HR_ID`, `ApplicationStatus`, `ApplyDate`) VALUES
(2001, 1035, 655, 'Rejected', '2025-02-03'),
(2003, 1074, 669, 'PENDING', '2025-08-25'),
(2004, 1002, 510, 'Interviewing', '2025-10-05'),
(2006, 1055, 624, 'Interviewing', '2025-09-18'),
(2007, 1014, 699, 'Interviewing', '2025-08-26'),
(2008, 1003, 605, 'PENDING', '2025-08-20'),
(2010, 1093, 507, 'PENDING', '2025-03-16'),
(2011, 1004, 555, 'Rejected', '2025-09-10'),
(2016, 1019, 611, 'Rejected', '2025-06-25'),
(2017, 1036, 559, 'PENDING', '2025-09-01'),
(2019, 1006, 502, 'PENDING', '2025-09-25'),
(2022, 1017, 654, 'PENDING', '2025-07-30'),
(2024, 1075, 538, 'PENDING', '2025-06-08'),
(2025, 1001, 688, 'PENDING', '2025-10-02'),
(2027, 1056, 540, 'Offered', '2025-07-20'),
(2028, 1032, 692, 'PENDING', '2025-02-23'),
(2031, 1094, 524, 'PENDING', '2025-09-27'),
(2036, 1037, 595, 'PENDING', '2025-09-29'),
(2039, 1024, 544, 'PENDING', '2025-03-10'),
(2042, 1005, 591, 'PENDING', '2025-04-19'),
(2044, 1076, 609, 'Rejected', '2025-09-24'),
(2047, 1057, 509, 'PENDING', '2025-02-11'),
(2048, 1034, 629, 'Interviewing', '2025-09-18'),
(2051, 1021, 522, 'Interviewing', '2025-09-20'),
(2052, 1095, 574, 'Rejected', '2025-08-11'),
(2055, 1038, 518, 'PENDING', '2025-04-30'),
(2058, 1011, 571, 'PENDING', '2025-09-17'),
(2060, 1008, 531, 'PENDING', '2025-09-03'),
(2065, 1077, 685, 'PENDING', '2025-07-29'),
(2067, 1026, 689, 'Rejected', '2025-07-21'),
(2068, 1058, 598, 'PENDING', '2025-09-25'),
(2073, 1039, 533, 'PENDING', '2025-08-15'),
(2073, 1096, 561, 'PENDING', '2025-01-28'),
(2074, 1022, 588, 'PENDING', '2025-10-06'),
(2077, 1007, 677, 'Interviewing', '2025-02-28'),
(2083, 1012, 660, 'Rejected', '2025-08-04'),
(2086, 1078, 516, 'PENDING', '2025-09-12'),
(2089, 1059, 680, 'PENDING', '2025-08-31'),
(2091, 1009, 640, 'Offered', '2025-09-28'),
(2093, 1040, 568, 'Interviewing', '2025-09-12'),
(2094, 1097, 534, 'PENDING', '2025-09-11'),
(2099, 1028, 599, 'PENDING', '2025-08-15'),
(2107, 1079, 563, 'Interviewing', '2025-08-28'),
(2110, 1060, 556, 'Rejected', '2025-01-18'),
(2112, 1041, 683, 'PENDING', '2025-10-08'),
(2115, 1013, 515, 'PENDING', '2025-09-09'),
(2115, 1098, 602, 'PENDING', '2025-07-06'),
(2122, 1030, 529, 'Interviewing', '2025-10-04'),
(2128, 1080, 645, 'PENDING', '2025-10-05'),
(2130, 1010, 621, 'PENDING', '2025-01-12'),
(2131, 1061, 642, 'PENDING', '2025-09-05'),
(2134, 1042, 535, 'PENDING', '2025-09-28'),
(2136, 1099, 682, 'PENDING', '2025-08-23'),
(2148, 1015, 549, 'PENDING', '2025-10-03'),
(2149, 1081, 521, 'PENDING', '2025-05-27'),
(2152, 1062, 698, 'PENDING', '2025-07-12'),
(2155, 1043, 619, 'Rejected', '2025-06-17'),
(2157, 1100, 545, 'PENDING', '2025-09-22'),
(2169, 1016, 583, 'PENDING', '2024-12-23'),
(2170, 1082, 542, 'PENDING', '2025-09-18'),
(2173, 1063, 511, 'Interviewing', '2025-07-01'),
(2176, 1044, 525, 'PENDING', '2025-03-25'),
(2190, 1018, 530, 'Offered', '2025-09-15'),
(2191, 1083, 597, 'PENDING', '2025-08-15'),
(2194, 1064, 579, 'PENDING', '2025-09-15'),
(2198, 1045, 541, 'PENDING', '2025-08-29'),
(2212, 1084, 678, 'Rejected', '2025-07-23'),
(2215, 1065, 662, 'PENDING', '2025-08-19'),
(2219, 1046, 581, 'Interviewing', '2025-09-17'),
(2231, 1020, 666, 'PENDING', '2025-05-19'),
(2233, 1085, 528, 'PENDING', '2025-09-10'),
(2236, 1066, 532, 'PENDING', '2025-05-08'),
(2240, 1047, 695, 'PENDING', '2025-07-27'),
(2254, 1086, 631, 'PENDING', '2025-03-05'),
(2257, 1067, 615, 'PENDING', '2025-09-18'),
(2261, 1048, 519, 'PENDING', '2025-09-22'),
(2264, 1023, 508, 'PENDING', '2025-08-11'),
(2275, 1087, 694, 'PENDING', '2025-08-19'),
(2278, 1068, 688, 'Rejected', '2025-04-02'),
(2282, 1049, 649, 'PENDING', '2024-11-05'),
(2288, 1025, 634, 'PENDING', '2025-09-29'),
(2296, 1088, 505, 'Offered', '2025-10-02'),
(2299, 1069, 546, 'PENDING', '2025-09-03'),
(2303, 1050, 504, 'Rejected', '2025-09-30'),
(2317, 1089, 590, 'PENDING', '2025-04-07'),
(2320, 1070, 648, 'PENDING', '2025-10-01'),
(2321, 1027, 513, 'PENDING', '2025-09-11'),
(2324, 1051, 552, 'PENDING', '2025-08-10'),
(2338, 1090, 656, 'PENDING', '2025-09-03'),
(2341, 1071, 501, 'Interviewing', '2025-08-05'),
(2345, 1052, 594, 'PENDING', '2025-09-08'),
(2355, 1029, 675, 'PENDING', '2024-11-28'),
(2359, 1091, 554, 'Interviewing', '2025-09-16'),
(2362, 1072, 539, 'PENDING', '2025-09-11'),
(2366, 1053, 670, 'PENDING', '2025-06-03'),
(2379, 1031, 577, 'PENDING', '2025-08-22'),
(2380, 1092, 636, 'PENDING', '2025-06-21'),
(2383, 1073, 589, 'PENDING', '2025-04-22'),
(2387, 1054, 526, 'PENDING', '2025-08-25'),
(2399, 1033, 537, 'PENDING', '2025-07-15');

-- --------------------------------------------------------

--
-- Table structure for table `HR`
--

CREATE TABLE `HR` (
  `HR_ID` bigint(20) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `ClientID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `HR`
--

INSERT INTO `HR` (`HR_ID`, `FirstName`, `LastName`, `Email`, `ClientID`) VALUES
(501, 'Emily', 'Johnson', 'emily.johnson@staffingco.com', 215),
(502, 'Michael', 'Smith', 'michael.smith@staffingco.com', 121),
(503, 'Jessica', 'Williams', 'jessica.williams@staffingco.com', 345),
(504, 'Christopher', 'Brown', 'christopher.brown@staffingco.com', 180),
(505, 'Ashley', 'Jones', 'ashley.jones@staffingco.com', 250),
(506, 'Matthew', 'Garcia', 'matthew.garcia@staffingco.com', 102),
(507, 'Amanda', 'Miller', 'amanda.miller@staffingco.com', 388),
(508, 'Joshua', 'Davis', 'joshua.davis@staffingco.com', 159),
(509, 'Sarah', 'Rodriguez', 'sarah.rodriguez@staffingco.com', 291),
(510, 'David', 'Martinez', 'david.martinez@staffingco.com', 111),
(511, 'Jennifer', 'Hernandez', 'jennifer.hernandez@staffingco.com', 203),
(512, 'James', 'Lopez', 'james.lopez@staffingco.com', 305),
(513, 'Megan', 'Gonzalez', 'megan.gonzalez@staffingco.com', 148),
(514, 'Daniel', 'Wilson', 'daniel.wilson@staffingco.com', 377),
(515, 'Elizabeth', 'Anderson', 'elizabeth.anderson@staffingco.com', 195),
(516, 'Robert', 'Thomas', 'robert.thomas@staffingco.com', 234),
(517, 'Nicole', 'Taylor', 'nicole.taylor@staffingco.com', 333),
(518, 'Joseph', 'Moore', 'joseph.moore@staffingco.com', 176),
(519, 'Stephanie', 'Jackson', 'stephanie.jackson@staffingco.com', 267),
(520, 'William', 'Martin', 'william.martin@staffingco.com', 312),
(521, 'Lauren', 'Lee', 'lauren.lee@staffingco.com', 118),
(522, 'Anthony', 'Perez', 'anthony.perez@staffingco.com', 222),
(523, 'Kimberly', 'Thompson', 'kimberly.thompson@staffingco.com', 399),
(524, 'Kevin', 'White', 'kevin.white@staffingco.com', 140),
(525, 'Michelle', 'Harris', 'michelle.harris@staffingco.com', 280),
(526, 'Brian', 'Sanchez', 'brian.sanchez@staffingco.com', 365),
(527, 'Heather', 'Clark', 'heather.clark@staffingco.com', 109),
(528, 'John', 'Ramirez', 'john.ramirez@staffingco.com', 255),
(529, 'Laura', 'Lewis', 'laura.lewis@staffingco.com', 321),
(530, 'Jason', 'Robinson', 'jason.robinson@staffingco.com', 165),
(531, 'Tiffany', 'Walker', 'tiffany.walker@staffingco.com', 211),
(532, 'Mark', 'Young', 'mark.young@staffingco.com', 354),
(533, 'Mary', 'Allen', 'mary.allen@staffingco.com', 133),
(534, 'Paul', 'King', 'paul.king@staffingco.com', 276),
(535, 'Melissa', 'Wright', 'melissa.wright@staffingco.com', 301),
(536, 'Eric', 'Scott', 'eric.scott@staffingco.com', 199),
(537, 'Christina', 'Torres', 'christina.torres@staffingco.com', 243),
(538, 'Ryan', 'Nguyen', 'ryan.nguyen@staffingco.com', 381),
(539, 'Amy', 'Hill', 'amy.hill@staffingco.com', 129),
(540, 'Gary', 'Flores', 'gary.flores@staffingco.com', 208),
(541, 'Rebecca', 'Green', 'rebecca.green@staffingco.com', 330),
(542, 'Nicholas', 'Adams', 'nicholas.adams@staffingco.com', 171),
(543, 'Angela', 'Nelson', 'angela.nelson@staffingco.com', 266),
(544, 'Justin', 'Baker', 'justin.baker@staffingco.com', 392),
(545, 'Crystal', 'Hall', 'crystal.hall@staffingco.com', 155),
(546, 'Brandon', 'Rivera', 'brandon.rivera@staffingco.com', 219),
(547, 'Rachel', 'Campbell', 'rachel.campbell@staffingco.com', 348),
(548, 'Scott', 'Mitchell', 'scott.mitchell@staffingco.com', 115),
(549, 'Lisa', 'Carter', 'lisa.carter@staffingco.com', 299),
(550, 'Benjamin', 'Roberts', 'benjamin.roberts@staffingco.com', 371),
(551, 'Samantha', 'Gomez', 'samantha.gomez@staffingco.com', 188),
(552, 'Adam', 'Phillips', 'adam.phillips@staffingco.com', 239),
(553, 'Maria', 'Evans', 'maria.evans@staffingco.com', 317),
(554, 'Patrick', 'Turner', 'patrick.turner@staffingco.com', 162),
(555, 'Christine', 'Diaz', 'christine.diaz@staffingco.com', 271),
(556, 'Andrew', 'Parker', 'andrew.parker@staffingco.com', 390),
(557, 'Amanda', 'Cruz', 'amanda.cruz@staffingco.com', 105),
(558, 'Richard', 'Edwards', 'richard.edwards@staffingco.com', 248),
(559, 'Cynthia', 'Collins', 'cynthia.collins@staffingco.com', 328),
(560, 'Steven', 'Reyes', 'steven.reyes@staffingco.com', 192),
(561, 'Shannon', 'Stewart', 'shannon.stewart@staffingco.com', 288),
(562, 'Thomas', 'Morris', 'thomas.morris@staffingco.com', 357),
(563, 'Danielle', 'Morales', 'danielle.morales@staffingco.com', 145),
(564, 'Edward', 'Murphy', 'edward.murphy@staffingco.com', 215),
(565, 'Amber', 'Cook', 'amber.cook@staffingco.com', 308),
(566, 'Jonathan', 'Rogers', 'jonathan.rogers@staffingco.com', 125),
(567, 'Jessica', 'Gutierrez', 'jessica.gutierrez@staffingco.com', 262),
(568, 'Gregory', 'Ortiz', 'gregory.ortiz@staffingco.com', 340),
(569, 'Sara', 'Morgan', 'sara.morgan@staffingco.com', 183),
(570, 'Charles', 'Cooper', 'charles.cooper@staffingco.com', 295),
(571, 'Kathleen', 'Peterson', 'kathleen.peterson@staffingco.com', 368),
(572, 'Jose', 'Bailey', 'jose.bailey@staffingco.com', 139),
(573, 'Kelly', 'Reed', 'kelly.reed@staffingco.com', 227),
(574, 'Stephen', 'Kelly', 'stephen.kelly@staffingco.com', 315),
(575, 'Erica', 'Howard', 'erica.howard@staffingco.com', 177),
(576, 'Timothy', 'Ramos', 'timothy.ramos@staffingco.com', 258),
(577, 'Valerie', 'Kim', 'valerie.kim@staffingco.com', 337),
(578, 'George', 'Cox', 'george.cox@staffingco.com', 112),
(579, 'Anna', 'Ward', 'anna.ward@staffingco.com', 201),
(580, 'Aaron', 'Richardson', 'aaron.richardson@staffingco.com', 292),
(581, 'Jacqueline', 'Watson', 'jacqueline.watson@staffingco.com', 375),
(582, 'Jeffrey', 'Brooks', 'jeffrey.brooks@staffingco.com', 151),
(583, 'Brittany', 'Chavez', 'brittany.chavez@staffingco.com', 245),
(584, 'Henry', 'Wood', 'henry.wood@staffingco.com', 325),
(585, 'Christina', 'James', 'christina.james@staffingco.com', 168),
(586, 'Douglas', 'Bennett', 'douglas.bennett@staffingco.com', 279),
(587, 'Rachel', 'Gray', 'rachel.gray@staffingco.com', 351),
(588, 'Peter', 'Mendoza', 'peter.mendoza@staffingco.com', 101),
(589, 'Catherine', 'Hughes', 'catherine.hughes@staffingco.com', 230),
(590, 'Kyle', 'Price', 'kyle.price@staffingco.com', 302),
(591, 'Diana', 'Alvarez', 'diana.alvarez@staffingco.com', 190),
(592, 'Walter', 'Castillo', 'walter.castillo@staffingco.com', 283),
(593, 'Andrea', 'Sanders', 'andrea.sanders@staffingco.com', 361),
(594, 'Jerry', 'Patel', 'jerry.patel@staffingco.com', 122),
(595, 'Julie', 'Myers', 'julie.myers@staffingco.com', 212),
(596, 'Sean', 'Long', 'sean.long@staffingco.com', 395),
(597, 'Victoria', 'Ross', 'victoria.ross@staffingco.com', 174),
(598, 'Dennis', 'Foster', 'dennis.foster@staffingco.com', 251),
(599, 'Kathryn', 'Jimenez', 'kathryn.jimenez@staffingco.com', 335),
(600, 'Frank', 'Powell', 'frank.powell@staffingco.com', 150),
(601, 'Teresa', 'Jenkins', 'teresa.jenkins@staffingco.com', 367),
(602, 'Keith', 'Perry', 'keith.perry@staffingco.com', 307),
(603, 'Carol', 'Russell', 'carol.russell@staffingco.com', 389),
(604, 'Bryan', 'Sullivan', 'bryan.sullivan@staffingco.com', 131),
(605, 'Denise', 'Bell', 'denise.bell@staffingco.com', 157),
(606, 'Jordan', 'Coleman', 'jordan.coleman@staffingco.com', 220),
(607, 'Cheryl', 'Butler', 'cheryl.butler@staffingco.com', 268),
(608, 'Samuel', 'Henderson', 'samuel.henderson@staffingco.com', 347),
(609, 'Heather', 'Barnes', 'heather.barnes@staffingco.com', 379),
(610, 'Arthur', 'Fisher', 'arthur.fisher@staffingco.com', 107),
(611, 'Janet', 'Vasquez', 'janet.vasquez@staffingco.com', 185),
(612, 'Phillip', 'Warren', 'phillip.warren@staffingco.com', 284),
(613, 'Brenda', 'Marshall', 'brenda.marshall@staffingco.com', 327),
(614, 'Bradley', 'Owens', 'bradley.owens@staffingco.com', 138),
(615, 'Debra', 'Knight', 'debra.knight@staffingco.com', 206),
(616, 'Wayne', 'Snyder', 'wayne.snyder@staffingco.com', 293),
(617, 'Sharon', 'Fox', 'sharon.fox@staffingco.com', 386),
(618, 'Randy', 'Hunt', 'randy.hunt@staffingco.com', 126),
(619, 'Pamela', 'Black', 'pamela.black@staffingco.com', 341),
(620, 'Louis', 'Gordon', 'louis.gordon@staffingco.com', 161),
(621, 'Shirley', 'Holmes', 'shirley.holmes@staffingco.com', 241),
(622, 'Russell', 'Rice', 'russell.rice@staffingco.com', 303),
(623, 'Judith', 'Robertson', 'judith.robertson@staffingco.com', 364),
(624, 'Carl', 'Shaw', 'carl.shaw@staffingco.com', 114),
(625, 'Theresa', 'Stone', 'theresa.stone@staffingco.com', 197),
(626, 'Roger', 'Porter', 'roger.porter@staffingco.com', 275),
(627, 'Marilyn', 'Hamilton', 'marilyn.hamilton@staffingco.com', 359),
(628, 'Keith', 'Graham', 'keith.graham@staffingco.com', 147),
(629, 'Emily', 'Wallace', 'emily.wallace@staffingco.com', 228),
(630, 'Juan', 'West', 'juan.west@staffingco.com', 323),
(631, 'Ashley', 'Gilbert', 'ashley.gilbert@staffingco.com', 382),
(632, 'Helen', 'Woods', 'helen.woods@staffingco.com', 173),
(633, 'Willie', 'Burton', 'willie.burton@staffingco.com', 257),
(634, 'Austin', 'Stephens', 'austin.stephens@staffingco.com', 311),
(635, 'Billy', 'George', 'billy.george@staffingco.com', 120),
(636, 'Deborah', 'Jacobs', 'deborah.jacobs@staffingco.com', 200),
(637, 'Roy', 'Ramos', 'roy.ramos@staffingco.com', 269),
(638, 'Joyce', 'Carpenter', 'joyce.carpenter@staffingco.com', 353),
(639, 'Alan', 'Mason', 'alan.mason@staffingco.com', 104),
(640, 'Ann', 'Harrison', 'ann.harrison@staffingco.com', 191),
(641, 'Clarence', 'Gibson', 'clarence.gibson@staffingco.com', 281),
(642, 'Ruth', 'Kennedy', 'ruth.kennedy@staffingco.com', 373),
(643, 'Howard', 'Wells', 'howard.wells@staffingco.com', 142),
(644, 'Larry', 'Murray', 'larry.murray@staffingco.com', 236),
(645, 'Frances', 'Freeman', 'frances.freeman@staffingco.com', 338),
(646, 'Doris', 'Cunningham', 'doris.cunningham@staffingco.com', 166),
(647, 'Eugene', 'Webb', 'eugene.webb@staffingco.com', 253),
(648, 'Lori', 'Sims', 'lori.sims@staffingco.com', 319),
(649, 'Jesse', 'Lawrence', 'jesse.lawrence@staffingco.com', 391),
(650, 'Beverly', 'Franklin', 'beverly.franklin@staffingco.com', 117),
(651, 'Todd', 'Lawson', 'todd.lawson@staffingco.com', 225),
(652, 'Philip', 'Burke', 'philip.burke@staffingco.com', 286),
(653, 'Rose', 'Olson', 'rose.olson@staffingco.com', 355),
(654, 'Antonio', 'Jordan', 'antonio.jordan@staffingco.com', 134),
(655, 'Norma', 'Armstrong', 'norma.armstrong@staffingco.com', 217),
(656, 'Craig', 'Payne', 'craig.payne@staffingco.com', 309),
(657, 'Janice', 'Hamilton', 'janice.hamilton@staffingco.com', 380),
(658, 'Terry', 'Pierce', 'terry.pierce@staffingco.com', 130),
(659, 'Shawn', 'Mcdonald', 'shawn.mcdonald@staffingco.com', 249),
(660, 'Sara', 'Hayes', 'sara.hayes@staffingco.com', 343),
(661, 'Albert', 'Elliott', 'albert.elliott@staffingco.com', 154),
(662, 'Jean', 'Romero', 'jean.romero@staffingco.com', 264),
(663, 'Christian', 'Mills', 'christian.mills@staffingco.com', 329),
(664, 'Marie', 'Nichols', 'marie.nichols@staffingco.com', 398),
(665, 'Kathy', 'Hunter', 'kathy.hunter@staffingco.com', 108),
(666, 'Willie', 'Ryan', 'willie.ryan@staffingco.com', 194),
(667, 'Joan', 'Rose', 'joan.rose@staffingco.com', 273),
(668, 'Harold', 'Gardner', 'harold.gardner@staffingco.com', 350),
(669, 'Lawrence', 'Andrews', 'lawrence.andrews@staffingco.com', 144),
(670, 'Gloria', 'Boyd', 'gloria.boyd@staffingco.com', 233),
(671, 'Gerald', 'Franklin', 'gerald.franklin@staffingco.com', 314),
(672, 'Irene', 'Meyer', 'irene.meyer@staffingco.com', 385),
(673, 'Evelyn', 'Austin', 'evelyn.austin@staffingco.com', 123),
(674, 'Henry', 'Ford', 'henry.ford@staffingco.com', 204),
(675, 'Mildred', 'Dunn', 'mildred.dunn@staffingco.com', 298),
(676, 'Shawn', 'Perkins', 'shawn.perkins@staffingco.com', 370),
(677, 'Carolyn', 'Hudson', 'carolyn.hudson@staffingco.com', 149),
(678, 'Chris', 'Spencer', 'chris.spencer@staffingco.com', 246),
(679, 'Virginia', 'Ray', 'virginia.ray@staffingco.com', 332),
(680, 'Ralph', 'Watkins', 'ralph.watkins@staffingco.com', 169),
(681, 'Diana', 'Larson', 'diana.larson@staffingco.com', 259),
(682, 'Martin', 'Riley', 'martin.riley@staffingco.com', 322),
(683, 'Bruce', 'Fuller', 'bruce.fuller@staffingco.com', 400),
(684, 'Julia', 'Montgomery', 'julia.montgomery@staffingco.com', 136),
(685, 'Judy', 'Gibson', 'judy.gibson@staffingco.com', 210),
(686, 'Louis', 'Hicks', 'louis.hicks@staffingco.com', 278),
(687, 'Denise', 'Ball', 'denise.ball@staffingco.com', 344),
(688, 'Grace', 'Byrd', 'grace.byrd@staffingco.com', 158),
(689, 'Randy', 'Day', 'randy.day@staffingco.com', 223),
(690, 'Martha', 'Carroll', 'martha.carroll@staffingco.com', 300),
(691, 'Johnny', 'Warren', 'johnny.warren@staffingco.com', 376),
(692, 'Alice', 'Fowler', 'alice.fowler@staffingco.com', 119),
(693, 'Vincent', 'Hansen', 'vincent.hansen@staffingco.com', 213),
(694, 'Lillian', 'Grant', 'lillian.grant@staffingco.com', 297),
(695, 'Noah', 'Sutton', 'noah.sutton@staffingco.com', 363),
(696, 'Diane', 'Gregory', 'diane.gregory@staffingco.com', 135),
(697, 'Carlos', 'Wolfe', 'carlos.wolfe@staffingco.com', 252),
(698, 'Judith', 'Goodwin', 'judith.goodwin@staffingco.com', 326),
(699, 'Zachary', 'Lucas', 'zachary.lucas@staffingco.com', 384),
(700, 'Beverly', 'Miles', 'beverly.miles@staffingco.com', 163);

-- --------------------------------------------------------

--
-- Table structure for table `JOBS`
--

CREATE TABLE `JOBS` (
  `JobID` bigint(20) NOT NULL,
  `JobTitle` varchar(100) NOT NULL,
  `ClientID` bigint(20) NOT NULL,
  `JobDescription` text DEFAULT NULL,
  `JobType` varchar(50) DEFAULT NULL,
  `PayRate` decimal(10,2) DEFAULT NULL,
  `DatePosted` date NOT NULL,
  `IsOpen` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `JOBS`
--

INSERT INTO `JOBS` (`JobID`, `JobTitle`, `ClientID`, `JobDescription`, `JobType`, `PayRate`, `DatePosted`, `IsOpen`) VALUES
(1001, 'Project Manager', 215, 'Seeking a driven Project Manager to lead cross-functional teams and ensure project deadlines are met. Strong organizational skills required.', 'Full-Time', 115000.00, '2025-09-28', 0),
(1002, 'Software Engineer', 121, 'We are hiring a skilled Software Engineer to develop high-quality software solutions. Must be proficient in Python and AWS.', 'Full-Time', 132000.00, '2025-10-02', 0),
(1003, 'Registered Nurse', 345, 'A compassionate Registered Nurse is needed for our fast-paced medical clinic. Responsibilities include patient care and record keeping.', 'Contract', 55.75, '2025-08-15', 1),
(1004, 'Financial Analyst', 180, 'Entry-level Financial Analyst position available. The ideal candidate will analyze financial data and create reports for management.', 'Full-Time', 72000.00, '2025-09-05', 1),
(1005, 'Human Resources Generalist', 250, 'Looking for an experienced HR Generalist to manage recruiting, onboarding, and employee relations.', 'Full-Time', 83000.00, '2025-04-11', 0),
(1006, 'IT Support Specialist', 102, 'Hiring an IT Support Specialist to provide technical assistance to our staff. Experience with Windows and network troubleshooting is essential.', 'Temp-to-Hire', 32.50, '2025-09-18', 1),
(1007, 'Marketing Coordinator', 388, 'Creative Marketing Coordinator needed to assist in the development and implementation of marketing campaigns. Social media skills are a plus.', 'Full-Time', 61000.00, '2025-02-20', 0),
(1008, 'Data Scientist', 159, 'Join our analytics team as a Data Scientist. You will be responsible for building machine learning models and generating insights from large datasets.', 'Full-Time', 145000.00, '2025-08-29', 1),
(1009, 'Accountant', 291, 'Detail-oriented Accountant wanted for a contract role. Responsibilities include managing accounts payable/receivable and preparing financial statements.', 'Contract', 48.00, '2025-09-22', 1),
(1010, 'Executive Assistant', 111, 'Seeking a professional Executive Assistant to support C-level executives. Requires excellent communication skills and discretion.', 'Full-Time', 75000.00, '2025-01-05', 0),
(1011, 'UI/UX Designer', 203, 'A talented UI/UX Designer is needed to create intuitive and visually appealing interfaces for our web and mobile applications.', 'Contract', 65.20, '2025-09-11', 1),
(1012, 'Sales Representative', 305, 'Dynamic Sales Representative sought to build client relationships and drive revenue growth. Commission-based compensation available.', 'Full-Time', 68000.00, '2025-07-30', 0),
(1013, 'Medical Assistant', 148, 'Our healthcare facility needs a reliable Medical Assistant to perform administrative and clinical duties.', 'Temp-to-Hire', 28.75, '2025-09-02', 1),
(1014, 'DevOps Engineer', 377, 'Hiring a DevOps Engineer to manage our CI/CD pipelines and cloud infrastructure. Experience with Docker and Kubernetes is required.', 'Full-Time', 155000.00, '2025-08-21', 1),
(1015, 'Customer Service Representative', 195, 'Friendly Customer Service Representative needed for a busy call center. This is a temp-to-hire opportunity.', 'Temp-to-Hire', 24.00, '2025-09-30', 1),
(1016, 'Risk Manager', 234, 'Our financial institution is looking for a Risk Manager to identify and mitigate financial and operational risks.', 'Full-Time', 128000.00, '2024-12-15', 0),
(1017, 'Lab Technician', 333, 'A certified Lab Technician is required for a 6-month contract role in our medical research facility.', 'Contract', 35.50, '2025-07-25', 1),
(1018, 'Senior Java Developer', 176, 'Experienced Senior Java Developer needed to architect and build robust backend systems. Must have 8+ years of experience.', 'Full-Time', 160000.00, '2025-09-08', 1),
(1019, 'Bookkeeper', 267, 'Part-time Bookkeeper needed to manage financial records for a small business. Flexible hours available.', 'Contract', 30.00, '2025-06-19', 0),
(1020, 'Healthcare Administrator', 312, 'Seeking an organized Healthcare Administrator to oversee the daily operations of our clinic. Master\'s degree preferred.', 'Full-Time', 95000.00, '2025-05-14', 0),
(1021, 'Senior Accountant', 118, 'A CPA-certified Senior Accountant is needed to lead our accounting department. Responsibilities include financial reporting and compliance.', 'Full-Time', 105000.00, '2025-09-17', 1),
(1022, 'Graphic Designer', 222, 'Creative Graphic Designer wanted for a 3-month contract to create marketing materials and website assets.', 'Contract', 45.80, '2025-10-01', 1),
(1023, 'Network Engineer', 399, 'Hiring a Network Engineer to design, implement, and maintain our corporate network infrastructure.', 'Full-Time', 118000.00, '2025-08-05', 1),
(1024, 'Paralegal', 140, 'Our law firm is seeking a Paralegal with experience in corporate law. This is a temp-to-hire position with excellent benefits.', 'Temp-to-Hire', 38.50, '2025-03-03', 0),
(1025, 'Content Writer', 280, 'We need a skilled Content Writer to create engaging blog posts, articles, and website copy for our marketing team.', 'Contract', 40.00, '2025-09-25', 1),
(1026, 'Operations Manager', 365, 'Experienced Operations Manager needed to streamline processes and improve efficiency in our manufacturing plant.', 'Full-Time', 110000.00, '2025-07-16', 1),
(1027, 'Systems Analyst', 109, 'Seeking a Systems Analyst to analyze business requirements and translate them into technical specifications for our IT team.', 'Full-Time', 92000.00, '2025-09-04', 1),
(1028, 'Quality Assurance Tester', 255, 'A meticulous QA Tester is needed to perform manual and automated testing on our software products.', 'Contract', 42.25, '2025-08-11', 1),
(1029, 'Recruiter', 321, 'Our company is hiring an internal Recruiter to source and screen candidates for various open positions.', 'Full-Time', 78000.00, '2024-11-20', 0),
(1030, 'Web Developer (Frontend)', 165, 'Frontend Web Developer with strong skills in React and CSS needed to build responsive user interfaces.', 'Temp-to-Hire', 58.00, '2025-09-29', 1),
(1031, 'Database Administrator', 211, 'Experienced Database Administrator (DBA) needed to manage and maintain our SQL databases.', 'Full-Time', 125000.00, '2025-08-18', 0),
(1032, 'Auditor', 354, 'An internal Auditor is needed to assess financial controls and ensure compliance with regulations.', 'Full-Time', 89000.00, '2025-02-17', 0),
(1033, 'Logistics Coordinator', 133, 'Hiring a Logistics Coordinator to manage supply chain operations, including shipping and inventory.', 'Contract', 33.70, '2025-07-09', 1),
(1034, 'Social Media Manager', 276, 'We are looking for a Social Media Manager to grow our online presence and engage with our community.', 'Full-Time', 71000.00, '2025-09-16', 1),
(1035, 'Business Analyst', 301, 'A Business Analyst is needed to bridge the gap between business stakeholders and the IT team. Strong analytical skills are a must.', 'Full-Time', 98000.00, '2025-01-28', 0),
(1036, 'Technical Writer', 199, 'Seeking a Technical Writer to create clear and concise documentation for our software products.', 'Contract', 47.50, '2025-08-27', 1),
(1037, 'Office Manager', 243, 'Organized Office Manager needed to handle administrative tasks and ensure the smooth running of our office.', 'Full-Time', 64000.00, '2025-09-23', 1),
(1038, 'Mechanical Engineer', 381, 'Our engineering firm is hiring a Mechanical Engineer to design and develop mechanical systems.', 'Full-Time', 94000.00, '2025-04-22', 0),
(1039, 'Product Manager', 129, 'Hiring a Product Manager to define product vision, strategy, and roadmap for our flagship software.', 'Full-Time', 140000.00, '2025-08-12', 1),
(1040, 'Legal Secretary', 208, 'A skilled Legal Secretary is needed to provide administrative support to our team of attorneys.', 'Temp-to-Hire', 29.80, '2025-09-09', 1),
(1041, 'Data Analyst', 330, 'Entry-level Data Analyst position available. You will be responsible for cleaning, analyzing, and visualizing data.', 'Contract', 36.00, '2025-10-03', 1),
(1042, 'Warehouse Associate', 171, 'We need reliable Warehouse Associates for a temp-to-hire position. Duties include packing, shipping, and receiving.', 'Temp-to-Hire', 21.50, '2025-09-24', 1),
(1043, 'Cloud Engineer', 266, 'Hiring a Cloud Engineer with experience in Azure to help manage and scale our cloud infrastructure.', 'Full-Time', 135000.00, '2025-06-11', 0),
(1044, 'Financial Planner', 392, 'Our wealth management firm is seeking a Financial Planner to provide investment advice to clients.', 'Full-Time', 102000.00, '2025-03-18', 0),
(1045, 'Scrum Master', 155, 'A certified Scrum Master is needed to facilitate agile development processes for two of our software teams.', 'Contract', 72.00, '2025-08-25', 1),
(1046, 'Civil Engineer', 219, 'Seeking a licensed Civil Engineer to work on public infrastructure projects.', 'Full-Time', 99000.00, '2025-09-12', 0),
(1047, 'Cybersecurity Analyst', 348, 'A Cybersecurity Analyst is needed to monitor our systems for threats and respond to security incidents.', 'Full-Time', 112000.00, '2025-07-22', 1),
(1048, 'Pharmacist', 115, 'Licensed Pharmacist needed for a contract position at our community pharmacy.', 'Contract', 68.90, '2025-09-19', 1),
(1049, 'Event Coordinator', 299, 'Hiring an energetic Event Coordinator to plan and execute corporate events and trade shows.', 'Full-Time', 67000.00, '2024-10-30', 0),
(1050, 'Full Stack Developer', 371, 'Full Stack Developer with experience in Node.js and React needed to work on all aspects of our web application.', 'Full-Time', 128000.00, '2025-09-26', 1),
(1051, 'Architect', 188, 'Our architectural firm is looking for a licensed Architect to design commercial and residential buildings.', 'Full-Time', 108000.00, '2025-08-01', 1),
(1052, 'Help Desk Technician', 239, 'Entry-level Help Desk Technician needed to provide first-level technical support.', 'Temp-to-Hire', 26.50, '2025-09-03', 1),
(1053, 'Electrical Engineer', 317, 'Seeking an Electrical Engineer to design and test electrical systems for industrial applications.', 'Full-Time', 96000.00, '2025-05-28', 0),
(1054, 'SEO Specialist', 162, 'An SEO Specialist is needed to improve our website\'s search engine rankings and drive organic traffic.', 'Contract', 50.00, '2025-08-20', 1),
(1055, 'Interior Designer', 271, 'Creative Interior Designer wanted to work with clients on residential and commercial design projects.', 'Full-Time', 73000.00, '2025-09-15', 1),
(1056, 'Physician Assistant', 390, 'A certified Physician Assistant is needed for our family medicine practice. Full-time position with benefits.', 'Full-Time', 115000.00, '2025-07-14', 0),
(1057, 'Supply Chain Analyst', 105, 'Hiring a Supply Chain Analyst to analyze and optimize our supply chain and logistics operations.', 'Full-Time', 81000.00, '2025-02-05', 0),
(1058, 'Mobile App Developer (iOS)', 248, 'Experienced iOS Developer needed to build and maintain our native iOS application using Swift.', 'Contract', 85.50, '2025-09-21', 1),
(1059, 'Compliance Officer', 328, 'Our company is looking for a Compliance Officer to ensure we adhere to legal standards and internal policies.', 'Full-Time', 97000.00, '2025-08-26', 1),
(1060, 'Insurance Agent', 192, 'Licensed Insurance Agent needed to sell policies and provide customer service to clients.', 'Full-Time', 59000.00, '2025-01-12', 0),
(1061, 'Public Relations Specialist', 288, 'A PR Specialist is needed to manage media relations and build a positive public image for our brand.', 'Full-Time', 76000.00, '2025-09-01', 1),
(1062, 'Biomedical Engineer', 357, 'Hiring a Biomedical Engineer to design and develop medical devices and equipment.', 'Full-Time', 91000.00, '2025-07-07', 1),
(1063, 'Hotel Manager', 145, 'Experienced Hotel Manager needed to oversee the operations of our boutique hotel.', 'Full-Time', 84000.00, '2025-06-25', 0),
(1064, 'Data Entry Clerk', 215, 'A fast and accurate Data Entry Clerk is needed for a 4-month contract. High attention to detail is required.', 'Contract', 22.00, '2025-09-10', 1),
(1065, 'Video Editor', 308, 'Skilled Video Editor wanted to edit marketing videos and corporate communications.', 'Temp-to-Hire', 39.75, '2025-08-14', 1),
(1066, 'Investment Banker', 125, 'Our firm is seeking an Investment Banker to work on mergers, acquisitions, and capital raising.', 'Full-Time', 175000.00, '2025-05-01', 1),
(1067, 'Environmental Scientist', 262, 'An Environmental Scientist is needed to conduct research and develop solutions to environmental problems.', 'Full-Time', 80000.00, '2025-09-13', 0),
(1068, 'Real Estate Agent', 340, 'Licensed Real Estate Agent needed to assist clients with buying and selling properties.', 'Full-Time', 55000.00, '2025-03-27', 0),
(1069, 'Fashion Designer', 183, 'Creative Fashion Designer needed to design and develop new apparel lines.', 'Full-Time', 79000.00, '2025-08-28', 1),
(1070, 'Solar Panel Installer', 295, 'Hiring Solar Panel Installers for a large commercial project. Experience is preferred but not required.', 'Contract', 31.25, '2025-09-27', 1),
(1071, 'Dental Hygienist', 368, 'A licensed Dental Hygienist is needed for our busy dental practice. Part-time and full-time options available.', 'Temp-to-Hire', 44.50, '2025-07-29', 1),
(1072, 'Retail Store Manager', 139, 'Experienced Retail Store Manager needed to lead a team and drive sales at our flagship store.', 'Full-Time', 70000.00, '2025-09-06', 0),
(1073, 'Purchasing Agent', 227, 'Seeking a Purchasing Agent to procure goods and services for our company. Strong negotiation skills required.', 'Full-Time', 74000.00, '2025-04-16', 0),
(1074, 'DevOps Manager', 315, 'Hiring a DevOps Manager to lead our team of engineers and oversee our cloud infrastructure strategy.', 'Full-Time', 170000.00, '2025-08-19', 1),
(1075, 'Teacher (High School Math)', 177, 'Certified High School Math Teacher needed for the upcoming school year. This is a full-time position.', 'Full-Time', 63000.00, '2025-06-02', 0),
(1076, 'Physical Therapist', 258, 'A licensed Physical Therapist is needed to treat patients with injuries and mobility issues.', 'Contract', 58.30, '2025-09-20', 1),
(1077, 'Construction Project Manager', 337, 'Hiring a Construction Project Manager to oversee building projects from conception to completion.', 'Full-Time', 120000.00, '2025-07-23', 0),
(1078, 'Chef', 112, 'Our upscale restaurant is looking for a creative and experienced Chef to lead our kitchen team.', 'Full-Time', 88000.00, '2025-09-07', 1),
(1079, 'Machine Learning Engineer', 201, 'A Machine Learning Engineer is needed to design and implement ML algorithms for our data products.', 'Full-Time', 150000.00, '2025-08-22', 0),
(1080, 'Welder', 292, 'Certified Welder needed for a manufacturing facility. This is a temp-to-hire position on the second shift.', 'Temp-to-Hire', 29.00, '2025-09-30', 1),
(1081, 'Librarian', 375, 'Our public library is seeking a Librarian with a Master\'s in Library Science to manage collections and assist patrons.', 'Full-Time', 66000.00, '2025-05-20', 0),
(1082, 'Business Development Manager', 151, 'Hiring a Business Development Manager to identify new business opportunities and build strategic partnerships.', 'Full-Time', 112000.00, '2025-09-14', 1),
(1083, 'UX Researcher', 245, 'A UX Researcher is needed to conduct user studies and provide insights to inform our product design.', 'Contract', 62.75, '2025-08-08', 1),
(1084, 'CNC Machinist', 325, 'Skilled CNC Machinist needed to operate and maintain CNC machinery in our production facility.', 'Full-Time', 69000.00, '2025-07-17', 1),
(1085, 'Technical Support Engineer', 168, 'A Technical Support Engineer is needed to provide advanced support for our enterprise software clients.', 'Full-Time', 86000.00, '2025-09-05', 1),
(1086, 'Loan Officer', 279, 'Our bank is hiring a Loan Officer to evaluate and authorize loan applications for individuals and businesses.', 'Full-Time', 77000.00, '2025-02-26', 0),
(1087, 'Property Manager', 351, 'Experienced Property Manager needed to oversee a portfolio of residential and commercial properties.', 'Full-Time', 82000.00, '2025-08-13', 0),
(1088, 'Android Developer', 101, 'Hiring an Android Developer to design and build applications for the Android platform using Kotlin.', 'Contract', 82.00, '2025-09-28', 1),
(1089, 'Urban Planner', 230, 'Our city planning department is seeking an Urban Planner to work on zoning, land use, and development projects.', 'Full-Time', 87000.00, '2025-04-01', 0),
(1090, 'Radiologic Technologist', 302, 'A certified Radiologic Technologist is needed to perform diagnostic imaging procedures (X-rays, CT scans).', 'Temp-to-Hire', 41.50, '2025-08-29', 1),
(1091, 'Systems Administrator', 190, 'Hiring a Systems Administrator to manage our on-premise servers and network services. Windows Server experience required.', 'Full-Time', 93000.00, '2025-09-11', 1),
(1092, 'Management Consultant', 283, 'Our consulting firm is looking for a Management Consultant to advise clients on business strategy and performance improvement.', 'Full-Time', 130000.00, '2025-06-16', 0),
(1093, 'Geologist', 361, 'An experienced Geologist is needed for an energy company to analyze geological data and identify potential drilling sites.', 'Full-Time', 105000.00, '2025-03-10', 0),
(1094, 'Instructional Designer', 122, 'Seeking an Instructional Designer to create engaging e-learning courses and training materials.', 'Contract', 53.40, '2025-09-22', 1),
(1095, 'Firmware Engineer', 212, 'A Firmware Engineer is needed to develop and test firmware for our embedded systems products.', 'Full-Time', 122000.00, '2025-08-06', 0),
(1096, 'Insurance Underwriter', 395, 'An Insurance Underwriter is needed to evaluate insurance applications and determine policy terms and premiums.', 'Full-Time', 81000.00, '2025-01-22', 0),
(1097, 'CAD Drafter', 174, 'Skilled CAD Drafter needed to create detailed technical drawings for engineering and construction projects.', 'Temp-to-Hire', 34.00, '2025-09-04', 1),
(1098, 'IT Auditor', 251, 'Hiring an IT Auditor to assess the security and efficiency of our technology systems and processes.', 'Full-Time', 99000.00, '2025-07-01', 1),
(1099, 'Speech-Language Pathologist', 335, 'A licensed Speech-Language Pathologist is needed to work with children in a school setting.', 'Contract', 51.75, '2025-08-18', 1),
(1100, 'Brand Manager', 150, 'Experienced Brand Manager wanted to develop and execute marketing strategies to build brand awareness and equity.', 'Full-Time', 118000.00, '2025-09-19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PLACEMENTS`
--

CREATE TABLE `PLACEMENTS` (
  `PlacementID` bigint(20) NOT NULL,
  `JobID` bigint(20) NOT NULL,
  `CandidateID` int(11) NOT NULL,
  `HR_ID` bigint(20) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `FinalPayRate` decimal(10,2) NOT NULL,
  `HireDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PLACEMENTS`
--

INSERT INTO `PLACEMENTS` (`PlacementID`, `JobID`, `CandidateID`, `HR_ID`, `StartDate`, `EndDate`, `FinalPayRate`, `HireDate`) VALUES
(3001, 1005, 2005, 591, '2025-05-09', '2027-05-09', 85250.00, '2025-05-09'),
(3002, 1010, 2015, 621, '2025-02-02', '2027-02-02', 73875.00, '2025-02-02'),
(3003, 1016, 2025, 555, '2025-01-11', '2027-01-11', 131840.00, '2025-01-11'),
(3004, 1019, 2035, 611, '2025-07-16', '2025-10-16', 30.45, '2025-07-16'),
(3005, 1024, 2045, 544, '2025-03-31', '2026-03-31', 38.90, '2025-03-31'),
(3006, 1029, 2055, 675, '2024-12-18', '2026-12-18', 76830.00, '2024-12-18'),
(3007, 1032, 2065, 692, '2025-03-17', '2027-03-17', 90790.00, '2025-03-17'),
(3008, 1035, 2075, 655, '2025-02-24', '2027-02-24', 97510.00, '2025-02-24'),
(3009, 1038, 2085, 518, '2025-05-20', '2027-05-20', 97720.00, '2025-05-20'),
(3010, 1044, 2095, 525, '2025-04-14', '2027-04-14', 100980.00, '2025-04-14'),
(3011, 1049, 2105, 649, '2024-11-25', '2026-11-25', 69680.00, '2024-11-25'),
(3012, 1053, 2115, 515, '2025-06-25', '2027-06-25', 99840.00, '2025-06-25'),
(3013, 1057, 2125, 509, '2025-03-05', '2027-03-05', 82620.00, '2025-03-05'),
(3014, 1060, 2135, 556, '2025-02-05', '2027-02-05', 61360.00, '2025-02-05'),
(3015, 1063, 2145, 511, '2025-07-23', '2027-07-23', 86520.00, '2025-07-23'),
(3016, 1068, 2155, 688, '2025-04-24', '2027-04-24', 55550.00, '2025-04-24'),
(3017, 1072, 2165, 535, '2025-10-02', '2027-10-02', 70700.00, '2025-10-02'),
(3018, 1075, 2175, 538, '2025-06-29', '2027-06-29', 64890.00, '2025-06-29'),
(3019, 1081, 2185, 521, '2025-06-12', '2027-06-12', 68640.00, '2025-06-12'),
(3020, 1086, 2195, 631, '2025-03-23', '2027-03-23', 78540.00, '2025-03-23'),
(3021, 1089, 2205, 590, '2025-04-28', '2027-04-28', 85260.00, '2025-04-28'),
(3022, 1093, 2215, 507, '2025-04-03', '2027-04-03', 109200.00, '2025-04-03'),
(3023, 1096, 2225, 561, '2025-02-17', '2027-02-17', 82620.00, '2025-02-17'),
(3024, 1020, 2235, 666, '2025-06-04', '2027-06-04', 93100.00, '2025-06-04'),
(3025, 1031, 2245, 577, '2025-09-15', '2027-09-15', 126250.00, '2025-09-15'),
(3026, 1043, 2255, 619, '2025-07-03', '2027-07-03', 139050.00, '2025-07-03'),
(3027, 1056, 2265, 540, '2025-08-05', '2027-08-05', 118450.00, '2025-08-05'),
(3028, 1067, 2275, 615, '2025-10-05', '2027-10-05', 83200.00, '2025-10-05'),
(3029, 1077, 2285, 692, '2025-08-19', '2027-08-19', 118800.00, '2025-08-19'),
(3030, 1087, 2295, 694, '2025-09-08', '2027-09-08', 84460.00, '2025-09-08'),
(3031, 1092, 2305, 626, '2025-07-14', '2027-07-14', 128700.00, '2025-07-14'),
(3032, 1012, 2315, 660, '2025-08-21', '2027-08-21', 67320.00, '2025-08-21'),
(3033, 1022, 2325, 588, '2025-10-25', '2026-01-25', 45.34, '2025-10-25'),
(3034, 1033, 2335, 537, '2025-08-02', '2026-02-02', 33.03, '2025-08-02'),
(3035, 1046, 2345, 581, '2025-10-06', '2027-10-06', 101940.00, '2025-10-06'),
(3036, 1058, 2355, 598, '2025-10-15', '2026-04-15', 84.65, '2025-10-15'),
(3037, 1071, 2365, 518, '2025-08-23', '2026-02-23', 45.84, '2025-08-23'),
(3038, 1079, 2375, 563, '2025-09-12', '2027-09-12', 148500.00, '2025-09-12'),
(3039, 1088, 2385, 505, '2025-10-23', '2026-07-23', 83.64, '2025-10-23'),
(3040, 1095, 2395, 535, '2025-09-01', '2027-09-01', 120780.00, '2025-09-01'),
(3041, 1002, 2001, 501, '2025-11-12', NULL, 65.12, '2025-11-05'),
(30042, 1001, 2002, 501, '2025-11-12', '2027-11-12', 65.89, '2025-11-10');

--
-- Triggers `PLACEMENTS`
--
DELIMITER $$
CREATE TRIGGER `trg_AutoCloseFilledJobs` AFTER INSERT ON `PLACEMENTS` FOR EACH ROW BEGIN
    DECLARE placement_count INT;
    DECLARE job_type VARCHAR(50);
    
    -- Get job type and count placements
    SELECT JobType INTO job_type
    FROM JOBS WHERE JobID = NEW.JobID;
    
    SELECT COUNT(*) INTO placement_count
    FROM PLACEMENTS WHERE JobID = NEW.JobID;
    
    -- Auto-close job based on type and placement count
    IF (job_type IN ('Full-Time', 'Part-Time') AND placement_count >= 1) OR
       (job_type IN ('Contract', 'Temporary') AND placement_count >= 3) THEN
        UPDATE JOBS
        SET IsOpen = 0
        WHERE JobID = NEW.JobID;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Skills`
--

CREATE TABLE `Skills` (
  `SkillID` bigint(20) NOT NULL,
  `SkillName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Skills`
--

INSERT INTO `Skills` (`SkillID`, `SkillName`) VALUES
(31, 'Accounting'),
(47, 'Adobe Illustrator'),
(46, 'Adobe Photoshop'),
(26, 'Agile Methodologies'),
(12, 'Amazon Web Services (AWS)'),
(10, 'Angular'),
(34, 'Auditing'),
(32, 'Bookkeeping'),
(28, 'Business Analysis'),
(6, 'C#'),
(5, 'C++'),
(56, 'Communication'),
(40, 'Content Creation'),
(8, 'CSS'),
(36, 'Customer Service'),
(20, 'Cybersecurity'),
(21, 'Data Analysis'),
(37, 'Digital Marketing'),
(15, 'Docker'),
(50, 'Electronic Health Records (EHR)'),
(43, 'Employee Relations'),
(30, 'Financial Analysis'),
(14, 'Google Cloud Platform (GCP)'),
(45, 'Graphic Design'),
(51, 'HIPAA Compliance'),
(7, 'HTML'),
(41, 'Human Resources (HR)'),
(17, 'IT Support'),
(2, 'Java'),
(3, 'JavaScript'),
(16, 'Kubernetes'),
(59, 'Leadership'),
(54, 'Logistics Coordination'),
(22, 'Machine Learning'),
(52, 'Medical Billing'),
(13, 'Microsoft Azure'),
(18, 'Network Administration'),
(11, 'Node.js'),
(49, 'Patient Care'),
(24, 'Power BI'),
(58, 'Problem Solving'),
(25, 'Project Management'),
(1, 'Python'),
(55, 'Quality Assurance (QA)'),
(33, 'QuickBooks'),
(9, 'React'),
(42, 'Recruiting'),
(29, 'Requirements Gathering'),
(35, 'Sales'),
(27, 'Scrum'),
(38, 'SEO/SEM'),
(39, 'Social Media Marketing'),
(4, 'SQL'),
(53, 'Supply Chain Management'),
(19, 'System Administration'),
(23, 'Tableau'),
(57, 'Teamwork'),
(60, 'Time Management'),
(44, 'UI/UX Design'),
(48, 'Video Editing');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_activejobapplications`
-- (See below for the actual view)
--
CREATE TABLE `vw_activejobapplications` (
`CandidateID` int(11)
,`CandidateName` varchar(101)
,`CandidateEmail` varchar(100)
,`JobTitle` varchar(100)
,`CompanyName` varchar(50)
,`ApplicationStatus` varchar(50)
,`ApplyDate` date
,`HRManager` varchar(101)
,`PayRate` decimal(10,2)
,`JobType` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_candidateplacementhistory`
-- (See below for the actual view)
--
CREATE TABLE `vw_candidateplacementhistory` (
`CandidateID` int(11)
,`CandidateName` varchar(101)
,`Email` varchar(100)
,`JobTitle` varchar(100)
,`CompanyName` varchar(50)
,`StartDate` date
,`EndDate` date
,`FinalPayRate` decimal(10,2)
,`PlacementStatus` varchar(13)
,`DaysEmployed` int(7)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_technologyclients`
-- (See below for the actual view)
--
CREATE TABLE `vw_technologyclients` (
`ClientID` bigint(20)
,`CompanyName` varchar(50)
,`ContactPerson` varchar(50)
,`ContactEmail` varchar(100)
,`ContactPhone` char(15)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_activejobapplications`
--
DROP TABLE IF EXISTS `vw_activejobapplications`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `umang_staffing_db`.`vw_activejobapplications`  AS SELECT `c`.`CandidateID` AS `CandidateID`, concat(`c`.`FirstName`,' ',`c`.`LastName`) AS `CandidateName`, `c`.`Email` AS `CandidateEmail`, `j`.`JobTitle` AS `JobTitle`, `cl`.`CompanyName` AS `CompanyName`, `ec`.`ApplicationStatus` AS `ApplicationStatus`, `ec`.`ApplyDate` AS `ApplyDate`, concat(`h`.`FirstName`,' ',`h`.`LastName`) AS `HRManager`, `j`.`PayRate` AS `PayRate`, `j`.`JobType` AS `JobType` FROM ((((`umang_staffing_db`.`eligible_candidates` `ec` join `umang_staffing_db`.`candidates` `c` on(`ec`.`CandidateID` = `c`.`CandidateID`)) join `umang_staffing_db`.`jobs` `j` on(`ec`.`JOBID` = `j`.`JobID`)) join `umang_staffing_db`.`clients` `cl` on(`j`.`ClientID` = `cl`.`ClientID`)) join `umang_staffing_db`.`hr` `h` on(`ec`.`HR_ID` = `h`.`HR_ID`)) WHERE `j`.`IsOpen` = 1 ORDER BY `ec`.`ApplyDate` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `vw_candidateplacementhistory`
--
DROP TABLE IF EXISTS `vw_candidateplacementhistory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `umang_staffing_db`.`vw_candidateplacementhistory`  AS SELECT `c`.`CandidateID` AS `CandidateID`, concat(`c`.`FirstName`,' ',`c`.`LastName`) AS `CandidateName`, `c`.`Email` AS `Email`, `j`.`JobTitle` AS `JobTitle`, `cl`.`CompanyName` AS `CompanyName`, `p`.`StartDate` AS `StartDate`, `p`.`EndDate` AS `EndDate`, `p`.`FinalPayRate` AS `FinalPayRate`, CASE WHEN `p`.`EndDate` is null AND `p`.`StartDate` <= curdate() THEN 'Active' WHEN `p`.`EndDate` is null AND `p`.`StartDate` > curdate() THEN 'Pending Start' WHEN `p`.`EndDate` < curdate() THEN 'Completed' ELSE 'Unknown' END AS `PlacementStatus`, to_days(ifnull(`p`.`EndDate`,curdate())) - to_days(`p`.`StartDate`) AS `DaysEmployed` FROM (((`umang_staffing_db`.`candidates` `c` join `umang_staffing_db`.`placements` `p` on(`c`.`CandidateID` = `p`.`CandidateID`)) join `umang_staffing_db`.`jobs` `j` on(`p`.`JobID` = `j`.`JobID`)) join `umang_staffing_db`.`clients` `cl` on(`j`.`ClientID` = `cl`.`ClientID`)) ORDER BY `c`.`CandidateID` ASC, `p`.`StartDate` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `vw_technologyclients`
--
DROP TABLE IF EXISTS `vw_technologyclients`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `umang_staffing_db`.`vw_technologyclients`  AS SELECT `umang_staffing_db`.`clients`.`ClientID` AS `ClientID`, `umang_staffing_db`.`clients`.`CompanyName` AS `CompanyName`, `umang_staffing_db`.`clients`.`ContactPerson` AS `ContactPerson`, `umang_staffing_db`.`clients`.`ContactEmail` AS `ContactEmail`, `umang_staffing_db`.`clients`.`ContactPhone` AS `ContactPhone` FROM `umang_staffing_db`.`clients` WHERE `umang_staffing_db`.`clients`.`Industry` = 'Technology' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Candidates`
--
ALTER TABLE `Candidates`
  ADD PRIMARY KEY (`CandidateID`),
  ADD UNIQUE KEY `uq_Candidates_Email` (`Email`),
  ADD UNIQUE KEY `uq_Candidates_ResumeURL` (`ResumeURL`),
  ADD KEY `idx_Candidates_StateCity` (`State`,`City`);

--
-- Indexes for table `CANDIDATE_SKILLS`
--
ALTER TABLE `CANDIDATE_SKILLS`
  ADD PRIMARY KEY (`CandidateID`,`SkillID`),
  ADD KEY `CSSkillFK` (`SkillID`);

--
-- Indexes for table `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`ClientID`),
  ADD UNIQUE KEY `uq_clients_company_email` (`CompanyName`,`ContactEmail`);

--
-- Indexes for table `ELIGIBLE_CANDIDATES`
--
ALTER TABLE `ELIGIBLE_CANDIDATES`
  ADD PRIMARY KEY (`CandidateID`,`JOBID`),
  ADD KEY `JOBID` (`JOBID`),
  ADD KEY `HR_ID` (`HR_ID`);

--
-- Indexes for table `HR`
--
ALTER TABLE `HR`
  ADD PRIMARY KEY (`HR_ID`),
  ADD KEY `HRClientFK` (`ClientID`);

--
-- Indexes for table `JOBS`
--
ALTER TABLE `JOBS`
  ADD PRIMARY KEY (`JobID`),
  ADD KEY `JobsClientFK` (`ClientID`);

--
-- Indexes for table `PLACEMENTS`
--
ALTER TABLE `PLACEMENTS`
  ADD PRIMARY KEY (`PlacementID`),
  ADD KEY `PlacementJobFK` (`JobID`),
  ADD KEY `PlacementCandidateFK` (`CandidateID`),
  ADD KEY `PlacementHRFK` (`HR_ID`);

--
-- Indexes for table `Skills`
--
ALTER TABLE `Skills`
  ADD PRIMARY KEY (`SkillID`),
  ADD UNIQUE KEY `SkillName` (`SkillName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Clients`
--
ALTER TABLE `Clients`
  MODIFY `ClientID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT for table `HR`
--
ALTER TABLE `HR`
  MODIFY `HR_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=701;

--
-- AUTO_INCREMENT for table `PLACEMENTS`
--
ALTER TABLE `PLACEMENTS`
  MODIFY `PlacementID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30043;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CANDIDATE_SKILLS`
--
ALTER TABLE `CANDIDATE_SKILLS`
  ADD CONSTRAINT `CSCandidateFK` FOREIGN KEY (`CandidateID`) REFERENCES `Candidates` (`CandidateID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CSSkillFK` FOREIGN KEY (`SkillID`) REFERENCES `Skills` (`SkillID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ELIGIBLE_CANDIDATES`
--
ALTER TABLE `ELIGIBLE_CANDIDATES`
  ADD CONSTRAINT `eligible_candidates_ibfk_1` FOREIGN KEY (`CandidateID`) REFERENCES `Candidates` (`CandidateID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eligible_candidates_ibfk_2` FOREIGN KEY (`JOBID`) REFERENCES `JOBS` (`JobID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eligible_candidates_ibfk_3` FOREIGN KEY (`HR_ID`) REFERENCES `HR` (`HR_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `HR`
--
ALTER TABLE `HR`
  ADD CONSTRAINT `HRClientFK` FOREIGN KEY (`ClientID`) REFERENCES `CLIENTS` (`ClientID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `JOBS`
--
ALTER TABLE `JOBS`
  ADD CONSTRAINT `JobsClientFK` FOREIGN KEY (`ClientID`) REFERENCES `CLIENTS` (`ClientID`) ON UPDATE CASCADE;

--
-- Constraints for table `PLACEMENTS`
--
ALTER TABLE `PLACEMENTS`
  ADD CONSTRAINT `PlacementCandidateFK` FOREIGN KEY (`CandidateID`) REFERENCES `CANDIDATES` (`CandidateID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `PlacementHRFK` FOREIGN KEY (`HR_ID`) REFERENCES `HR` (`HR_ID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `PlacementJobFK` FOREIGN KEY (`JobID`) REFERENCES `JOBS` (`JobID`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
