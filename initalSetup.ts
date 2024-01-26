import mysql from "mysql2";
import dotenv from "dotenv";
dotenv.config();
const connection = (database?: string) => {
  return mysql.createConnection({
    host: "localhost",
    user: "root",
    password: process.env.DB_PASSWORD,
    ...(database ? { database: database } : {}),
    waitForConnections: true,
  });
};

const createTable = async (databaseName: string, query: string) => {
  const con = connection(databaseName);

  con.query(query, (err, rows, fields) => {
    if (err) console.log(err.message);

    console.log("The solution is: ", rows, fields);
  });
  con.end();
};
const createDatabase = async (databaseName: string) => {
  const con = connection();

  con.query(`create database IF NOT EXISTS ${databaseName} `, (err) => {
    if (err) console.log(err);
  });
  con.end();
};
(async () => {
  await createDatabase("carService");
  await createTable(
    "carService",
    `CREATE TABLE IF NOT EXISTS users (
          id INT AUTO_INCREMENT PRIMARY KEY,
          email VARCHAR(255) UNIQUE NOT NULL,
          password VARCHAR(255) NOT NULL,
          phone_number BIGINT unique,
          booking_history JSON
      )`
  );
  await createTable(
    "carService",
    `CREATE TABLE IF NOT EXISTS car_Services (
          id INT AUTO_INCREMENT PRIMARY KEY,
          type_of_service VARCHAR(255) NOT NULL,
          name VARCHAR(255) NOT NULL,
          price INT NOT NULL,
          img_path VARCHAR(255),
          details JSON,
          description JSON
      )`
  );
  await createTable(
    "carService",
    `CREATE TABLE IF NOT EXISTS car_Shopping (
          id INT AUTO_INCREMENT PRIMARY KEY,
          type varchar(255) NOT NULL,
          type_of_shopping VARCHAR(255) NOT NULL,
          name VARCHAR(255) NOT NULL,
          price INT NOT NULL,
          img_path VARCHAR(255),
          product_details TEXT,
          specifications JSON,
          part_number VARCHAR(255),
          numberOfItems INT
    )`
  );
  await createTable(
    "carService",
    `CREATE TABLE IF NOT EXISTS bike_Services (
          id INT AUTO_INCREMENT PRIMARY KEY,
          type_of_service VARCHAR(255) NOT NULL,
          name VARCHAR(255) NOT NULL,
          price INT NOT NULL,
          img_path VARCHAR(255),
          details JSON,
          description JSON
      )`
  );
  await createTable(
    "carService",
    `CREATE TABLE IF NOT EXISTS bike_Shopping (
          id INT AUTO_INCREMENT PRIMARY KEY,
          type varchar(255) NOT NULL,
          type_of_shopping VARCHAR(255) NOT NULL,
          name VARCHAR(255) NOT NULL,
          price INT NOT NULL,
          img_path VARCHAR(255),
          product_details TEXT,
          specifications JSON,
          part_number VARCHAR(255),
          numberOfItems INT
    )`
  );
  await createTable(
    "carService",
    `CREATE TABLE IF NOT EXISTS bookings (
          id INT AUTO_INCREMENT PRIMARY KEY,
          vehicle VARCHAR(255) NOT NULL,
          type varchar(255) NOT NULL,
          user_id INT NOT NULL,
          name varchar(255) NOT NULL,
          phone_no BIGINT NOT NULL,
          location TEXT NOT NULL,
          date VARCHAR(255) NOT NULL,
          FOREIGN KEY (user_id) REFERENCES users(id)
    )`
  );
})();

// create database carService;
// use carService;
// CREATE TABLE users (
//     id INT AUTO_INCREMENT PRIMARY KEY,
//     email VARCHAR(255) UNIQUE NOT NULL,
//     password VARCHAR(255) NOT NULL,
//     phone_number INT(45) unique,
//     booking_history JSON
// );
// drop table users;
// select * from users;
// select * from car_Services;
// drop table car_Services;

// -- INSERTING VALUES IN car_service Table
// INSERT INTO car_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 	'regular',
//     'Regular Service',
//     4000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Engine oil  and oil filter changing", "Engine maintenance check", "Break check and air check", "Complete car cleaning"]'
// );
// INSERT INTO car_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 	'express',
//     'Express Service',
//     6000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Engine oil  and oil filter changing", "Engine maintenance check", "Break check and air check", "Complete car cleaning", "Fast Service"]'
// );
// INSERT INTO car_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 'ac',
//     'AC Service',
//     6000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Restoring efficiency", "AC colling check", "AC gas refilling", "Complete ac  car cleaning"]'
// );
// INSERT INTO car_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 'mileage',
//     'Mileage Service',
//     3000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["ECG inspection", "Clutch Assessment", "Injector Inspection", "Cleaning catalytic converter"]'
// );

// INSERT INTO car_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 'rust',
//     'RUST COATING',
//     3000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Cost changes based on the dent",
// "Get back your classic look",
// "Best service",
// "With warrenty",
// "High quality paints are used"]'
// );
// INSERT INTO car_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 'interior',
//     'INTERIOR CLEANING',
//     4000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Best cleaning with virus protection ",
// "Get back your classic look",
// "AC vent cleaning",
// "Stain ramoval"]'
// );
// INSERT INTO car_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 'painting',
//     'POLISHIN & PAINTING ',
//     3000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Cost changes based on the dent",
// "Get back your classic look",
// "Best service",
// "With warrenty",
// "High quality paints are used"]'
// );
// INSERT INTO car_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 'dent',
//     'DENT SERVICE',
//     1000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Cast changes based on the dent ",
// "Get back your classic look",
// "Best service",
// "With warrenty"]'
// );

// select * from car_Shopping;
// drop table car_Shopping;
// -- INSERTING VALUES IN car_Shopping Table
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details, specifications)
// VALUES (
// 	"bodyaccessory",
//     "BODY ACCESSORIES",
//     "Car duster",
//     700,
//     "https://picsum.photos/200",
//     "Super soft microfiber car Duster exterior with Extendable Handle ,car brush Duster for car cleaning duster with strong stainless steel and also provided with warrenty.",
//     '["Door delivery", "1 week warenty", "Return available in 1 week", "No delivery charge"]'
// );
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details, specifications)
// VALUES (
// 	"bodyaccessory",
//     "BODY ACCESSORIES",
//     "Scent Soap",
//     300,
//     "https://picsum.photos/200",
//     "Super good fragrance scent soap aat low cost and long standard and fast spreadable available in multiple fragrance.",
//     '["Door delivery", "1 week warenty", "Return available in 1 week", "No delivery charge", "Cash on elivery"]'
// );
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details, specifications, part_number, numberOfItems)
// VALUES (
//     'suspension',
//     'SUSPENSION',
//     'Glow plug',
//     700,
//     'https://picsum.photos/200',
//     'For trouble-free driving experience of your Maruti Suzuki vehicle always use Maruti Suzuki Genuine Parts',
//     '{"Height": "1 cm", "Weight": "60 grams", "Width": "1 cm", "Length": "12 cm"}',
//     "18550M86J00",
//     1
// );
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details, specifications, part_number, numberOfItems)
// VALUES (
//     'suspension',
//     'SUSPENSION',
//     'Radiator',
//     700,
//     'https://picsum.photos/200',
//     'When you buy Radiator / Intercooler Assembly & its components of Maruti Suzuki you get the MSGP Advanatge of Reliability & Efficiency',
//     '{"Height": "13 cm", "Weight": "4800 grams", "Width": "56 cm", "Length": "59 cm"}',
//     "17700M74L50",
//     1
// );

// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details, specifications, numberOfItems)
// VALUES (
//     'abs',
//     'ABS',
//     'Break pads',
//     2500,
//     'https://picsum.photos/200',
//     'We are specialised in spares & lubrication of all the vehicles.maruti suzuki to all new generation vehicles.dealing in filters, clutches, suspensions, brakes, lubrications, body parts, ac parts, electrical parts and many more',
//     '{"Material": "CeramicPart", "Number": "55180 M 60M00", "Ideal For": "All vehicle", "Usage/Application": "Brake System", "Brand": "Original", "Packaging Type": "Box", "Warranty": "1 year warranty", "Shape": "RECTANGLE"}',
//     1
// );
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details, specifications, numberOfItems)
// VALUES (
//     'abs',
//     'ABS',
//     'Swift break pads',
//     4000,
//     'https://picsum.photos/200',
//     'We are specialised in spares & lubrication of all the vehicles.maruti suzuki to all new generation vehicles.dealing in filters, clutches, suspensions, brakes, lubrications, body parts, ac parts, electrical parts and many more',
//     '{"Material": "CeramicPart", "Number": "55180 M 60M00", "Ideal For": "All vehicle", "Usage/Application": "Brake System", "Brand": "Original", "Packaging Type": "Box", "Warranty": "1 year warranty", "Shape": "RECTANGLE"}',
//     1
// );

// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details, specifications, numberOfItems)
// VALUES (
//     'gear-and-clutch',
//     'GEAR & CLUTCH',
//     'Clutch set',
//     8250,
//     'https://picsum.photos/200',
//     'Clutch Set (Clutch + Pressure Plate) Hyundai Santro/ i10 O/M/ I10 Magna (Valeo)',
//     '{"Manufacturer": "Valeo","Brand": "Valeo","PackageDimensions": "26.01 x 24 x 5.99 cm; 3.04kg","ItemModelNumber": "404514","Weight": "3 kg 40 g"}',
//     1
// );
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details, specifications, numberOfItems)
// VALUES (
//     'gear-and-clutch',
//     'GEAR & CLUTCH',
//     'Volvo Clutch',
//     4000,
//     'https://picsum.photos/200',
//     'Vehicle Compatibility: Tata Zest, Bolt 100 percent asbestos free. OE quality and design to ensure easy fitment and smooth engagement and disengagement of gears. Unique dampers design for reduced noise, vibration and harshness. Reliable: Valeo friction gives 3 times higher durability compared to standard friction',
//    '{"Manufacturer": "Valeo", "Brand": "Valeo", "ProductDimensions": "26.5 x 26 x 6.5 cm; 2.9 kg", "PartNumber": "843631", "ManufacturerPart": "843631", "ManufacturerItem": "ValeoItem", "Weight": "2 kg 900 g"}',
//     1
// );

// --
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details, numberOfItems,specifications)
// VALUES (
// 	"battery",
//     "BATTERY",
//     "Amaron",
//     3000,
//     "https://picsum.photos/200",
//     "AMARON HI LIFE FLO 36B20L 36 ah BATTERY FOR PETROL CARS

// Maintenance free<br>
// Factory charged and ready to fit<br>
// High cranking power<br>
// 55 months warranty<br>
// Compatible With Vehicle Type: Passenger Car",
// 1,
//     '{
//   "Brand": "Amaron",
//   "VehicleServiceType": "Passenger Car",
//   "Voltage": "12 Volts"
// }'
// );
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details, numberOfItems)
// VALUES (
// 	"battery",
//     "BATTERY",
//     "Exide",
//     2500,
//     "https://picsum.photos/200",
//     "Exide Battery (Red, 12xL9B) 12 Volt

// 48 MONTHS WARRANTY SEALED MF BATTERIES<br><br>
// This product comes in a proper packaging<br><br>
// It ensures an easy maintenance<br><br>

// EXIDE BATTERIES OR BEST RECOMMENDED ITEM FOR AUTOMOBILE INDUSTRIES AND 48 MONTHS WARRANTY WE CAN EXCHANGE OR COMPLAINT REGISTER EASY REPLACEMENT ALL OVER INDIA JUST ONE CAL CUSTOMER-CARE PICKUP",
// 1
// );
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details)
// VALUES (
// 	"oil",
//     "OIL",
//     "Total Engineer",
//     3000,
//     "https://picsum.photos/200",
//     "TOTALENERGIES - 5W40 Engine Oil - Quartz 9000 Energy - ACEA A3/B4, API SN/CF - Age-Resistance Technology - Ultimate Protection - Advanced Synthetic Motor Oil Lubricant - 3.5L

// ULTIMATE POWER & PERFORMANCE: Formulated with carefully selected premium fully synthetic engile oil, the Quartz 9000 5W40 engine oil ensures excellent start ups even in extremely cold weather conditions.
// BEST IN CLASS CLEANLINESS: The state of the art molecular structure of this Total Quartz 9000 provides outstanding engine longevity by ensuring utmost engine cleanliness, thanks to its advance detergent and excellent"
// );
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details)
// VALUES (
// 	"oil",
//     "OIL",
//     "Castrol 5w 3.5l",
//     1500,
//     "https://picsum.photos/200",
//     "Castrol MAGNATEC STOP-START 5W-30 Full Synthetic Engine Oil for Petrol, Diesel and CNG Cars 3L
// Full synthetic engine oil providing Non-Stop protection from every start, even for vehicles with modern stop-start technology
// DUALOCK Technology delivers 50% better protection from warm-up1 and stop-start2 wear
// Upto 60L annual fuel saving3 during busy stop-start driving, Cling to engine parts when the oil drains down
// Suitable for use in cars with petrol, diesel or CNG powered engines where API SN, ACEA A5/B5, A1/B1 specifications are recommended by manufacturer"
// );
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details, numberOfItems)
// VALUES (
// 	"tire",
//     "TIRE",
//     "JK tire",
//     3000,
//     "https://picsum.photos/200",
//     "JK Tyre 145/80 R12 Ultima Hi^Life Tubeless Car Tyre

// Vehicle Compatability - Maruti Suzuki ALTO 800, Maruti Suzuki ZEN, Maruti Suzuki OMNI, Maruti Suzuki NEW ALTO 800, Maruti Suzuki ALTO, Hyundai EON
// Premium Comfort
// Unconditional Warranty for 2 years covering non manufacturing defects like cuts and damages
// Fit type: Universal Fit",
// 1
// );
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details, numberOfItems)
// VALUES (
// 	"tire",
//     "TIRE",
//     "Apollo tyres",
//     1500,
//     "https://picsum.photos/200",
//     "Apollo Alnac 4Gs 175/65 R15 84H Tubeless Car Tyre

// Vehicle Compatibility: Honda Jazz, City, Brio / Tata Bolt / Mini Cooper Convertible, Mini 3 Door, Mini 5 Door
// Balanced handling on dry and wet surfaces
// Riding comfort and silent drive
// Long life with improved durability
// Low roling resistance",
// 1
// );
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details)
// VALUES (
// 	"light",
//     "LIGHT",
//     "Mercury Bar Light",
//     730,
//     "https://picsum.photos/200",
//     "Provides 500% Brighter Clear Road Visibility making it a Must Have Item for Night Time and Highway Travelers. Spot beam light Pattern Let you see the Road Clearly in Dark.
// Can be Fixed on the Roof of your Car or at the Lower Bumper Area, and easily hanged with the help of Easy mounting Clamps Provided along the Bar Light.
// High brightness: Advanced LED chips and clear PC lens, powerful and bright light beam, let you see the forward dark road clearly.
// It's Direct Connect to minimum 12V to 32V max power from car, Red & Black wires are on the bar light for connection, while the red is for positive connection and the black is for negative connection."
// );
// INSERT INTO car_Shopping (type, type_of_shopping, name, price, img_path, product_details)
// VALUES (
// 	"light",
//     "LIGHT",
//     "Fog Light Bulb",
//     1500,
//     "https://picsum.photos/200",
//     "Carzex High Power H8/H11/H16 Car Led Fog Light Bulbs, 150W/12,000 Lumens Super Bright LED Headlight Conversion Kit for Cars 6000K Cool White, Set of 2

// PLUG AND PLAY DESIGN – Can be installed easily within 15 mins. Lower profile of the bulb is only 0.72 inches apply to 95% vehicles. All-in-one Plug & Play Design, No Modification Required, Fits easily into the assembly.
// Design with High Power CSP LED Chips – 500% brighter than stock H8 LED Fog Light Bulbs. high focus and max light output with a wider and farther lighting area, keep safer night driving.
// 500% brighter than Traditional Halogen"
// );

// INSERT INTO bike_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 	'regular',
//     'Regular Service',
//     4000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Engine oil  and oil filter changing", "Engine maintenance check", "Break check and air check", "Complete car cleaning"]'
// );
// INSERT INTO bike_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 	'express',
//     'Express Service',
//     6000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Engine oil  and oil filter changing", "Engine maintenance check", "Break check and air check", "Complete car cleaning", "Fast Service"]'
// );
// INSERT INTO bike_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 'mileage',
//     'Mileage Service',
//     3000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["ECG inspection", "Clutch Assessment", "Injector Inspection", "Cleaning catalytic converter"]'
// );

// INSERT INTO bike_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 'rust',
//     'RUST COATING',
//     3000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Cost changes based on the dent",
// "Get back your classic look",
// "Best service",
// "With warrenty",
// "High quality paints are used"]'
// );
// INSERT INTO bike_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 'exterior',
//     'EXTERIOR CLEANING',
//     4000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Best cleaning with virus protection ",
// "Get back your classic look",
// "AC vent cleaning",
// "Stain ramoval"]'
// );
// INSERT INTO bike_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 'painting',
//     'POLISHIN & PAINTING ',
//     3000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Cost changes based on the dent",
// "Get back your classic look",
// "Best service",
// "With warrenty",
// "High quality paints are used"]'
// );
// INSERT INTO bike_Services (type_of_service, name, price, img_path, details, description)
// VALUES (
// 'dent',
//     'DENT SERVICE',
//     1000,
//     'https://picsum.photos/200',
//     '["All payments are available", "100% satisfaction", "Pick-up  & Drop at your location", "first time free service available"]',
//     '["Cast changes based on the dent ",
// "Get back your classic look",
// "Best service",
// "With warrenty"]'
// );
// -- Bike Shopping
// select * from bike_Shopping;
// drop table bike_Shopping;
// INSERT INTO bike_Shopping (type, type_of_shopping, name, price, img_path, product_details, specifications, numberOfItems)
// VALUES (
//     'abs',
//     'ABS',
//     'Swift break pads',
//     2000,
//     'https://picsum.photos/200',
//     'Being a prominent firm, we are engaged in offering a distinguished assortment of Brake Cables.We have a complete range of Car Brake Cables.',
//     '{"VehicleType": "Bike", "Color": "Black", "PackagingType": "Box", "OuterMaterial": "Rubber", "InnerMaterial": "Aluminium", "VehicleBrand": "Hyundai"}',
//     1
// );
// INSERT INTO bike_Shopping (type, type_of_shopping, name, price, img_path, product_details, numberOfItems,specifications)
// VALUES (
// 	"body",
//     "BODY ACCESSORIES",
//     "Front & Mudguard",
//     3000,
//     "https://picsum.photos/200",
//     "FRONT FAIRING AND MUDGUARD KARIZMA R ZADON

// This COMBO BODY PARTS is suitable for : HERO HONDA KARIZMA,HERO HONDA KARIZMA R,HERO HONDA KARIZMA R NM",
// 1,
//     '{
//   "BoxPackWeight": {
//     "approx": "1000.00 Grams"
//   },
//   "BoxPackVolume": {
//     "approx": "4000 CC",
//     "volumetricWeightApplied": "0.80 Kg"
//   },
//   "ShippingCharge": {
//     "amount": "Rs.400.00",
//     "minFor": "Minimum for"
//   }
// }
// '
// );
// INSERT INTO bike_Shopping (type, type_of_shopping, name, price, img_path, product_details, numberOfItems, specifications)
// VALUES (
// 	"battery",
//     "BATTERY",
//     "Amaron",
//     3000,
//     "https://picsum.photos/200",
//     "AMARON HI LIFE FLO 36B20L 36 ah BATTERY FOR PETROL bike

// Maintenance free<br>
// Factory charged and ready to fit<br>
// High cranking power<br>
// 55 months warranty<br>
// Compatible With Vehicle Type: Passenger bike",
// 1,'{
//   "Brand": "Amaron",
//   "VehicleServiceType": "Bike",
//   "Voltage": "12 Volts"
// }
// '
// );
// INSERT INTO bike_Shopping (type, type_of_shopping, name, price, img_path, product_details)
// VALUES (
// 	"oil",
//     "OIL",
//     "Total Engineer",
//     3000,
//     "https://picsum.photos/200",
//     "

// TOTALENERGIES - 5W40 Engine Oil - Quartz 9000 Energy - ACEA A3/B4, API SN/CF - Age-Resistance Technology - Ultimate Protection - Advanced Synthetic Motor Oil Lubricant - 3.5L

// ULTIMATE POWER & PERFORMANCE: Formulated with carefully selected premium fully synthetic engile oil, the Quartz 9000 5W40 engine oil ensures excellent start ups even in extremely cold weather conditions.
// BEST IN CLASS CLEANLINESS: The state of the art molecular structure of this Total Quartz 9000 provides outstanding engine longevity by ensuring utmost engine cleanliness, thanks to its advance detergent and excellent"
// );

// INSERT INTO bike_Shopping (type, type_of_shopping, name, price, img_path, product_details, numberOfItems)
// VALUES (
// 	"tire",
//     "TIRE",
//     "Alpha H1",
//     6500,
//     "https://picsum.photos/200",
//     "
// ALPHA H1

// Zero Degree steel belt
// Arrests dynamic growth
//  Excellent high-speed stability via minimal       structural deformation.

// Premium compound with a smart blend os Silica and Carbn Black
// Extreme chemical grip on wet and dry surfaces.
// Optimum tread mileage

// dual Radii cavity profile.
// Quick to achieve lean angles.
// Outstanding sport handling",
// 1
// );

// INSERT INTO bike_Shopping (type, type_of_shopping, name, price, img_path, product_details)
// VALUES (
// 	"light",
//     "LIGHT",
//     "Pivalon",
//     8250,
//     "https://picsum.photos/200",
//     "Pivalo 12V-85V Energy-saving LED Motorcycle Headlight Headlamp Motorbike Motorcycle Head light Lamp with 12 White Light LED (Silver) Bike Headlight Mount

// Pivalo LED Head Light/Lamp is the best upgrade you can have for your two wheeler or four wheeler. A universal fitment for Bikes And Cars with a cooling mechanism, the offered white light LED is appreciated for its extended brightness or heat-dissipating design. This is a highly used product by bike enthusiasts, driver lovers and biker boys who love to ride or drive around the areas. It offers a unique visibility experience by illuminating the pathway ahead. Specification: LED Power: 24W (12 x 2 W High Intensity LED) Beam Pattern: Flood Beam Input Voltage: 12V-85V DC (fits 12V, 24V"
// );
// INSERT INTO bike_Shopping (type, type_of_shopping, name, price, img_path, product_details, numberOfItems,specifications)
// VALUES (
// 	"gear",
//     "GEAR & CLUTCH",
//     "Clutch set",
//     8250,
//     "https://picsum.photos/200",
//     "Clutch Set (Clutch + Pressure Plate) Hyundai Santro/ i10 O/M/ I10 Magna (Valeo)",
// 1,
//     '{
//   "Manufacturer": "Valeo",
//   "Brand": "Valeo",
//   "PackageDimensions": "26.01 x 24 x 5.99 cm; 3.04kg",
//   "ItemModelNumber": "404514",
//   "Weight": "3 kg 40g"
// }
// '
// );
