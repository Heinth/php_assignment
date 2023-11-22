-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 21, 2023 at 05:38 PM
-- Server version: 8.1.0
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic_mgmt`
--

-- --------------------------------------------------------

--
-- Table structure for table `clinicDocument`
--

CREATE TABLE `clinicDocument` (
  `DocumentId` int NOT NULL,
  `DocumentContent` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clinicDocument`
--

INSERT INTO `clinicDocument` (`DocumentId`, `DocumentContent`) VALUES
(1, 'CD1'),
(2, 'CD2'),
(3, 'CD3');

-- --------------------------------------------------------

--
-- Table structure for table `costRate`
--

CREATE TABLE `costRate` (
  `Id` int NOT NULL,
  `costCode` varchar(6) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `type` varchar(64) NOT NULL,
  `IOrE` varchar(1) NOT NULL,
  `accountCode` varchar(10) NOT NULL,
  `registeredSince` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `costRate`
--

INSERT INTO `costRate` (`Id`, `costCode`, `amount`, `type`, `IOrE`, `accountCode`, `registeredSince`) VALUES
(1, 'CC1', 10000.00, 'IP', 'I', '1001000001', '2023-11-19 13:30:28'),
(2, 'CC2', 20000.00, 'OPD', 'I', '1001000002', '2023-11-19 13:30:28'),
(3, 'CC3', 30000.00, 'LAB', 'I', '1001000003', '2023-11-19 13:30:28'),
(4, 'CC4', 40000.00, 'OT', 'E', '1001000004', '2023-11-19 13:30:28'),
(5, 'CC5', 50000.00, 'Doctor', 'E', '1001000005', '2023-11-19 13:30:28'),
(6, 'CC6', 60000.00, 'Nurse', 'E', '1001000006', '2023-11-19 13:30:28'),
(7, 'CC7', 70000.00, 'OtherIncome', 'I', '1001000007', '2023-11-19 13:30:28'),
(8, 'CC8', 80000.00, 'OtherExpense', 'E', '1001000008', '2023-11-19 13:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `expenseBill`
--

CREATE TABLE `expenseBill` (
  `expenseBillId` int NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `patientCode` varchar(10) NOT NULL,
  `totalAmount` decimal(20,2) NOT NULL,
  `operatorCode` varchar(6) NOT NULL,
  `isPosted` varchar(5) NOT NULL DEFAULT 'False',
  `isVoided` varchar(5) NOT NULL DEFAULT 'False',
  `postedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `expenseBill`
--

INSERT INTO `expenseBill` (`expenseBillId`, `datetime`, `patientCode`, `totalAmount`, `operatorCode`, `isPosted`, `isVoided`, `postedDate`) VALUES
(1, '2023-11-19 13:30:28', 'P01', 22000.00, 'U4', 'True', 'True', '2023-11-19 13:30:28'),
(2, '2023-11-19 13:30:28', 'P02', 22000.00, 'U4', 'True', 'True', '2023-11-19 13:30:28'),
(3, '2023-11-19 13:30:28', 'P03', 37000.00, 'U4', 'True', 'True', '2023-11-19 13:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `expenseBillItem`
--

CREATE TABLE `expenseBillItem` (
  `expenseBillItemId` int NOT NULL,
  `expenseBillId` int NOT NULL,
  `costCode` varchar(6) NOT NULL,
  `amount` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `expenseBillItem`
--

INSERT INTO `expenseBillItem` (`expenseBillItemId`, `expenseBillId`, `costCode`, `amount`) VALUES
(1001, 1, 'CC5', 15000.00),
(1002, 1, 'CC6', 7000.00),
(2001, 2, 'CC5', 15000.00),
(2002, 2, 'CC6', 7000.00);

-- --------------------------------------------------------

--
-- Table structure for table `incomeBill`
--

CREATE TABLE `incomeBill` (
  `BillId` int NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `patientCode` varchar(10) NOT NULL,
  `totalAmount` decimal(20,2) NOT NULL,
  `operatorCode` varchar(6) NOT NULL,
  `isPosted` varchar(5) NOT NULL DEFAULT 'False',
  `isVoided` varchar(5) NOT NULL DEFAULT 'False',
  `postedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `incomeBill`
--

INSERT INTO `incomeBill` (`BillId`, `datetime`, `patientCode`, `totalAmount`, `operatorCode`, `isPosted`, `isVoided`, `postedDate`) VALUES
(1, '2023-11-19 13:30:28', 'P01', 70000.00, 'U4', 'True', 'True', '2023-11-19 13:30:28'),
(2, '2023-11-19 13:30:28', 'P02', 120000.00, 'U4', 'True', 'True', '2023-11-19 13:30:28'),
(3, '2023-11-19 13:30:28', 'P03', 75000.00, 'U4', 'True', 'True', '2023-11-19 13:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `incomeBillItem`
--

CREATE TABLE `incomeBillItem` (
  `incomeBillItemId` int NOT NULL,
  `incomeBillId` int NOT NULL,
  `costCode` varchar(6) NOT NULL,
  `amount` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `incomeBillItem`
--

INSERT INTO `incomeBillItem` (`incomeBillItemId`, `incomeBillId`, `costCode`, `amount`) VALUES
(1001, 1, 'CC2', 20000.00),
(1002, 1, 'CC3', 30000.00),
(2001, 2, 'CC2', 20000.00),
(2002, 2, 'CC7', 70000.00),
(3001, 3, 'CC2', 20000.00),
(3002, 3, 'CC3', 30000.00),
(4001, 3, 'CC1', 10000.00);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientId` int NOT NULL,
  `patientCode` varchar(10) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(1) NOT NULL,
  `bloodGroup` varchar(64) NOT NULL,
  `allergy` varchar(255) NOT NULL,
  `fatherName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `registeredDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientId`, `patientCode`, `Name`, `dateOfBirth`, `age`, `gender`, `bloodGroup`, `allergy`, `fatherName`, `address`, `registeredDate`) VALUES
(1, 'P01', 'Ko Aung', '1996-01-02', 27, 'M', 'O', 'N/A', 'U Tint', 'Kyaung Thit Street, , San Chaung, Yangon', '2023-11-21 05:02:05'),
(2, 'P02', 'Aung Ko', '1999-03-07', 24, 'M', 'A', 'N/A', 'U Myo Maung', '89 street,Mingalar Taung Nyunt, Yangon', '2023-11-19 13:30:28'),
(3, 'P03', 'Nyi Lwin', '1992-09-05', 31, 'M', 'B', 'N/A', 'U Ko Maung', '13 street Lanmadaw, Yangon', '2023-11-19 13:30:28'),
(4, 'P04', 'Myo Ye', '1999-05-12', 24, 'M', 'A', 'N/A', 'U Maung Maung', 'South Dagon, Yangon', '2023-11-19 13:30:28'),
(5, 'P05', 'Ye Yint', '1991-07-12', 32, 'M', 'B', 'N/A', 'U Sai Phone', 'Sit Chaung Street, Mingalar Don, Yangon', '2023-11-19 13:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `patientCheckInOut`
--

CREATE TABLE `patientCheckInOut` (
  `Id` int NOT NULL,
  `datetime` datetime NOT NULL,
  `patientCode` varchar(10) NOT NULL,
  `patientVitalId` int NOT NULL,
  `doctorCode` varchar(6) NOT NULL,
  `checkInTime` datetime NOT NULL,
  `checkOutTime` datetime NOT NULL,
  `Served` varchar(3) NOT NULL,
  `Billed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patientCheckInOut`
--

INSERT INTO `patientCheckInOut` (`Id`, `datetime`, `patientCode`, `patientVitalId`, `doctorCode`, `checkInTime`, `checkOutTime`, `Served`, `Billed`) VALUES
(1, '2023-11-19 13:30:28', 'P01', 1, 'P01', '2023-11-19 13:30:28', '2023-11-19 13:30:28', 'Yes', 'Yes'),
(2, '2023-11-19 13:30:28', 'P02', 2, 'P02', '2023-11-19 13:30:28', '2023-11-19 13:30:28', 'Yes', 'Yes'),
(3, '2023-11-19 13:30:28', 'P03', 3, 'P01', '2023-11-19 13:30:28', '2023-11-19 13:30:28', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `patientDocument`
--

CREATE TABLE `patientDocument` (
  `patientDocumentId` int NOT NULL,
  `documentContent` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patientDocument`
--

INSERT INTO `patientDocument` (`patientDocumentId`, `documentContent`) VALUES
(1, 'P01'),
(2, 'P02'),
(3, 'P03');

-- --------------------------------------------------------

--
-- Table structure for table `patientLabRecord`
--

CREATE TABLE `patientLabRecord` (
  `labRecordId` int NOT NULL,
  `date` datetime NOT NULL,
  `doctorCode` varchar(6) NOT NULL,
  `incomeBillId` int NOT NULL,
  `isCollected` varchar(3) NOT NULL,
  `patientDocumentId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patientLabRecord`
--

INSERT INTO `patientLabRecord` (`labRecordId`, `date`, `doctorCode`, `incomeBillId`, `isCollected`, `patientDocumentId`) VALUES
(1, '2023-11-19 13:30:28', 'P01', 1, 'Yes', 1),
(2, '2023-11-19 13:30:28', 'P01', 3, 'Yes', 3);

-- --------------------------------------------------------

--
-- Table structure for table `patientVital`
--

CREATE TABLE `patientVital` (
  `patientVitalId` int NOT NULL,
  `patientCode` varchar(10) NOT NULL,
  `bP` varchar(255) NOT NULL,
  `oxygen` decimal(20,2) NOT NULL,
  `weight` decimal(20,2) NOT NULL,
  `respRate` decimal(20,2) NOT NULL,
  `height` decimal(20,2) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operatorCode` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patientVital`
--

INSERT INTO `patientVital` (`patientVitalId`, `patientCode`, `bP`, `oxygen`, `weight`, `respRate`, `height`, `datetime`, `operatorCode`) VALUES
(1, 'P01', 'DOWN(20)-UP(50)', 100.00, 106.00, 16.00, 4.90, '2023-11-19 13:30:28', 'U4'),
(2, 'P02', 'DOWN(70)-UP(80)', 98.00, 129.00, 14.00, 5.40, '2023-11-19 13:30:28', 'U4'),
(3, 'P03', 'DOWN(60)-UP(100)', 97.00, 110.00, 11.00, 5.80, '2023-11-19 13:30:28', 'U4');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `personId` int NOT NULL,
  `personalCode` varchar(6) DEFAULT NULL,
  `personType` varchar(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `specializing` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `registeredSince` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`personId`, `personalCode`, `personType`, `name`, `specializing`, `address`, `registeredSince`) VALUES
(1, 'P01', 'A', 'Dr. Phyo', 'Administrator', 'Mingalar Don, Yangon, Myanmar', '2023-11-19 13:30:28'),
(2, 'P02', 'D', 'Dr. Wai', 'Neurologist', 'Sate Kan Thar, Yangon', '2023-11-19 13:30:28'),
(3, 'P03', 'N', 'Kay Kay', 'Nursing', 'Kan thar Yar, Yangon', '2023-11-19 13:30:28'),
(4, 'P04', 'O', 'Kyaw Gyi', 'Stuff', 'Kyar Kwat Thit, Yangon', '2023-11-19 13:30:28'),
(5, 'P05', 'A', 'Aung Myo Kyaw', 'Administration', 'North Okkala, Yangon', '2023-11-19 13:30:28'),
(6, 'P06', 'A', 'New Doctor', 'Neurologist', 'Kyar Kwat Thit, Yangon', '2023-11-20 05:49:57'),
(8, 'P07', 'A', 'New Doctor 1', 'Neurologist', 'Yangon', '2023-11-20 05:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `postingTransaction`
--

CREATE TABLE `postingTransaction` (
  `postingDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accountCode` varchar(10) NOT NULL,
  `Amount` decimal(20,2) NOT NULL,
  `operatorCode` varchar(6) NOT NULL,
  `checkedPersonalCode` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `postingTransaction`
--

INSERT INTO `postingTransaction` (`postingDate`, `accountCode`, `Amount`, `operatorCode`, `checkedPersonalCode`) VALUES
('2023-11-19 13:30:28', 'ACCT000001', 240000.00, 'U4', 'P04'),
('2023-11-19 13:30:28', 'ACCT000002', 12000.00, 'U4', 'P04');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `programId` int NOT NULL,
  `permitRoles` varchar(1) NOT NULL,
  `programName` varchar(128) NOT NULL,
  `route` varchar(255) NOT NULL,
  `params` varchar(255) NOT NULL,
  `registeredSince` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`programId`, `permitRoles`, `programName`, `route`, `params`, `registeredSince`) VALUES
(1, '3', 'Login to portal', 'Programs\\Login\\user', '[userCode],[password]', '2023-11-19 13:30:28'),
(2, 'A', 'User creation', 'Programs\\CreateAccount\\user', '[UID],[userCode],[personNo],[password],[registeredSince]', '2023-11-19 13:30:28'),
(3, 'O', 'Bill for cash', 'Programs\\Billing', '[patient_id],[doctorNo],[amount],[param 4],[param 5],[param 6],[param 7],[param 8]', '2023-11-19 13:30:28'),
(4, '1', 'Patient Vital', 'Programs\\Patient\\Vital', '[patient_id],[personNo],[bP],[oximeter],[weight],[height],[param 7],[param 8]', '2023-11-19 13:30:28'),
(5, '2', 'Patient Check In/Out', 'Programs\\Patient\\CheckInOut', '[patient_id],[personNo],[param 3],[param 4],[param 5],[param 6]', '2023-11-19 13:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleId` int NOT NULL,
  `description` varchar(64) NOT NULL,
  `program_permission` varchar(255) NOT NULL,
  `registeredSince` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleId`, `description`, `program_permission`, `registeredSince`) VALUES
(1, 'Admin', 'Allow Full Permission', '2023-11-19 13:30:28'),
(2, 'Operator', 'Allow New Data Add only', '2023-11-19 13:30:28'),
(3, 'Supervisor', 'Allow Record Modification Permission', '2023-11-19 13:30:28'),
(4, 'Supervisor', 'Allow Record Deletion Permission', '2023-11-19 13:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `ticketFooter`
--

CREATE TABLE `ticketFooter` (
  `clinicName` varchar(255) NOT NULL,
  `footerLine1` varchar(255) NOT NULL,
  `footerLine2` varchar(255) NOT NULL,
  `footerLine3` varchar(255) NOT NULL,
  `labOrOpd` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ticketFooter`
--

INSERT INTO `ticketFooter` (`clinicName`, `footerLine1`, `footerLine2`, `footerLine3`, `labOrOpd`) VALUES
('Zaw Clinic', 'ကျေးဇူးတင်ပါသည်။', '၂၄ နာရီ၀န်ဆောင်မှု', 'Wish you have a good day', 'OPD'),
('Zaw Clinic', 'ကျေးဇူးတင်ပါသည်။', '၂၄ နာရီ၀န်ဆောင်မှု', 'Wish you have a good day', 'LAB');

-- --------------------------------------------------------

--
-- Table structure for table `ticketHeader`
--

CREATE TABLE `ticketHeader` (
  `clinicName` varchar(255) NOT NULL,
  `headerLine1` varchar(255) NOT NULL,
  `headerLine2` varchar(255) NOT NULL,
  `headerLine3` varchar(255) NOT NULL,
  `labOrOpd` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ticketHeader`
--

INSERT INTO `ticketHeader` (`clinicName`, `headerLine1`, `headerLine2`, `headerLine3`, `labOrOpd`) VALUES
('Zaw Clinic', 'Address: No.18, Street ,Mingalar Taung Nyunt, Yangon', 'Phone: 09773468433', 'email: zaw_clinic@gmail.com', 'OPD'),
('Zaw Clinic', 'Address: No.18, Street ,Mingalar Taung Nyunt, Yangon', 'Phone: 09773468433', 'email: zaw_clinic@gmail.com', 'LAB');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UID` int NOT NULL,
  `userCode` varchar(6) DEFAULT NULL,
  `personalCode` varchar(6) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `registeredSince` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UID`, `userCode`, `personalCode`, `password`, `registeredSince`) VALUES
(1, 'U1', 'P01', '123456', '2023-11-19 13:30:28'),
(2, 'U2', 'P02', 'zxc123!@#', '2023-11-19 13:30:28'),
(3, 'U3', 'P03', 'qwe123!@#', '2023-11-19 13:30:28'),
(4, 'U4', 'P04', 'hjk123!@#', '2023-11-19 13:30:28'),
(5, 'U5', 'P05', 'nbm123!@#', '2023-11-19 13:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `userRole`
--

CREATE TABLE `userRole` (
  `UID` int NOT NULL,
  `roleId` int NOT NULL,
  `registeredSince` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userRole`
--

INSERT INTO `userRole` (`UID`, `roleId`, `registeredSince`) VALUES
(1, 1, '2023-11-19 13:30:28'),
(2, 2, '2023-11-19 13:30:28'),
(2, 3, '2023-11-19 13:30:28'),
(3, 2, '2023-11-19 13:30:28'),
(4, 2, '2023-11-19 13:30:28'),
(5, 3, '2023-11-19 13:30:28'),
(5, 4, '2023-11-19 13:30:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clinicDocument`
--
ALTER TABLE `clinicDocument`
  ADD PRIMARY KEY (`DocumentId`);

--
-- Indexes for table `costRate`
--
ALTER TABLE `costRate`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `costCode` (`costCode`);

--
-- Indexes for table `expenseBill`
--
ALTER TABLE `expenseBill`
  ADD PRIMARY KEY (`expenseBillId`),
  ADD KEY `patientCode` (`patientCode`),
  ADD KEY `operatorCode` (`operatorCode`);

--
-- Indexes for table `expenseBillItem`
--
ALTER TABLE `expenseBillItem`
  ADD PRIMARY KEY (`expenseBillItemId`),
  ADD KEY `expenseBillId` (`expenseBillId`),
  ADD KEY `costCode` (`costCode`);

--
-- Indexes for table `incomeBill`
--
ALTER TABLE `incomeBill`
  ADD PRIMARY KEY (`BillId`),
  ADD KEY `patientCode` (`patientCode`),
  ADD KEY `operatorCode` (`operatorCode`);

--
-- Indexes for table `incomeBillItem`
--
ALTER TABLE `incomeBillItem`
  ADD PRIMARY KEY (`incomeBillItemId`),
  ADD KEY `incomeBillId` (`incomeBillId`),
  ADD KEY `costCode` (`costCode`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientId`),
  ADD UNIQUE KEY `patientCode` (`patientCode`);

--
-- Indexes for table `patientCheckInOut`
--
ALTER TABLE `patientCheckInOut`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `patientCode` (`patientCode`),
  ADD KEY `patientVitalId` (`patientVitalId`),
  ADD KEY `doctorCode` (`doctorCode`);

--
-- Indexes for table `patientDocument`
--
ALTER TABLE `patientDocument`
  ADD PRIMARY KEY (`patientDocumentId`);

--
-- Indexes for table `patientLabRecord`
--
ALTER TABLE `patientLabRecord`
  ADD PRIMARY KEY (`labRecordId`),
  ADD KEY `doctorCode` (`doctorCode`),
  ADD KEY `incomeBillId` (`incomeBillId`),
  ADD KEY `patientDocumentId` (`patientDocumentId`);

--
-- Indexes for table `patientVital`
--
ALTER TABLE `patientVital`
  ADD PRIMARY KEY (`patientVitalId`),
  ADD KEY `patientCode` (`patientCode`),
  ADD KEY `operatorCode` (`operatorCode`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `personalCode` (`personalCode`);

--
-- Indexes for table `postingTransaction`
--
ALTER TABLE `postingTransaction`
  ADD KEY `operatorCode` (`operatorCode`),
  ADD KEY `checkedPersonalCode` (`checkedPersonalCode`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`programId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `userCode` (`userCode`),
  ADD UNIQUE KEY `personalCode` (`personalCode`);

--
-- Indexes for table `userRole`
--
ALTER TABLE `userRole`
  ADD PRIMARY KEY (`UID`,`roleId`),
  ADD KEY `roleId` (`roleId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `personId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenseBill`
--
ALTER TABLE `expenseBill`
  ADD CONSTRAINT `expensebill_ibfk_1` FOREIGN KEY (`patientCode`) REFERENCES `patient` (`patientCode`),
  ADD CONSTRAINT `expensebill_ibfk_2` FOREIGN KEY (`operatorCode`) REFERENCES `user` (`userCode`);

--
-- Constraints for table `expenseBillItem`
--
ALTER TABLE `expenseBillItem`
  ADD CONSTRAINT `expensebillitem_ibfk_1` FOREIGN KEY (`expenseBillId`) REFERENCES `expenseBill` (`expenseBillId`),
  ADD CONSTRAINT `expensebillitem_ibfk_2` FOREIGN KEY (`costCode`) REFERENCES `costRate` (`costCode`);

--
-- Constraints for table `incomeBill`
--
ALTER TABLE `incomeBill`
  ADD CONSTRAINT `incomebill_ibfk_1` FOREIGN KEY (`patientCode`) REFERENCES `patient` (`patientCode`),
  ADD CONSTRAINT `incomebill_ibfk_2` FOREIGN KEY (`operatorCode`) REFERENCES `user` (`userCode`);

--
-- Constraints for table `incomeBillItem`
--
ALTER TABLE `incomeBillItem`
  ADD CONSTRAINT `incomebillitem_ibfk_1` FOREIGN KEY (`incomeBillId`) REFERENCES `incomeBill` (`BillId`),
  ADD CONSTRAINT `incomebillitem_ibfk_2` FOREIGN KEY (`costCode`) REFERENCES `costRate` (`costCode`);

--
-- Constraints for table `patientCheckInOut`
--
ALTER TABLE `patientCheckInOut`
  ADD CONSTRAINT `patientcheckinout_ibfk_1` FOREIGN KEY (`patientCode`) REFERENCES `patient` (`patientCode`),
  ADD CONSTRAINT `patientcheckinout_ibfk_2` FOREIGN KEY (`patientVitalId`) REFERENCES `patientVital` (`patientVitalId`),
  ADD CONSTRAINT `patientcheckinout_ibfk_3` FOREIGN KEY (`doctorCode`) REFERENCES `person` (`personalCode`);

--
-- Constraints for table `patientLabRecord`
--
ALTER TABLE `patientLabRecord`
  ADD CONSTRAINT `patientlabrecord_ibfk_1` FOREIGN KEY (`doctorCode`) REFERENCES `person` (`personalCode`),
  ADD CONSTRAINT `patientlabrecord_ibfk_2` FOREIGN KEY (`incomeBillId`) REFERENCES `incomeBill` (`BillId`),
  ADD CONSTRAINT `patientlabrecord_ibfk_3` FOREIGN KEY (`patientDocumentId`) REFERENCES `patientDocument` (`patientDocumentId`);

--
-- Constraints for table `patientVital`
--
ALTER TABLE `patientVital`
  ADD CONSTRAINT `patientvital_ibfk_1` FOREIGN KEY (`patientCode`) REFERENCES `patient` (`patientCode`),
  ADD CONSTRAINT `patientvital_ibfk_2` FOREIGN KEY (`operatorCode`) REFERENCES `user` (`userCode`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`personalCode`) REFERENCES `user` (`personalCode`);

--
-- Constraints for table `postingTransaction`
--
ALTER TABLE `postingTransaction`
  ADD CONSTRAINT `postingtransaction_ibfk_1` FOREIGN KEY (`operatorCode`) REFERENCES `user` (`userCode`),
  ADD CONSTRAINT `postingtransaction_ibfk_2` FOREIGN KEY (`checkedPersonalCode`) REFERENCES `person` (`personalCode`);

--
-- Constraints for table `userRole`
--
ALTER TABLE `userRole`
  ADD CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`),
  ADD CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
