-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2024 at 10:32 AM
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
(7, 'gear', 'GEAR & CLUTCH', 'Clutch set', 8250, 'https://picsum.photos/200', 'Clutch Set (Clutch + Pressure Plate) Hyundai Santro/ i10 O/M/ I10 Magna (Valeo)', '{\r\n  \"Manufacturer\": \"Valeo\",\r\n  \"Brand\": \"Valeo\",\r\n  \"PackageDimensions\": \"26.01 x 24 x 5.99 cm; 3.04kg\",\r\n  \"ItemModelNumber\": \"404514\",\r\n  \"Weight\": \"3 kg 40g\"\r\n}\r\n', NULL, 1),
(8, 'abs', 'ABS', 'pesky break', 250, 'https://picsum.photos/200', 'This Product is Bicycle Black Clutch Lever for Bicycles use in Brake and best part of this product we are provide best Quality combo pack for You in this Combo Pack High Quality Break Lever Clutch With Break Shoe this product for Ranger Cycles', '{
  "Brand": "PESKY",
  "Model Number": "Bicycle Clutch Lever + Break Shoe Combo",
  "Shade": "Black"
}
', NULL, NULL),
(9, 'abs', 'ABS', 'disk lock', 390, 'https://picsum.photos/200', 'thetrishafab Disk Lock Heavy Stainless Steel Disc Break Security _0043 Motorbike Brake Disc

Disk Lock Made from a solid cast of stainless steel, Trest Anti Theft Disc Brake Lock features a hardened locking pin that makes this device almost impossible to drill, saw, cut or hammer off. This stylish compact theft deterrent is simple and can be stored almost anywhere, even your pocket until it is needed for duty', '{
  "Brand": "thetrishafab",
  "Model Number": "Disk Lock Heavy Stainless Steel Disc Break Security _0043"
}
', NULL, NULL),
(10, 'abs', 'ABS', 'Break rotator', 1700, 'https://picsum.photos/200', 'In order to meet requirements of our clients, we are offering to our clients technically advanced range of Disc Brake Rotors in order to match their expectations and requirements. These Disc Brake Rotors are able to prevent rust and corrosion with clear looking coating protection and provide clean look for open-wheeled vehicles.', NULL, 1),
(11, 'light', 'LIGHT', 'Allextreme',308, 'https://picsum.photos/200', 'ALLEXTREME 4 Inch Osram 30W LED Fog Light Bar Waterproof IP67 12-24V High Beam Work Light for Motorcycle Car 4WD Truck SUV Jeep Flood Spot 6X5W LED Offroad Fog Driving Light (Pack of 1) Bike Headlight Mount

Power: 30W(6pcs*5W intense OSRAM LED) Working voltage: DC 9~32V Luminous Flux: approx 1800lm Beam Angle: 10 degree(spot Beam pattern) Beam Distance: approx 500M Waterproof Rate: IP67 Light color: Warm 6500K Working Temperature: -40~85 degree Celsius Dimension: approx 4* 3.5* 2.5inch Material: black Diecast Aluminum profile, PC lens Bracket: Alu Firm, 150 degree adjustable About 50,000 hrs life time Features: 4 Inch dual row high power LED ', NULL, NULL, NULL),
(12, 'light', 'LIGHT', 'Fog light',299, 'https://picsum.photos/200', '
SM FASHION Special Edition Fog Light | Waterproof 9 led | 10W LED Fog Lamp | 2pc Set (Yellow) Fog Lamp Bike Headlight Mount 1801202142 Bike Headlight Mount

Power: 30W(6pcs*5W intense OSRAM LED) Working voltage: DC 9~32V Luminous Flux: approx 1800lm Beam Angle: 10 degree(spot Beam pattern) Beam Distance: approx 500M Waterproof Rate: IP67 Light color: Warm 6500K Working Temperature: -40~85 degree Celsius Dimension: approx 4* 3.5* 2.5inch Material: black Diecast Aluminum profile, PC lens Bracket: Alu Firm, 150 degree adjustable About 50,000 hrs life time Features: 4 Inch dual row high power LED spotlight Compact size, high transmission fisheye projector lens Extreme bright even in daytime while consuming little power Ultra narrow concentrated beam allows you see far away or through the dark Pending aperture system blocks unused light for a clean beam Oversize heat sink fins for best heat elimination IP67 rated,waterproof,dustproof,shockproof,anti-corruption for harsh environment Application: Motorcycle Off road vehicle lighting,Emergency & Rescue Lighting,ATV/UTV/Golf cart lighting', NULL, NULL, NULL),
(13, 'gear', 'GEAR & CLUTCH', 'volvo clutch', 4000, 'https://picsum.photos/200', 'Vehicle Compatibility: Tata Zest, Bolt
100 percent asbestos free
OE quality and design to ensure easy fitment and smooth engagement and disengagement of gears
Unique dampers design for reduced noise, vibration and harshness
Reliable: Valeo friction gives 3 times higher durability compared to standard friction', '{
  "Manufacturer": "Valeo",
  "Brand": "Valeo",
  "Product Dimensions": "26.5 x 26 x 6.5 cm; 2.9 kg",
  "Part Number": "843631",
  "Manufacturer Part": "843631",
  "Item Weight": "2 kg 900 g"
}
', NULL, 1),
(14, 'gear', 'GEAR & CLUTCH', 'clutch wire', 1200, 'https://picsum.photos/200', '
Open Throttle Racers Hyosung GT250R/ GTR250/ Comet R Clutch Cable

Strong Inner Wire
High performance product
Easy Installation
OEM Size and Shape
Direct Fitment

Hyosung GT250R/ GTR250/ Comet R Clutch Cable. Perfect Size and Fitment. It has strong inner metal wire which is reliable and work perfectly during continuous Engagement/ Disengagemen', NULL, NULL, 1),
(15, 'gear', 'GEAR & CLUTCH', ' clutch nuts', 650, 'https://picsum.photos/200', '
4Pieces Set of Clutch Nut Spanner Tool for Bajaj Pulsar, TVS Star City, Hero Honda and Super Splendor Motorbikes. Hardened and Tempered Steel Made on CNC Machines. Very useful for Auto Repair Shops, Garrages and Workshops

Arnav 4Pieces Set Clutch Nut Spanner Repairing Tool for Bajaj Pulsar, TVS Star City/XL, Hero Honda, Super Splendor Motorbikes Made on CNC Machine Hardened and.', '
{
  "Brand": "Arnav",
  "Package Dimensions": "20 x 5 x 5 cm; 249",
  "Part Number": "OSBWT-1006",
  "Manufacturer Number": "OSB-WT-1006",
  "Item Weight": "249 g",
  "Best Sellers Rank": "#17,802"
}
', NULL, 1),
(16, 'tire', 'TIRE', 'Alpha H1', 5000, 'https://picsum.photos/200', '\r\nALPHA H1\r\n\r\nZero Degree steel belt\r\nArrests dynamic growth\r\n Excellent high-speed stability via minimal       structural deformation.\r\n\r\nPremium compound with a smart blend os Silica and Carbn Black\r\nExtreme chemical grip on wet and dry surfaces.\r\nOptimum tread mileage\r\n\r\ndual Radii cavity profile.\r\nQuick to achieve lean angles.\r\nOutstanding sport handling', NULL, NULL, 1),
(17, 'tire', 'TIRE', 'Mechline', 3000, 'https://picsum.photos/200', '
MICHELIN
CITY EXTRA IND

Extra Tyre Mileage*
The tread pattern is designed specifically for the terrain. The number, shape, depth and distribution of studs and sipes are carefully studied in relation to the terrain on which the tyre is ridden. This optimized tread design provides longer life and less wear.


Extra Robust
A newly developed rubber compound along with stronger central rib ensures improved robustness

Excellent wet grip
The MICHLEIN Water Sipe Technology delivers enhanced grip on wet roads thanks to the patented sipes that increase the tyre's water clearance capacity.', NULL, NULL, NULL),
(18, 'tire', 'TIRE', 'Mechline city pro', 4500, 'https://picsum.photos/200', '
MICHELIN
CITY EXTRA IND

Robust tyre Design for better control on all types of roads
Thanks to a robust construction, MICHELIN City Pro is less prone to damages from road hazards and punctures.
Robust shoulder for protection on bad roads.
Strong sidewall for load capacity.

Longer tyre life and excellent handling
Optimum bridging technology provides the required rigidity to the tread pattern, ensuring minimal tread shuffling and longer tyre life.
Good mileage on straight roads
Good grip on curves
Optimum bridging technology for longer tyre life
Increased grip for unmatched safety
Thanks to MICHELIN Progressive Sipe technology, full depth sipes offer consistent grip on wet roads, effective for the entire lifecycle of the tyre.patented sipes that increase the tyre's water clearance cap', NULL, NULL, NULL),
(19, 'tire', 'TIRE', 'punture kit', 700, 'https://picsum.photos/200', '
WILLIBEE 6 in 1 Universal Tubeless Tire Puncture Kit (with Storage Box) Emergency Flat Tire Repair Patch Punchure Kit Tool Bag for Car, Bike, SUV, & Motorcycle

🏍UNIVERSAL TUBELESS TIRE REPAIR KIT: WILLIBEE Universal Tubeless Tyre Repair Kit is a compact and convenient 6 in 1 set that has everything you need to repair tubeless tires on your own. With T handle Grips and Repair String Plugs, you can easily fix a flat tyre within minutes.
🏍 FULL RANGE OF ACCESSORIES: The offered kit contains Reamer, Probe, Rubber Glue, 10', NULL, NULL, NULL),
(20, 'oil', 'OIL', 'Bosch 5w 3.4l', 2500, 'https://picsum.photos/200', 'Bosch F002H23763 Fusion API SL SAE 5W 30 Semi Synthetic Engine Oil for Passenger bike (3.5 L)

Applicable for passenger bike as per OE recommendation of car engine oil grade
Semi synthetic 5w30 engine oil ideal for both petrol and diesel bike
Premium performance
Longer drain interval
Please Note
This item is non-returnabl', NULL, NULL, 1),
(21, 'oil', 'OIL', 'castrol 5w 3.5l', 1500, 'https://picsum.photos/200', 'Castrol MAGNATEC STOP-START 5W-30 Full Synthetic Engine Oil for Petrol, Diesel and CNG Cars 3L
Full synthetic engine oil providing Non-Stop protection from every start, even for vehicles with modern stop-start technology
DUALOCK Technology delivers 50% better protection from warm-up1 and stop-start2 wear
Upto 60L annual fuel saving3 during busy stop-start driving, Cling to engine parts when the oil drains down
Suitable for use in cars with petrol, diesel or CNG powered engines where API SN, ACEA A5/B5, A1/B1 specifications are recommended by manufacturer', NULL, NULL, NULL),
(22, 'oil', 'OIL', 'shelll', 2000, 'https://picsum.photos/200', 'Shell Helix HX8 5W-30 API SN Plus Fully Synthetic Engine Oil for Petrol, Diesel & CNG Cars (3.5 L), medium
Shell Helix HX8 is a Fully Synthetic motor oil which features the dynamic “Flexi-Molecule Technology” that constantly adapt to boost protection, when your engine needs it most.
Provides advanced synthetic protection in different demanding driving conditions like urban driving, highway accelerations, steep hills and cold starts
Improved fuel economy; lesser emissions & higher savings
40% better wear protection, 78% better corrosion protection & 58% more deposit ', NULL, NULL, NULL),
(23, 'battery', 'BATTERY', 'exide', 2500, 'https://picsum.photos/200', '
Exide Battery (Red, 12xL9B) 12 Volt

48 MONTHS WARRANTY SEALED MF BATTERIES
This product comes in a proper packaging
It ensures an easy maintenance

EXIDE BATTERIES OR BEST RECOMMENDED ITEM FOR AUTOMOBILE INDUSTRIES AND 48 MONTHS WARRANTY WE CAN EXCHANGE OR COMPLAINT REGISTER EASY REPLACEMENT ALL OVER INDIA JUST ONE CAL CUSTOMER-CARE PICKUP',NULL, NULL, 1),
(23, 'battery', 'BATTERY', 'Bayee battery12 v', 3000, 'https://picsum.photos/200', '

Baybee Ride-On bike Battery Only - Baybee Product Spare Parts (12 Volts) Black

Customer Care No. - 8939028239; Multipurpose Sealed Lead Acid Battery. Maintenance free and spill proof battery.
Color Name: Multicolor

SPARE ONLY FOR BABY PRODUCTS. Sealed Lead-Acid Rechargeable Battery 12V7.6AH/20HR for UPS, Toys, Solar, Emergency lights, security device, etc. Strong ABS and Sealed Maintenance Free. Sealed Construction and Leak Proof. Safety Valve Regulated System Deep Discharge Recovery. Wide Operating Temperature Range 100% Brand New Suggested charging initial 8 hours for a better life. Push-type battery terminal. Long shelf life. ',NULL, NULL, 1),
(24, 'battery', 'BATTERY', 'power zone', 45000, 'https://picsum.photos/200', '
OWERZONE PZ 9000L (90AH) bike BATTERY (4)

Capacity :90 AH
Warranty :18 Months
Vibration Resistant
Maintenance Free
POWERZONE PZ 900L (90AH) is durable range of car batteries with high heat resistance, maintenance free that makes them perfect for cars. Silver alloys (SILVEN X) that ensures low corrosion and long life. This range of batteries are Generally used for multi utility and commercial vehicles such as taxi, cabs and other private cars ',NULL, NULL, 1),
(25, 'body', 'BODY ACCESSORIES', 'eason tank', 2500, 'https://picsum.photos/200', '
superior finish&nbsp;petrol tank that fits your bike perfectly and makes your bike brand new again

Built with perfection and care to make your bike look exquisite. Note: eAuto (A) logo mark seen on images will not be printed on the delivered petrol tank

Made using high quality cold rolled coil steel sheets to ensure longer life

 - Manufactured to precision for the correct fit',NULL, NULL, 1),
(26, 'body', 'BODY ACCESSORIES', 'Visinior hero', 1500, 'https://picsum.photos/200', '
Eauto&nbsp;high impact resistant&nbsp;Visor with colorful graphics that shines bright and fits perfectly on your bike

High-Quality Impact Resistant ABS Material 
That provides high rigidity

Beautiful Aesthetics
Visor finishing with superior lacquer paint for high surface brightness and exquisite looks

Colourful Graphics
 - That are fancy, modern and fade proof

Guaranteed Fit
 - Manufactured to precision for the correct fit',NULL, NULL, NULL), 
(27, 'body', 'BODY ACCESSORIES', 'Visinior', 2000, 'https://picsum.photos/200', '
Eauto high impact resistant Visor with colorful graphics that shines bright and fits perfectly on your bike

High-Quality Impact Resistant ABS Material 
That provides high rigidity

Beautiful Aesthetics
Visor finishing with superior lacquer paint for high surface brightness and exquisite looks

Colourful Graphics
 - That are fancy, modern and fade proof

Guaranteed Fit
 - Manufactured to precision for the correct fit
',NULL, NULL, NULL), 
(28, 'body', 'BODY ACCESSORIES', 'SPLENDER SILENCER', 1500, 'https://picsum.photos/200', '
superior finish silencer (exhaust) that fits your bike perfectly and makes your bike brand new again

High-Quality Impact Resistant ABS Material 
That provides high rigidity

Beautiful Aesthetics
Visor finishing with superior lacquer paint for high surface brightness and exquisite looks

Colourful Graphics
 - That are fancy, modern and fade proof

Guaranteed Fit
 - Manufactured to precision for the correct fi
',NULL, NULL, NULL), 
(29, 'body', 'BODY ACCESSORIES', 'HONDA SILENCER', 1000, 'https://picsum.photos/200', '
superior finish silencer (exhaust) that fits your bike perfectly and makes your bike brand new again

High-Quality Impact Resistant ABS Material 
That provides high rigidity

Beautiful Aesthetics
Visor finishing with superior lacquer paint for high surface brightness and exquisite looks

Colourful Graphics
 - That are fancy, modern and fade proof

Guaranteed Fit
 - Manufactured to precision for the correct fi
',NULL, NULL, NULL), 






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
  `date` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--



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
(8, 'dent', 'DENT SERVICE', 1000, 'https://picsum.photos/200', '[\"All payments are available\", \"100% satisfaction\", \"Pick-up  & Drop at your location\", \"first time free service available\"]', '[\"Cast changes based on the dent \",\r\n\"Get back your classic look\",\r\n\"Best service\",\r\n\"With warrenty\"]');

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
(16, 'light', 'LIGHT', 'Fog Light Bulb', 1500, 'https://picsum.photos/200', 'Carzex High Power H8/H11/H16 Car Led Fog Light Bulbs, 150W/12,000 Lumens Super Bright LED Headlight Conversion Kit for Cars 6000K Cool White, Set of 2\r\n\r\nPLUG AND PLAY DESIGN – Can be installed easily within 15 mins. Lower profile of the bulb is only 0.72 inches apply to 95% vehicles. All-in-one Plug & Play Design, No Modification Required, Fits easily into the assembly.\r\nDesign with High Power CSP LED Chips – 500% brighter than stock H8 LED Fog Light Bulbs. high focus and max light output with a wider and farther lighting area, keep safer night driving.\r\n500% brighter than Traditional Halogen', NULL, NULL, NULL),
(17, 'light', 'LIGHT', 'philips light bulb', 3000, 'https://picsum.photos/200', 'PHILIPS H4 Ultinon Pro3021 LED Headlight Bulb for Car and Truck -12V / 24V, Cool white light of 6000 K (LUM11342U3021X2) Headlight Comes With 2 Unit of LED Light Cool white light of 6000 K Longer-lasting LED bulbs Compact all-in-one design', '{"Brand": "PHILIPS", "Light Source Type": "LED", "Specific Uses For": "Head Lights"}', NULL, 1),
(18, 'light', 'LIGHT', 'car led cool wite', 452, 'https://picsum.photos/200', 'C6 12V H4 Car LED Headlight Cool White (Set of 2) H4 led headlight bulbs are made of anodized aluminium body, 30 percent gf shroud, aluminium PCB, bridge lux cob, built-in turbo cooling fan, a3 fan shielded, smarter and superior performance 60 percent brighter than hid - 6000k cool white light at 7600lm/set (3800lm/each bulb) per led bulb without dark spots Upgraded waterproof and easy install - all-in-one and simple design led light bulbs, supports plug and play for smooth installation, the installation process is very quick waterproof ip67 certification', NULL,NULL),
(19, 'light', 'LIGHT', 'Marithi 800', 1700, 'https://picsum.photos/200', 'ALL PARTS SOURCE Headlights Assembly 2 Pieces Set Without Bulbs and Wire Suitable for Maruti 800 Type 3 Car Headlight Assembly Set Item Package Quantity : Set of 2 Pieces Premium Quality Lens Color : Clear Suitable for Maruti Suzuki 800 Car Type 3', '{"Brand": "ALL PARTS SOURCE", "Specific Uses For": "Head Lights", "Vehicle Service": {"Make": "Maruti Suzuki", "Model": "800", "Car Type": "Type 3", "Model Year": 2000}, "Special Feature": "High Beam", "Position": "Front Lens", "Colour": "Clear/White Lens", "Material": "Plastic"}', NULL, 1),
(20, 'tire', 'TIRE', 'Ultre miles', 3000, 'https://picsum.photos/200', 'Apollo Alnac 4Gs 175/65 R15 84H Tubeless Car Tyre Vehicle Compatibility: Honda Jazz, City, Brio / Tata Bolt / Mini Cooper Convertible, Mini 3 Door, Mini 5 Door Balanced handling on dry and wet surfaces Riding comfort and silent drive Long life with improved durability Low rolling resistance', NULL, NULL, NULL),
(21, 'tire', 'TIRE', 'punture kit', 700, 'https://picsum.photos/200', 'WILLIBEE 6 in 1 Universal Tubeless Tire Puncture Kit (with Storage Box) Emergency Flat Tire Repair Patch Punchure Kit Tool Bag for Car, Bike, SUV, & Motorcycle 🏍UNIVERSAL TUBELESS TIRE REPAIR KIT: WILLIBEE Universal Tubeless Tyre Repair Kit is a compact and convenient 6 in 1 set that has everything you need to repair tubeless tires on your own. With T handle Grips and Repair String Plugs, you can easily fix a flat tyre within minutes. 🏍 FULL RANGE OF ACCESSORIES: The offered kit contains Reamer, Probe, Rubber Glue, 10 Puncture Repair Strips, Nose Plier and Cutter. Everything in this kit is made of durable and high-quality materials and will serve you for a long time. No need to search for a mechanic whenever you get a flat tire.', NULL, NULL, NULL),
(22, 'tire', 'TIRE', 'cup', 250, 'https://picsum.photos/200', 'Tirewell TW-5014 Fluorescent Tyre Valve Cap Night Glow Luminous Wheel Covers Illuminated Tire Caps Ideal for Cars & Bikes (Pack of 8, Green) LIGHT UP THE NIGHT: Glow in the dark, making your automobile the coolest one in the dark and enhancing the excitement of your nighttime trip. Your car or bike will attain a highlighted personality from its opulent appearance. WATERTIGHT RUBBER SEAL: Inside, rubber seals produce a tighter, more reliable seal. It stops air leakage, which can significantly increase driving safety and ensure that your ', NULL, NULL, NULL),
(23, 'oil', 'OIL', 'Bosch 5w 3.4l', 2500, 'https://picsum.photos/200', 'Bosch F002H23763 Fusion API SL SAE 5W 30 Semi Synthetic Engine Oil for Passenger Cars (3.5 L) Applicable for passenger cars as per OE recommendation of car engine oil grade Semi synthetic 5w30 engine oil ideal for both petrol and diesel car Premium performance Longer drain interval Please Note This item is non-returnable', NULL, NULL, 1),
(24, 'oil', 'OIL', 'Shelll', 2000, 'https://picsum.photos/200', 'Shell Helix HX8 5W-30 API SN Plus Fully Synthetic Engine Oil for Petrol, Diesel & CNG Cars (3.5 L), medium Shell Helix HX8 is a Fully Synthetic motor oil which features the dynamic “Flexi-Molecule Technology” that constantly adapt to boost protection, when your engine needs it most. Provides advanced synthetic protection in different demanding driving conditions like urban driving, highway accelerations, steep hills and cold starts Improved fuel economy; lesser emissions & higher savings 40% better wear protection, 78% better corrosion protection & 58% more deposit', NULL, NULL, NULL),
(25, 'battery', 'BATTERY', 'Bayee battery12 v', 3000, 'https://picsum.photos/200', 'Baybee Ride-On Car Battery Only - Baybee Product Spare Parts (12 Volts) Black Customer Care No. - 8939028239; Multipurpose Sealed Lead Acid Battery. Maintenance free and spill proof battery. Color Name: Multicolor SPARE ONLY FOR BABY PRODUCTS. Sealed Lead-Acid Rechargeable Battery 12V7.6AH/20HR for UPS, Toys, Solar, Emergency lights, security device, etc. Strong ABS and Sealed Maintenance Free. Sealed Construction and Leak Proof. Safety Valve Regulated System Deep Discharge Recovery. Wide Operating Temperature Range 100% Brand New Suggested charging initial 8 hours for a better life. Push-type battery terminal. Long shelf life', NULL, NULL, NULL),
(26, 'battery', 'BATTERY', 'power zone', 45000, 'https://picsum.photos/200', 'POWERZONE PZ 9000L (90AH) CAR BATTERY (4) Capacity :90 AH Warranty :18 Months Vibration Resistant Maintenance Free POWERZONE PZ 900L (90AH) is durable range of car batteries with high heat resistance, maintenance free that makes them perfect for cars. Silver alloys (SILVEN X) that ensures low corrosion and long life. This range of batteries are Generally used for multi utility and commercial vehicles such as taxi, cabs and other private cars', NULL, NULL, 1),
(27, 'gear-and-clutch', 'GEAR & CLUTCH', 'clutch nuts', 650, 'https://picsum.photos/200', '4Pieces Set of Clutch Nut Spanner Tool for Bajaj Pulsar, TVS Star City, Hero Honda and Super Splendor Motorbikes. Hardened and Tempered Steel Made on CNC Machines. Very useful for Auto Repair Shops, Garrages and Workshops Arnav 4Pieces Set Clutch Nut Spanner Repairing Tool for Bajaj Pulsar, TVS Star City/XL, Hero Honda, Super Splendor Motorbikes Made on CNC Machine Hardened and.', '{"Brand": "Arnav", "Package Dimensions": "20 x 5 x 5 cm; 249", "Part Number": "OSBWT-1006", "Manufacturer Number": "OSB-WT-1006", "Item Weight": "249 g", "Best Sellers Rank": "#17,802"}', NULL, 1),
(28, 'gear-and-clutch', 'GEAR & CLUTCH', 'clutch wire', 1200, 'https://picsum.photos/200', 'Open Throttle Racers Hyosung GT250R/ GTR250/ Comet R Clutch Cable Strong Inner Wire High performance product Easy Installation OEM Size and Shape Direct Fitment Hyosung GT250R/ GTR250/ Comet R Clutch Cable. Perfect Size and Fitment. It has strong inner metal wire which is reliable and work perfectly during continuous Engagement/ Disengagement', NULL, NULL, 1),
(29, 'abs', 'ABS', 'Swift break pads', 2000, 'https://picsum.photos/200', 'Being a prominent firm, we are engaged in offering a distinguished assortment of Brake Cables.We have a complete range of Car Brake Cables.', '{
  "Vehicle Type": "Car",
  "Color": "Black",
  "Packaging Type": "Box",
  "Outer Material": "Rubber",
  "Inner Material": "Aluminium",
  "Vehicle Brand": "Hyundai"
}
', NULL, 1),
(30, 'abs', 'ABS', 'Black rubber nazil', 45, 'https://picsum.photos/200', '
Being a prominent firm, we are engaged in offering a distinguished assortment of Brake Cables.We have a complete range of Car Brake Cables',
'{
  "Usage/Application": "Automotive",
  "Shape": "Reducing",
  "Color": "Black",
  "Size": "10 mm",
  "Material": "Rubber",
  "Hardness": "37 HRC",
  "Quantity per Box": "36 pieces",
  "Minimum Order Quantity": "100 piece"
}', NULL, 1),
(31, 'abs', 'ABS', 'Break rotator', 1700, 'https://picsum.photos/200', 'In order to meet requirements of our clients, we are offering to our clients technically advanced range of Disc Brake Rotors in order to match their expectations and requirements. These Disc Brake Rotors are able to prevent rust and corrosion with clear looking coating protection and provide clean look for open-wheeled vehicles.',
NULL, NULL, 1),
(32, 'suspension', 'SUSPENSION', 'Fan engin cooler', 700, 'https://picsum.photos/200', 'When you buy Radiator / Intercooler Assembly & its components by Maruti Suzuki you get the MSGP Advanatge of Reliability & Efficiency', 
'{
  "Height": "48 cm",
  "Weight": "2100 grams",
  "Width": "13 cm",
  "Length": "70 cm"
}', '17700M74L4550', 1),
(33, 'suspension', 'SUSPENSION', 'Oil filter', 700, 'https://picsum.photos/200', '
Very minute solid particles (contaminants) get mixed with engine oil due to wear and tear, rotating engine parts & combustion suit. Oil filters separate out these contaminants from engine oil and keeps it clean.', 
'{
  "Height": "12 cm",
  "Weight": "112 grams",
  "Width": "8 cm",
  "Length": "8 cm"
}
', '17700M74L230', 1),
(34, 'suspension', 'SUSPENSION', '4 wheeler suspesion part', 700, 'https://picsum.photos/200', '
Established in the year 2002 at Mumbai, Maharashtra, we “Arihant Auto House” are a Sole Proprietorship based firm, engaged as the foremost Wholesale Trader of Tappet Cover, Break Pad, etc. Our products are high in demand due to their premium quality and affordable prices. Furthermore, we ensure to timely deliver these products to our clients, through this we have gained a huge clients base in the market',NULL, '17700M74L235530', 1),
(35, 'bodyaccessory', 'BODY ACCESSORIES', 'Vacume Cleaner', 700, 'https://picsum.photos/200', 'Tis car vacuum cleaner 12v high power handheld portable car vacuum for deep cleaning 102W  vacuum motor & 4200PA powerful suction ,16ft cord,heap filter.', '[\"Door delivery\", \"1 week warenty\", \"Return available in 1 week\", \"No delivery charge\", \"Cash on elivery\"]', NULL, NULL),
(36, 'bodyaccessory', 'BODY ACCESSORIES', 'Dust Gel', 200, 'https://picsum.photos/200', 'Cleaning Gel for car detailing putty laptop kayboard cleaner 2020 upgrade new cae slime super streachable non sticky remove dust with its super sticky and non breakable.', '[\"Door delivery\", \"1 week warenty\", \"Return available in 1 week\", \"No delivery charge\", \"Cash on elivery\"]', NULL, NULL),
(37, 'bodyaccessory', 'BODY ACCESSORIES', 'Marker', 700, 'https://picsum.photos/200', 'Water marker rubber permanent paint marker pe for car tyre available in multiple color ,water proof with store it in cool area to avoid vaporizing .', '[\"Door delivery\", \"1 week warenty\", \"Return available in 1 week\", \"No delivery charge\", \"Cash on elivery\"]', NULL, NULL),
(38, 'bodyaccessory', 'BODY ACCESSORIES', 'Wiper', 500, 'https://picsum.photos/200', 'Super soft cloth - 4pcs -40x40 cms 340 GSM thick lint & streak-free multiple cloth -automotive easyily washable cloth easy dirt removable and easyily washable .', '[\"Door delivery\", \"1 week warenty\", \"Return available in 1 week\", \"No delivery charge\", \"Cash on elivery\"]', NULL, NULL);


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `booking_history` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`booking_history`)),
  `type_of_user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `phone_number`, `booking_history`, `type_of_user`) VALUES
(1, 'admin@gmail.com', '$2b$10$Rrl.DHgSXL35n44Z4JU5HOOAVgEjG5yDqW5tebTaEhiRRIXvxKV0S', 1234567890, '[]', 'admin'),
(2, 'executive@gmail.com', '$2b$10$qmVbV4GOPQVCnWRhumUx5u7Bt1COfNOkEy5FRLVhrAFA1pBaxpN6.', 987654321, '[{\"booking_id\":3,\"date\":\"2024-01-18\",\"type\":\"painting\",\"vehicle\":\"bike\",\"status\":\"resolved\"}]', 'executive'),
(3, 'yashu@gmail.com', '$2b$10$KrjMaBhdTSJh.FHuHeU6s.7/dcCUhKl8AzZWqo6IBZMBlf16K24w2', 13224, '[]', 'banned'),
(4, 'parth@gmail.com', '$2b$10$cEWLMrojjzxUdnpLCllwEeys2eOc/I1ddhoRpuB4YYZPwZdQYAnMW', 12232390, '[]', 'user');

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
