-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2024 at 02:05 PM
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
-- Database: `carservice`
--

-- --------------------------------------------------------

--
-- Table structure for table `bike_services`
--

CREATE TABLE `bike_services` (
  `id` int(11) NOT NULL,
  `type_of_service` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`details`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bike_services`
--

INSERT INTO `bike_services` (`id`, `type_of_service`, `name`, `price`, `img_path`, `details`, `description`) VALUES
(1, 'regular', 'Regular Service', 4000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Engine oil  and oil filter changing\", \"Engine maintenance check\", \"Break check and air check\", \"Complete car cleaning\"]'),
(2, 'express', 'Express Service', 6000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Engine oil  and oil filter changing\", \"Engine maintenance check\", \"Break check and air check\", \"Complete car cleaning\", \"Fast Service\"]'),
(3, 'mileage', 'Mileage Service', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"ECG inspection\", \"Clutch Assessment\", \"Injector Inspection\", \"Cleaning catalytic converter\"]'),
(4, 'rust', 'RUST COATING', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cost changes based on the dent\",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\",\r\n\"High quality paints are used\"]'),
(5, 'exterior', 'EXTERIOR CLEANING', 4000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Best cleaning with virus protection \",\r\n\"Get back your classic look\",\r\n\"AC vent cleaning\",\r\n\"Stain ramoval\"]'),
(6, 'painting', 'POLISHIN & PAINTING ', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cost changes based on the dent\",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\",\r\n\"High quality paints are used\"]'),
(7, 'dent', 'DENT SERVICE', 1000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cast changes based on the dent \",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\"]');

-- --------------------------------------------------------

--
-- Table structure for table `bike_shopping`
--

CREATE TABLE `bike_shopping` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `type_of_shopping` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `specifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`specifications`)),
  `part_number` varchar(255) DEFAULT NULL,
  `numberOfItems` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bike_shopping`
--

INSERT INTO `bike_shopping` (`id`, `type`, `type_of_shopping`, `name`, `price`, `img_path`, `product_details`, `specifications`, `part_number`, `numberOfItems`) VALUES
(1, 'abs', 'ABS', 'Swift break pads', 2000, 'https://picsum.photos/200', 'Being a prominent firm, we are engaged in offering a distinguished assortment of Brake Cables.We have a complete range of Car Brake Cables.', '{\"VehicleType\": \"Bike\", \"Color\": \"Black\", \"PackagingType\": \"Box\", \"OuterMaterial\": \"Rubber\", \"InnerMaterial\": \"Aluminium\", \"VehicleBrand\": \"Hyundai\"}', NULL, 1),
(2, 'body', 'BODY ACCESSORIES', 'Front & Mudguard', 3000, 'https://picsum.photos/200', 'FRONT FAIRING AND MUDGUARD KARIZMA R ZADON\r\n\r\nThis COMBO BODY PARTS is suitable for : HERO HONDA KARIZMA,HERO HONDA KARIZMA R,HERO HONDA KARIZMA R NM', '{\r\n  \"BoxPackWeight\": {\r\n    \"approx\": \"1000.00 Grams\"\r\n  },\r\n  \"BoxPackVolume\": {\r\n    \"approx\": \"4000 CC\",\r\n    \"volumetricWeightApplied\": \"0.80 Kg\"\r\n  },\r\n  \"ShippingCharge\": {\r\n    \"amount\": \"Rs.400.00\",\r\n    \"minFor\": \"Minimum for\"\r\n  }\r\n}\r\n', NULL, 1),
(3, 'battery', 'BATTERY', 'Amaron', 3000, 'https://picsum.photos/200', 'AMARON HI LIFE FLO 36B20L 36 ah BATTERY FOR PETROL bike\r\n\r\nMaintenance free<br>\r\nFactory charged and ready to fit<br>\r\nHigh cranking power<br>\r\n55 months warranty<br>\r\nCompatible With Vehicle Type: Passenger bike', '{\r\n  \"Brand\": \"Amaron\",\r\n  \"VehicleServiceType\": \"Bike\",\r\n  \"Voltage\": \"12 Volts\"\r\n}\r\n', NULL, 1),
(4, 'oil', 'OIL', 'Total Engineer', 3000, 'https://picsum.photos/200', '\r\n\r\nTOTALENERGIES - 5W40 Engine Oil - Quartz 9000 Energy - ACEA A3/B4, API SN/CF - Age-Resistance Technology - Ultimate Protection - Advanced Synthetic Motor Oil Lubricant - 3.5L\r\n\r\nULTIMATE POWER & PERFORMANCE: Formulated with carefully selected premium fully synthetic engile oil, the Quartz 9000 5W40 engine oil ensures excellent start ups even in extremely cold weather conditions.\r\nBEST IN CLASS CLEANLINESS: The state of the art molecular structure of this Total Quartz 9000 provides outstanding engine longevity by ensuring utmost engine cleanliness, thanks to its advance detergent and excellent', NULL, NULL, NULL),
(5, 'tire', 'TIRE', 'Alpha H1', 6500, 'https://picsum.photos/200', '\r\nALPHA H1\r\n\r\nZero Degree steel belt\r\nArrests dynamic growth\r\n Excellent high-speed stability via minimal       structural deformation.\r\n\r\nPremium compound with a smart blend os Silica and Carbn Black\r\nExtreme chemical grip on wet and dry surfaces.\r\nOptimum tread mileage\r\n\r\ndual Radii cavity profile.\r\nQuick to achieve lean angles.\r\nOutstanding sport handling', NULL, NULL, 1),
(6, 'light', 'LIGHT', 'Pivalon', 8250, 'https://picsum.photos/200', 'Pivalo 12V-85V Energy-saving LED Motorcycle Headlight Headlamp Motorbike Motorcycle Head light Lamp with 12 White Light LED (Silver) Bike Headlight Mount\r\n\r\nPivalo LED Head Light/Lamp is the best upgrade you can have for your two wheeler or four wheeler. A universal fitment for Bikes And Cars with a cooling mechanism, the offered white light LED is appreciated for its extended brightness or heat-dissipating design. This is a highly used product by bike enthusiasts, driver lovers and biker boys who love to ride or drive around the areas. It offers a unique visibility experience by illuminating the pathway ahead. Specification: LED Power: 24W (12 x 2 W High Intensity LED) Beam Pattern: Flood Beam Input Voltage: 12V-85V DC (fits 12V, 24V', NULL, NULL, NULL),
(7, 'gear', 'GEAR & CLUTCH', 'Clutch set', 8250, 'https://picsum.photos/200', 'Clutch Set (Clutch + Pressure Plate) Hyundai Santro/ i10 O/M/ I10 Magna (Valeo)', '{\r\n  \"Manufacturer\": \"Valeo\",\r\n  \"Brand\": \"Valeo\",\r\n  \"PackageDimensions\": \"26.01 x 24 x 5.99 cm; 3.04kg\",\r\n  \"ItemModelNumber\": \"404514\",\r\n  \"Weight\": \"3 kg 40g\"\r\n}\r\n', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_no` bigint(20) NOT NULL,
  `location` text NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `car_services`
--

CREATE TABLE `car_services` (
  `id` int(11) NOT NULL,
  `type_of_service` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`details`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_services`
--

INSERT INTO `car_services` (`id`, `type_of_service`, `name`, `price`, `img_path`, `details`, `description`) VALUES
(1, 'regular', 'Regular Service', 4000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Engine oil  and oil filter changing\", \"Engine maintenance check\", \"Break check and air check\", \"Complete car cleaning\"]'),
(2, 'express', 'Express Service', 6000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Engine oil  and oil filter changing\", \"Engine maintenance check\", \"Break check and air check\", \"Complete car cleaning\", \"Fast Service\"]'),
(3, 'ac', 'AC Service', 6000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Restoring efficiency\", \"AC colling check\", \"AC gas refilling\", \"Complete ac  car cleaning\"]'),
(4, 'mileage', 'Mileage Service', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"ECG inspection\", \"Clutch Assessment\", \"Injector Inspection\", \"Cleaning catalytic converter\"]'),
(5, 'rust', 'RUST COATING', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cost changes based on the dent\",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\",\r\n\"High quality paints are used\"]'),
(6, 'interior', 'INTERIOR CLEANING', 4000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Best cleaning with virus protection \",\r\n\"Get back your classic look\",\r\n\"AC vent cleaning\",\r\n\"Stain ramoval\"]'),
(7, 'painting', 'POLISHIN & PAINTING ', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cost changes based on the dent\",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\",\r\n\"High quality paints are used\"]'),
(8, 'dent', 'DENT SERVICE', 1000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cast changes based on the dent \",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\"]'),
(9, 'regular', 'Regular Service', 4000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Engine oil  and oil filter changing\", \"Engine maintenance check\", \"Break check and air check\", \"Complete car cleaning\"]'),
(10, 'express', 'Express Service', 6000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Engine oil  and oil filter changing\", \"Engine maintenance check\", \"Break check and air check\", \"Complete car cleaning\", \"Fast Service\"]'),
(11, 'ac', 'AC Service', 6000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Restoring efficiency\", \"AC colling check\", \"AC gas refilling\", \"Complete ac  car cleaning\"]'),
(12, 'mileage', 'Mileage Service', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"ECG inspection\", \"Clutch Assessment\", \"Injector Inspection\", \"Cleaning catalytic converter\"]'),
(13, 'rust', 'RUST COATING', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cost changes based on the dent\",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\",\r\n\"High quality paints are used\"]'),
(14, 'interior', 'INTERIOR CLEANING', 4000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Best cleaning with virus protection \",\r\n\"Get back your classic look\",\r\n\"AC vent cleaning\",\r\n\"Stain ramoval\"]'),
(15, 'painting', 'POLISHIN & PAINTING ', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cost changes based on the dent\",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\",\r\n\"High quality paints are used\"]'),
(16, 'dent', 'DENT SERVICE', 1000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cast changes based on the dent \",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\"]'),
(17, 'regular', 'Regular Service', 4000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Engine oil  and oil filter changing\", \"Engine maintenance check\", \"Break check and air check\", \"Complete car cleaning\"]'),
(18, 'express', 'Express Service', 6000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Engine oil  and oil filter changing\", \"Engine maintenance check\", \"Break check and air check\", \"Complete car cleaning\", \"Fast Service\"]'),
(19, 'ac', 'AC Service', 6000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Restoring efficiency\", \"AC colling check\", \"AC gas refilling\", \"Complete ac  car cleaning\"]'),
(20, 'mileage', 'Mileage Service', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"ECG inspection\", \"Clutch Assessment\", \"Injector Inspection\", \"Cleaning catalytic converter\"]'),
(21, 'rust', 'RUST COATING', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cost changes based on the dent\",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\",\r\n\"High quality paints are used\"]'),
(22, 'interior', 'INTERIOR CLEANING', 4000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Best cleaning with virus protection \",\r\n\"Get back your classic look\",\r\n\"AC vent cleaning\",\r\n\"Stain ramoval\"]'),
(23, 'painting', 'POLISHIN & PAINTING ', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cost changes based on the dent\",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\",\r\n\"High quality paints are used\"]'),
(24, 'dent', 'DENT SERVICE', 1000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cast changes based on the dent \",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\"]'),
(25, 'regular', 'Regular Service', 4000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Engine oil  and oil filter changing\", \"Engine maintenance check\", \"Break check and air check\", \"Complete car cleaning\"]'),
(26, 'express', 'Express Service', 6000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Engine oil  and oil filter changing\", \"Engine maintenance check\", \"Break check and air check\", \"Complete car cleaning\", \"Fast Service\"]'),
(27, 'ac', 'AC Service', 6000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Restoring efficiency\", \"AC colling check\", \"AC gas refilling\", \"Complete ac  car cleaning\"]'),
(28, 'mileage', 'Mileage Service', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"ECG inspection\", \"Clutch Assessment\", \"Injector Inspection\", \"Cleaning catalytic converter\"]'),
(29, 'rust', 'RUST COATING', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cost changes based on the dent\",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\",\r\n\"High quality paints are used\"]'),
(30, 'interior', 'INTERIOR CLEANING', 4000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Best cleaning with virus protection \",\r\n\"Get back your classic look\",\r\n\"AC vent cleaning\",\r\n\"Stain ramoval\"]'),
(31, 'painting', 'POLISHIN & PAINTING ', 3000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cost changes based on the dent\",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\",\r\n\"High quality paints are used\"]'),
(32, 'dent', 'DENT SERVICE', 1000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cast changes based on the dent \",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\"]'),
(33, 'dent', 'DENT SERVICE', 1000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cast changes based on the dent \",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\"]'),
(34, 'dent', 'DENT SERVICE', 1000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cast changes based on the dent \",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\"]');

-- --------------------------------------------------------

--
-- Table structure for table `car_shopping`
--

CREATE TABLE `car_shopping` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `type_of_shopping` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `specifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`specifications`)),
  `part_number` varchar(255) DEFAULT NULL,
  `numberOfItems` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_shopping`
--

INSERT INTO `car_shopping` (`id`, `type`, `type_of_shopping`, `name`, `price`, `img_path`, `product_details`, `specifications`, `part_number`, `numberOfItems`) VALUES
(1, 'bodyaccessory', 'BODY ACCESSORIES', 'Car duster', 700, 'https://picsum.photos/200', 'Super soft microfiber car Duster exterior with Extendable Handle ,car brush Duster for car cleaning duster with strong stainless steel and also provided with warrenty.', '[\"Door delivery\", \"1 week warenty\", \"Return available in 1 week\", \"No delivery charge\"]', NULL, NULL),
(2, 'bodyaccessory', 'BODY ACCESSORIES', 'Scent Soap', 300, 'https://picsum.photos/200', 'Super good fragrance scent soap aat low cost and long standard and fast spreadable available in multiple fragrance.', '[\"Door delivery\", \"1 week warenty\", \"Return available in 1 week\", \"No delivery charge\", \"Cash on elivery\"]', NULL, NULL),
(3, 'suspension', 'SUSPENSION', 'Glow plug', 700, 'https://picsum.photos/200', 'For trouble-free driving experience of your Maruti Suzuki vehicle always use Maruti Suzuki Genuine Parts', '{\"Height\": \"1 cm\", \"Weight\": \"60 grams\", \"Width\": \"1 cm\", \"Length\": \"12 cm\"}', '18550M86J00', 1),
(4, 'suspension', 'SUSPENSION', 'Radiator', 700, 'https://picsum.photos/200', 'When you buy Radiator / Intercooler Assembly & its components of Maruti Suzuki you get the MSGP Advanatge of Reliability & Efficiency', '{\"Height\": \"13 cm\", \"Weight\": \"4800 grams\", \"Width\": \"56 cm\", \"Length\": \"59 cm\"}', '17700M74L50', 1),
(5, 'abs', 'ABS', 'Break pads', 2500, 'https://picsum.photos/200', 'We are specialised in spares & lubrication of all the vehicles.maruti suzuki to all new generation vehicles.dealing in filters, clutches, suspensions, brakes, lubrications, body parts, ac parts, electrical parts and many more', '{\"Material\": \"CeramicPart\", \"Number\": \"55180 M 60M00\", \"Ideal For\": \"All vehicle\", \"Usage/Application\": \"Brake System\", \"Brand\": \"Original\", \"Packaging Type\": \"Box\", \"Warranty\": \"1 year warranty\", \"Shape\": \"RECTANGLE\"}', NULL, 1),
(6, 'abs', 'ABS', 'Swift break pads', 4000, 'https://picsum.photos/200', 'We are specialised in spares & lubrication of all the vehicles.maruti suzuki to all new generation vehicles.dealing in filters, clutches, suspensions, brakes, lubrications, body parts, ac parts, electrical parts and many more', '{\"Material\": \"CeramicPart\", \"Number\": \"55180 M 60M00\", \"Ideal For\": \"All vehicle\", \"Usage/Application\": \"Brake System\", \"Brand\": \"Original\", \"Packaging Type\": \"Box\", \"Warranty\": \"1 year warranty\", \"Shape\": \"RECTANGLE\"}', NULL, 1),
(7, 'gear-and-clutch', 'GEAR & CLUTCH', 'Clutch set', 8250, 'https://picsum.photos/200', 'Clutch Set (Clutch + Pressure Plate) Hyundai Santro/ i10 O/M/ I10 Magna (Valeo)', '{\"Manufacturer\": \"Valeo\",\"Brand\": \"Valeo\",\"PackageDimensions\": \"26.01 x 24 x 5.99 cm; 3.04kg\",\"ItemModelNumber\": \"404514\",\"Weight\": \"3 kg 40 g\"}', NULL, 1),
(8, 'gear-and-clutch', 'GEAR & CLUTCH', 'Volvo Clutch', 4000, 'https://picsum.photos/200', 'Vehicle Compatibility: Tata Zest, Bolt 100 percent asbestos free. OE quality and design to ensure easy fitment and smooth engagement and disengagement of gears. Unique dampers design for reduced noise, vibration and harshness. Reliable: Valeo friction gives 3 times higher durability compared to standard friction', '{\"Manufacturer\": \"Valeo\", \"Brand\": \"Valeo\", \"ProductDimensions\": \"26.5 x 26 x 6.5 cm; 2.9 kg\", \"PartNumber\": \"843631\", \"ManufacturerPart\": \"843631\", \"ManufacturerItem\": \"ValeoItem\", \"Weight\": \"2 kg 900 g\"}', NULL, 1),
(9, 'battery', 'BATTERY', 'Amaron', 3000, 'https://picsum.photos/200', 'AMARON HI LIFE FLO 36B20L 36 ah BATTERY FOR PETROL CARS\r\n\r\nMaintenance free<br>\r\nFactory charged and ready to fit<br>\r\nHigh cranking power<br>\r\n55 months warranty<br>\r\nCompatible With Vehicle Type: Passenger Car', '{\r\n  \"Brand\": \"Amaron\",\r\n  \"VehicleServiceType\": \"Passenger Car\",\r\n  \"Voltage\": \"12 Volts\"\r\n}', NULL, 1),
(10, 'battery', 'BATTERY', 'Exide', 2500, 'https://picsum.photos/200', 'Exide Battery (Red, 12xL9B) 12 Volt\r\n\r\n48 MONTHS WARRANTY SEALED MF BATTERIES<br><br>\r\nThis product comes in a proper packaging<br><br>\r\nIt ensures an easy maintenance<br><br>\r\n\r\nEXIDE BATTERIES OR BEST RECOMMENDED ITEM FOR AUTOMOBILE INDUSTRIES AND 48 MONTHS WARRANTY WE CAN EXCHANGE OR COMPLAINT REGISTER EASY REPLACEMENT ALL OVER INDIA JUST ONE CAL CUSTOMER-CARE PICKUP', NULL, NULL, 1),
(11, 'oil', 'OIL', 'Total Engineer', 3000, 'https://picsum.photos/200', 'TOTALENERGIES - 5W40 Engine Oil - Quartz 9000 Energy - ACEA A3/B4, API SN/CF - Age-Resistance Technology - Ultimate Protection - Advanced Synthetic Motor Oil Lubricant - 3.5L\r\n\r\nULTIMATE POWER & PERFORMANCE: Formulated with carefully selected premium fully synthetic engile oil, the Quartz 9000 5W40 engine oil ensures excellent start ups even in extremely cold weather conditions.\r\nBEST IN CLASS CLEANLINESS: The state of the art molecular structure of this Total Quartz 9000 provides outstanding engine longevity by ensuring utmost engine cleanliness, thanks to its advance detergent and excellent', NULL, NULL, NULL),
(12, 'oil', 'OIL', 'Castrol 5w 3.5l', 1500, 'https://picsum.photos/200', 'Castrol MAGNATEC STOP-START 5W-30 Full Synthetic Engine Oil for Petrol, Diesel and CNG Cars 3L\r\nFull synthetic engine oil providing Non-Stop protection from every start, even for vehicles with modern stop-start technology\r\nDUALOCK Technology delivers 50% better protection from warm-up1 and stop-start2 wear\r\nUpto 60L annual fuel saving3 during busy stop-start driving, Cling to engine parts when the oil drains down\r\nSuitable for use in cars with petrol, diesel or CNG powered engines where API SN, ACEA A5/B5, A1/B1 specifications are recommended by manufacturer', NULL, NULL, NULL),
(13, 'tire', 'TIRE', 'JK tire', 3000, 'https://picsum.photos/200', 'JK Tyre 145/80 R12 Ultima Hi^Life Tubeless Car Tyre\r\n\r\nVehicle Compatability - Maruti Suzuki ALTO 800, Maruti Suzuki ZEN, Maruti Suzuki OMNI, Maruti Suzuki NEW ALTO 800, Maruti Suzuki ALTO, Hyundai EON\r\nPremium Comfort\r\nUnconditional Warranty for 2 years covering non manufacturing defects like cuts and damages\r\nFit type: Universal Fit', NULL, NULL, 1),
(14, 'tire', 'TIRE', 'Apollo tyres', 1500, 'https://picsum.photos/200', 'Apollo Alnac 4Gs 175/65 R15 84H Tubeless Car Tyre\r\n\r\nVehicle Compatibility: Honda Jazz, City, Brio / Tata Bolt / Mini Cooper Convertible, Mini 3 Door, Mini 5 Door\r\nBalanced handling on dry and wet surfaces\r\nRiding comfort and silent drive\r\nLong life with improved durability\r\nLow roling resistance', NULL, NULL, 1),
(15, 'light', 'LIGHT', 'Mercury Bar Light', 730, 'https://picsum.photos/200', 'Provides 500% Brighter Clear Road Visibility making it a Must Have Item for Night Time and Highway Travelers. Spot beam light Pattern Let you see the Road Clearly in Dark.\r\nCan be Fixed on the Roof of your Car or at the Lower Bumper Area, and easily hanged with the help of Easy mounting Clamps Provided along the Bar Light.\r\nHigh brightness: Advanced LED chips and clear PC lens, powerful and bright light beam, let you see the forward dark road clearly.\r\nIt\'s Direct Connect to minimum 12V to 32V max power from car, Red & Black wires are on the bar light for connection, while the red is for positive connection and the black is for negative connection.', NULL, NULL, NULL),
(16, 'light', 'LIGHT', 'Fog Light Bulb', 1500, 'https://picsum.photos/200', 'Carzex High Power H8/H11/H16 Car Led Fog Light Bulbs, 150W/12,000 Lumens Super Bright LED Headlight Conversion Kit for Cars 6000K Cool White, Set of 2\r\n\r\nPLUG AND PLAY DESIGN – Can be installed easily within 15 mins. Lower profile of the bulb is only 0.72 inches apply to 95% vehicles. All-in-one Plug & Play Design, No Modification Required, Fits easily into the assembly.\r\nDesign with High Power CSP LED Chips – 500% brighter than stock H8 LED Fog Light Bulbs. high focus and max light output with a wider and farther lighting area, keep safer night driving.\r\n500% brighter than Traditional Halogen', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `booking_history` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`booking_history`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `phone_number`, `booking_history`) VALUES
(2, 'yashu@gmail.com', '$2b$10$KrjMaBhdTSJh.FHuHeU6s.7/dcCUhKl8AzZWqo6IBZMBlf16K24w2', 13224, '[{\"date\":\"2024-01-18\",\"type\":\"painting\",\"vehicle\":\"bike\"}]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bike_services`
--
ALTER TABLE `bike_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_shopping`
--
ALTER TABLE `bike_shopping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `car_services`
--
ALTER TABLE `car_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_shopping`
--
ALTER TABLE `car_shopping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bike_services`
--
ALTER TABLE `bike_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bike_shopping`
--
ALTER TABLE `bike_shopping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car_services`
--
ALTER TABLE `car_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `car_shopping`
--
ALTER TABLE `car_shopping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
