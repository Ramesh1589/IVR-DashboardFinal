-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2017 at 07:35 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `odinvoicecast`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menumaster`
--

CREATE TABLE `tbl_menumaster` (
  `ID` int(11) NOT NULL,
  `sName` varchar(100) NOT NULL,
  `sID` varchar(20) NOT NULL,
  `nCreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sCreatedBy` varchar(100) NOT NULL,
  `nUpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sUpdatedBy` varchar(100) NOT NULL,
  `nIsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menumaster`
--

INSERT INTO `tbl_menumaster` (`ID`, `sName`, `sID`, `nCreatedOn`, `sCreatedBy`, `nUpdatedOn`, `sUpdatedBy`, `nIsActive`) VALUES
(1, 'Dashboard', 'M1', '2017-09-29 05:59:21', '', '2017-09-29 05:59:21', '', 0),
(2, 'Billing', 'M2', '2017-09-29 05:59:21', '', '2017-09-29 05:59:21', '', 0),
(3, 'Call Report', 'M3', '2017-09-29 05:59:21', '', '2017-09-29 05:59:21', '', 0),
(4, 'User Management', 'M4', '2017-09-29 05:59:21', '', '2017-09-29 05:59:21', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menurolemapping`
--

CREATE TABLE `tbl_menurolemapping` (
  `ID` int(11) NOT NULL,
  `sID` varchar(20) NOT NULL,
  `nID` int(11) NOT NULL,
  `sCreatedBy` varchar(100) NOT NULL,
  `nCreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sUpdatedBy` varchar(100) NOT NULL,
  `nUpdatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nIsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menurolemapping`
--

INSERT INTO `tbl_menurolemapping` (`ID`, `sID`, `nID`, `sCreatedBy`, `nCreatedOn`, `sUpdatedBy`, `nUpdatedOn`, `nIsActive`) VALUES
(2, 'M2', 1, '', '2017-09-29 06:24:47', '', '0000-00-00 00:00:00', 0),
(3, 'M3', 1, '', '2017-09-29 06:24:47', '', '0000-00-00 00:00:00', 0),
(4, 'M4', 1, '', '2017-09-29 06:24:47', '', '0000-00-00 00:00:00', 0),
(5, 'M3', 2, '', '2017-09-29 06:24:47', '', '0000-00-00 00:00:00', 0),
(6, 'M1', 3, '', '2017-09-29 06:24:47', '', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rolemaster`
--

CREATE TABLE `tbl_rolemaster` (
  `ID` int(11) NOT NULL,
  `sName` varchar(100) NOT NULL,
  `nID` int(20) NOT NULL,
  `sCreatedBy` varchar(100) NOT NULL,
  `nCreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sUpdatedBy` varchar(100) NOT NULL,
  `nUpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nIsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rolemaster`
--

INSERT INTO `tbl_rolemaster` (`ID`, `sName`, `nID`, `sCreatedBy`, `nCreatedOn`, `sUpdatedBy`, `nUpdatedOn`, `nIsActive`) VALUES
(1, 'Super Admin', 1, '', '2017-09-29 05:35:04', '', '2017-09-29 05:35:04', 0),
(2, 'Admin', 2, '', '2017-09-29 05:35:04', '', '2017-09-29 05:35:04', 0),
(3, 'User', 3, '', '2017-09-29 05:35:04', '', '2017-09-29 05:35:04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tenantmaster`
--

CREATE TABLE `tbl_tenantmaster` (
  `ID` int(11) NOT NULL,
  `sName` varchar(100) NOT NULL,
  `sTID` varchar(20) NOT NULL,
  `nCreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sCreatedBy` varchar(100) NOT NULL,
  `nUodatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sUpdatedBy` varchar(100) NOT NULL,
  `nIsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tenantmaster`
--

INSERT INTO `tbl_tenantmaster` (`ID`, `sName`, `sTID`, `nCreatedOn`, `sCreatedBy`, `nUodatedOn`, `sUpdatedBy`, `nIsActive`) VALUES
(1, 'Arham', 'T1', '2017-09-29 05:51:32', '', '2017-09-29 05:51:32', '', 0),
(2, 'Kotak', 'T2', '2017-09-29 05:51:32', '', '2017-09-29 05:51:32', '', 0),
(3, 'ICICI', 'T3', '2017-09-29 05:51:32', '', '2017-09-29 05:51:32', '', 0),
(4, 'TATA', 'T4', '2017-09-29 05:51:32', '', '2017-09-29 05:51:32', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `ID` int(11) NOT NULL,
  `sID` varchar(20) NOT NULL,
  `sFirstName` varchar(100) NOT NULL,
  `sLastName` varchar(100) NOT NULL,
  `sEmail` varchar(100) NOT NULL,
  `sPassword` varchar(100) NOT NULL,
  `sTID` varchar(20) NOT NULL,
  `nCreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sCreatedBy` varchar(100) NOT NULL,
  `nUpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sUpdatedBy` varchar(100) NOT NULL,
  `nIsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`ID`, `sID`, `sFirstName`, `sLastName`, `sEmail`, `sPassword`, `sTID`, `nCreatedOn`, `sCreatedBy`, `nUpdatedOn`, `sUpdatedBy`, `nIsActive`) VALUES
(1, 'R001', 'ABC', '', '', '', 'T1', '2017-09-28 06:38:52', '', '2017-09-29 05:45:21', '', 0),
(2, 'R002', 'EFG', '', '', '', 'T1', '2017-09-28 06:38:52', '', '2017-09-29 05:45:21', '', 0),
(3, 'R003', 'XYZ', '', '', '', 'T1', '2017-09-28 06:40:24', '', '2017-09-29 05:45:21', '', 0),
(4, 'R004', 'JKL', '', '', '', 'T2', '2017-09-28 06:40:24', '', '2017-09-29 05:45:21', '', 0),
(5, 'R005', 'EDF', '', '', '', 'T2', '2017-09-28 06:41:05', '', '2017-09-29 05:45:21', '', 0),
(6, 'R006', 'PQR', '', '', '', 'T2', '2017-09-28 06:41:05', '', '2017-09-29 05:45:21', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_userrolemapping`
--

CREATE TABLE `tbl_userrolemapping` (
  `ID` int(11) NOT NULL,
  `sID` varchar(20) NOT NULL,
  `nID` int(11) NOT NULL,
  `sCreatedBy` varchar(100) NOT NULL,
  `nCreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sUpdatedBy` varchar(100) NOT NULL,
  `nUpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nIsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_userrolemapping`
--

INSERT INTO `tbl_userrolemapping` (`ID`, `sID`, `nID`, `sCreatedBy`, `nCreatedOn`, `sUpdatedBy`, `nUpdatedOn`, `nIsActive`) VALUES
(1, 'R001', 1, '', '2017-09-29 06:30:30', '', '2017-09-29 06:30:30', 0),
(2, 'R001', 2, '', '2017-09-29 06:30:30', '', '2017-09-29 06:30:30', 0),
(3, 'R001', 3, '', '2017-09-29 06:30:30', '', '2017-09-29 06:30:30', 0),
(4, 'R002', 2, '', '2017-09-29 06:30:30', '', '2017-09-29 06:30:30', 0),
(5, 'R002', 3, '', '2017-09-29 06:30:30', '', '2017-09-29 06:30:30', 0),
(6, 'R003', 3, '', '2017-09-29 06:30:30', '', '2017-09-29 06:30:30', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_menumaster`
--
ALTER TABLE `tbl_menumaster`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sMenuID` (`sID`);

--
-- Indexes for table `tbl_menurolemapping`
--
ALTER TABLE `tbl_menurolemapping`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sMenuID` (`sID`),
  ADD KEY `sMenuID_2` (`sID`),
  ADD KEY `sMenuID_3` (`sID`),
  ADD KEY `sRoleID` (`nID`);

--
-- Indexes for table `tbl_rolemaster`
--
ALTER TABLE `tbl_rolemaster`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `nRoleID` (`nID`),
  ADD KEY `nRoleID_2` (`nID`);

--
-- Indexes for table `tbl_tenantmaster`
--
ALTER TABLE `tbl_tenantmaster`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sTenantID` (`sTID`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sTenantID` (`sTID`),
  ADD KEY `sTenantID_2` (`sTID`),
  ADD KEY `sUserID` (`sID`);

--
-- Indexes for table `tbl_userrolemapping`
--
ALTER TABLE `tbl_userrolemapping`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sUserID` (`sID`),
  ADD KEY `sRoleID` (`nID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_menumaster`
--
ALTER TABLE `tbl_menumaster`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_menurolemapping`
--
ALTER TABLE `tbl_menurolemapping`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_rolemaster`
--
ALTER TABLE `tbl_rolemaster`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_tenantmaster`
--
ALTER TABLE `tbl_tenantmaster`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_userrolemapping`
--
ALTER TABLE `tbl_userrolemapping`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_menurolemapping`
--
ALTER TABLE `tbl_menurolemapping`
  ADD CONSTRAINT `tbl_menurolemapping_ibfk_1` FOREIGN KEY (`sID`) REFERENCES `tbl_menumaster` (`sID`),
  ADD CONSTRAINT `tbl_menurolemapping_ibfk_2` FOREIGN KEY (`nID`) REFERENCES `tbl_rolemaster` (`nID`);

--
-- Constraints for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`sTID`) REFERENCES `tbl_tenantmaster` (`sTID`);

--
-- Constraints for table `tbl_userrolemapping`
--
ALTER TABLE `tbl_userrolemapping`
  ADD CONSTRAINT `tbl_userrolemapping_ibfk_1` FOREIGN KEY (`sID`) REFERENCES `tbl_user` (`sID`),
  ADD CONSTRAINT `tbl_userrolemapping_ibfk_2` FOREIGN KEY (`nID`) REFERENCES `tbl_rolemaster` (`nID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
