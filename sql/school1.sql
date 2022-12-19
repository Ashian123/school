-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2022 at 07:42 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE `audit_trail` (
  `id` int(11) NOT NULL,
  `event_name` varchar(900) DEFAULT NULL,
  `current_user` varchar(900) DEFAULT NULL,
  `audited_time` varchar(900) DEFAULT NULL,
  `user_agent` varchar(900) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `biometric_details`
--

CREATE TABLE `biometric_details` (
  `id` int(11) NOT NULL,
  `cand_id` varchar(45) DEFAULT NULL,
  `cand_name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `Filename` longtext DEFAULT NULL,
  `active_flag` varchar(250) DEFAULT NULL,
  `last_modified_time` varchar(450) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `biometric_details`
--

INSERT INTO `biometric_details` (`id`, `cand_id`, `cand_name`, `category`, `Filename`, `active_flag`, `last_modified_time`) VALUES
(96, 'RAJI387035', 'raji', 'Photo', 'https://gelogicproducts.in/admin/StudentDetails', 'Y', '6/8/2022, 6:22:50 AM'),
(97, 'RAVI186495', 'Ravi', 'Photo', 'https://gelogicproducts.in/admin/StudentDetails', 'Y', '6/8/2022, 6:11:20 AM'),
(99, 'RAJA994556', 'raja', 'Photo', 'https://gelogicproducts.in/admin/StudentDetails', 'Y', '6/8/2022, 7:30:49 AM'),
(100, 'KUMA278041', 'kumaran', 'Photo', 'https://gelogicproducts.in/admin/StudentDetails', 'Y', '6/8/2022, 7:31:36 AM'),
(102, 'RR036985', 'rr', 'Photo', 'https://gelogicproducts.in/admin/StudentDetails', 'Y', '6/8/2022, 11:33:12 PM'),
(104, 'GURU496889', 'Guru', 'Photo', 'https://gelogicproducts.in/admin/StudentDetails', 'Y', '6/12/2022, 9:55:29 PM'),
(105, 'YAZH778643', 'Yazhini', 'Photo', 'https://gelogicproducts.in/admin/StudentDetails', 'Y', '6/13/2022, 10:16:48 PM'),
(106, 'VIMA264807', 'Vimal', 'Photo', 'http://localhost:8000/admin/StudentDetails', 'Y', '8/8/2022, 6:11:49 PM'),
(107, 'TEST125050', 'testuser', 'Photo', 'http://localhost:8000/admin/StudentDetails', 'Y', '8/9/2022, 7:10:33 PM');

-- --------------------------------------------------------

--
-- Table structure for table `blood_group`
--

CREATE TABLE `blood_group` (
  `id` int(11) NOT NULL,
  `blood` varchar(450) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_group`
--

INSERT INTO `blood_group` (`id`, `blood`) VALUES
(1, 'A+'),
(2, 'B+'),
(3, 'AB+'),
(4, 'O+'),
(5, 'A-'),
(6, 'B-'),
(7, 'AB-'),
(8, 'O-');

-- --------------------------------------------------------

--
-- Table structure for table `cand_admission_details`
--

CREATE TABLE `cand_admission_details` (
  `id` int(11) NOT NULL,
  `cand_id` varchar(100) DEFAULT NULL,
  `cand_name` varchar(100) DEFAULT NULL,
  `reg_no` varchar(100) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `course_title` varchar(100) DEFAULT NULL,
  `initial` varchar(45) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `mobile_no` varchar(45) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `active_status` varchar(45) DEFAULT 'Yes',
  `last_modified_time` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cand_admission_details`
--

INSERT INTO `cand_admission_details` (`id`, `cand_id`, `cand_name`, `reg_no`, `course`, `course_title`, `initial`, `father_name`, `mother_name`, `dob`, `gender`, `mobile_no`, `email_id`, `active_status`, `last_modified_time`) VALUES
(137, 'RAJI387035', 'raji', NULL, 'A', '11', 'n', 'nellai', 'rani', '1982-08-04', 'Female', '959465465', 'rajakumaran14599@gmail.com', 'Yes', '6/8/2022, 6:22:50 AM'),
(140, 'RAJA994556', 'raja', NULL, 'A', 'XI', '', '', '', '', '', '', 'rajakumaran14599@gmail.com', 'Yes', '6/8/2022, 7:30:49 AM'),
(141, 'KUMA278041', 'kumaran', NULL, 'A', 'XI', '', '', '', '', '', '', 'rkumaran368@gmail.com', 'Yes', '6/8/2022, 7:31:36 AM'),
(145, 'GURU496889', 'Guru', NULL, 'B', 'XII', '', '', '', '', '', '', '', 'Yes', '6/12/2022, 9:55:29 PM'),
(146, 'YAZH778643', 'Yazhini', NULL, 'A', 'VIII', '', '', '', '', '', '', 'toravi.a@gmail.com', 'Yes', '6/13/2022, 10:16:48 PM'),
(147, 'VIMA264807', 'Vimal', NULL, 'A', 'VIII', 's', 'Kumar', 'Vijaya', '1994-09-29', 'Male', '454546566654', 'test@gmail.com', 'Yes', '8/8/2022, 6:11:49 PM'),
(148, 'TEST125050', 'testuser', NULL, 'A', 'VIII', 't', 'test father', 'test mother', '1995-07-29', 'Male', '232222232', 'test2@gmail.com', 'Yes', '8/9/2022, 7:10:33 PM');

-- --------------------------------------------------------

--
-- Table structure for table `cand_marks_details`
--

CREATE TABLE `cand_marks_details` (
  `id` int(11) NOT NULL,
  `cand_id` varchar(450) DEFAULT NULL,
  `marks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`marks`)),
  `approved` varchar(45) DEFAULT NULL,
  `last_modified_time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `college_details`
--

CREATE TABLE `college_details` (
  `id` int(11) NOT NULL,
  `college_name` longtext DEFAULT NULL,
  `college_place` varchar(250) DEFAULT NULL,
  `college_district` varchar(250) DEFAULT NULL,
  `college_state` varchar(250) DEFAULT NULL,
  `college_pin` varchar(100) DEFAULT NULL,
  `college_phone` varchar(250) DEFAULT NULL,
  `college_mail` varchar(250) DEFAULT NULL,
  `college_logo` longtext DEFAULT NULL,
  `college_t_logo` longtext DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `img_size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `college_details`
--

INSERT INTO `college_details` (`id`, `college_name`, `college_place`, `college_district`, `college_state`, `college_pin`, `college_phone`, `college_mail`, `college_logo`, `college_t_logo`, `file_size`, `img_size`) VALUES
(1, 'MYSCHOOL', 'TIRUNELVELI', 'TIRUNELVELI', 'KERALA', '600095', '546434684', '', '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', 'AShian.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `community_details`
--

CREATE TABLE `community_details` (
  `id` int(11) NOT NULL,
  `community` varchar(450) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `community_details`
--

INSERT INTO `community_details` (`id`, `community`) VALUES
(1, 'Scheduled Castes'),
(2, 'Scheduled Tribes'),
(3, 'Schedule Caste(Pc)'),
(4, 'Scheduled Castes Arundhathiar'),
(5, 'Scheduled Castes Arundhathiar(PC)'),
(6, 'Scheduled Tribes(PC)'),
(7, 'Most Backward Classes(PC)'),
(8, 'Denotified Communities(PC)'),
(9, 'Backward Classes(PC)'),
(10, 'Backward Classes Muslims(PC)'),
(11, 'Other Backward Classes'),
(12, 'Other Backward Classes(PC)'),
(13, 'Others'),
(14, 'Others(PC)'),
(15, 'Most Backward Classess'),
(16, 'Denotified Communities'),
(17, 'Backward Classes'),
(18, 'Backward Classes Muslims');

-- --------------------------------------------------------

--
-- Table structure for table `course_details`
--

CREATE TABLE `course_details` (
  `id` int(11) NOT NULL,
  `course_title` varchar(900) DEFAULT NULL,
  `course` varchar(900) DEFAULT NULL,
  `teacher` varchar(900) DEFAULT NULL,
  `t_data` text DEFAULT NULL,
  `t_design` text DEFAULT NULL,
  `all_teacher` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`all_teacher`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_details`
--

INSERT INTO `course_details` (`id`, `course_title`, `course`, `teacher`, `t_data`, `t_design`, `all_teacher`) VALUES
(20, 'XI', 'A', 'Ajay Kumar', '[\"sssss\",\"dddd\",\"dfd\",\"ddd\",\"ddd\",\"aaaaaaa\",\"aaaaaaaa\",\"asdsdsdsd\",\"5\",\"8\",\"\",\"ggggg\",\"\",\"2\",\"3\",\"6\"]', ' <div class=\"card\"><div class=\"card-body\"><h4 class=\"card-title\">Time Table</h4>\n                    <p class=\"card-description\">Fill Details</p><div class=\"table-responsive pt-3\">\n                    <form id=\"t-table\"><table><thead><tr><td><p>Time</p></td><td><input class=\"form-control th1\" name=\"th1\" placeholder=\"Period: 1 Time\"></td><td><input class=\"form-control th2\" name=\"th2\" placeholder=\"Period: 2 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th3\" name=\"th3\" placeholder=\"Period: 3 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th4\" name=\"th4\" placeholder=\"Period: 4 Time\"></td><td><input class=\"form-control th5\" name=\"th5\" placeholder=\"Period: 5 Time\"></td><td><input class=\"form-control th6\" name=\"th6\" placeholder=\"Period: 6 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th7\" name=\"th7\" placeholder=\"Period: 7 Time\"></td><td><input class=\"form-control th8\" name=\"th8\" placeholder=\"Period: 8 Time\"></td></tr></thead><tbody><tr><td><p>Mon</p></td><td><input class=\"form-control popoption td01\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td01&#39;)\" readonly=\"\" name=\"td01\"></td><td><input class=\"form-control popoption td02\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td02&#39;)\" readonly=\"\" name=\"td02\"></td><td class=\"break\" rowspan=\"5\" style=\"\">\n                <textarea name=\"break2\" id=\"break2\" class=\"form-control\" cols=\"\" rows=\"6\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td03\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td03&#39;)\" readonly=\"\" name=\"td03\"></td><td class=\"break\" rowspan=\"5\" style=\"\">\n                <textarea name=\"break3\" id=\"break3\" class=\"form-control\" cols=\"\" rows=\"6\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td04\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td04&#39;)\" readonly=\"\" name=\"td04\"></td><td><input class=\"form-control popoption td05\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td05&#39;)\" readonly=\"\" name=\"td05\"></td><td><input class=\"form-control popoption td06\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td06&#39;)\" readonly=\"\" name=\"td06\"></td><td class=\"break\" rowspan=\"5\" style=\"\">\n                <textarea name=\"break6\" id=\"break6\" class=\"form-control\" cols=\"\" rows=\"6\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td07\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td07&#39;)\" readonly=\"\" name=\"td07\"></td><td><input class=\"form-control popoption td08\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td08&#39;)\" readonly=\"\" name=\"td08\"></td></tr><tr><td><p>Tue</p></td><td><input class=\"form-control popoption td11\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td11&#39;)\" readonly=\"\" name=\"td11\"></td><td><input class=\"form-control popoption td12\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td12&#39;)\" readonly=\"\" name=\"td12\"></td><td><input class=\"form-control popoption td13\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td13&#39;)\" readonly=\"\" name=\"td13\"></td><td><input class=\"form-control popoption td14\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td14&#39;)\" readonly=\"\" name=\"td14\"></td><td><input class=\"form-control popoption td15\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td15&#39;)\" readonly=\"\" name=\"td15\"></td><td><input class=\"form-control popoption td16\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td16&#39;)\" readonly=\"\" name=\"td16\"></td><td><input class=\"form-control popoption td17\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td17&#39;)\" readonly=\"\" name=\"td17\"></td><td><input class=\"form-control popoption td18\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td18&#39;)\" readonly=\"\" name=\"td18\"></td></tr><tr><td><p>Wed</p></td><td><input class=\"form-control popoption td21\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td21&#39;)\" readonly=\"\" name=\"td21\"></td><td><input class=\"form-control popoption td22\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td22&#39;)\" readonly=\"\" name=\"td22\"></td><td><input class=\"form-control popoption td23\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td23&#39;)\" readonly=\"\" name=\"td23\"></td><td><input class=\"form-control popoption td24\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td24&#39;)\" readonly=\"\" name=\"td24\"></td><td><input class=\"form-control popoption td25\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td25&#39;)\" readonly=\"\" name=\"td25\"></td><td><input class=\"form-control popoption td26\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td26&#39;)\" readonly=\"\" name=\"td26\"></td><td><input class=\"form-control popoption td27\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td27&#39;)\" readonly=\"\" name=\"td27\"></td><td><input class=\"form-control popoption td28\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td28&#39;)\" readonly=\"\" name=\"td28\"></td></tr><tr><td><p>Thu</p></td><td><input class=\"form-control popoption td31\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td31&#39;)\" readonly=\"\" name=\"td31\"></td><td><input class=\"form-control popoption td32\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td32&#39;)\" readonly=\"\" name=\"td32\"></td><td><input class=\"form-control popoption td33\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td33&#39;)\" readonly=\"\" name=\"td33\"></td><td><input class=\"form-control popoption td34\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td34&#39;)\" readonly=\"\" name=\"td34\"></td><td><input class=\"form-control popoption td35\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td35&#39;)\" readonly=\"\" name=\"td35\"></td><td><input class=\"form-control popoption td36\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td36&#39;)\" readonly=\"\" name=\"td36\"></td><td><input class=\"form-control popoption td37\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td37&#39;)\" readonly=\"\" name=\"td37\"></td><td><input class=\"form-control popoption td38\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td38&#39;)\" readonly=\"\" name=\"td38\"></td></tr><tr><td><p>Fri</p></td><td><input class=\"form-control popoption td41\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td41&#39;)\" readonly=\"\" name=\"td41\"></td><td><input class=\"form-control popoption td42\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td42&#39;)\" readonly=\"\" name=\"td42\"></td><td><input class=\"form-control popoption td43\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td43&#39;)\" readonly=\"\" name=\"td43\"></td><td><input class=\"form-control popoption td44\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td44&#39;)\" readonly=\"\" name=\"td44\"></td><td><input class=\"form-control popoption td45\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td45&#39;)\" readonly=\"\" name=\"td45\"></td><td><input class=\"form-control popoption td46\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td46&#39;)\" readonly=\"\" name=\"td46\"></td><td><input class=\"form-control popoption td47\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td47&#39;)\" readonly=\"\" name=\"td47\"></td><td><input class=\"form-control popoption td48\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td48&#39;)\" readonly=\"\" name=\"td48\"></td></tr></tbody></table></form><div class=\"form-group mt-3\" style=\"float:right\">   \n                            <button type=\"button\" class=\"btn btn-success btn-icon-text\" onclick=\"save_table()\">\n                              <i class=\"mdi mdi-table-edit btn-icon-prepend\"></i>\n                               Save Table\n                            </button>\n                          </div> </div> </div> </div>  ', '[\"Ajay Kumar\", \"Balaji\", \"Ram\", \"Rajkumar\", \"kumaran\"]'),
(21, 'XII', 'B', 'Ravi', '[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"5\",\"8\",\"\",\"\",\"\",\"2\",\"4\",\"3\"]', ' <div class=\"card\"><div class=\"card-body\"><h4 class=\"card-title\">Time Table</h4>\n                    <p class=\"card-description\">Fill Details</p><div class=\"table-responsive pt-3\">\n                    <form id=\"t-table\"><table><thead><tr><td><p>Time</p></td><td><input class=\"form-control th1\" name=\"th1\" placeholder=\"Period: 1 Time\"></td><td><input class=\"form-control th2\" name=\"th2\" placeholder=\"Period: 2 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th3\" name=\"th3\" placeholder=\"Period: 3 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th4\" name=\"th4\" placeholder=\"Period: 4 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th5\" name=\"th5\" placeholder=\"Period: 5 Time\"></td><td><input class=\"form-control th6\" name=\"th6\" placeholder=\"Period: 6 Time\"></td><td><input class=\"form-control th7\" name=\"th7\" placeholder=\"Period: 7 Time\"></td><td><input class=\"form-control th8\" name=\"th8\" placeholder=\"Period: 8 Time\"></td></tr></thead><tbody><tr><td><p>Mon</p></td><td><input class=\"form-control popoption td01\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td01&#39;)\" readonly=\"\" name=\"td01\"></td><td><input class=\"form-control popoption td02\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td02&#39;)\" readonly=\"\" name=\"td02\"></td><td class=\"break\" rowspan=\"5\" style=\"\">\n                <textarea name=\"break2\" id=\"break2\" class=\"form-control\" cols=\"\" rows=\"6\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td03\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td03&#39;)\" readonly=\"\" name=\"td03\"></td><td class=\"break\" rowspan=\"5\" style=\"\">\n                <textarea name=\"break3\" id=\"break3\" class=\"form-control\" cols=\"\" rows=\"6\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td04\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td04&#39;)\" readonly=\"\" name=\"td04\"></td><td class=\"break\" rowspan=\"5\" style=\"\">\n                <textarea name=\"break4\" id=\"break4\" class=\"form-control\" cols=\"\" rows=\"6\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td05\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td05&#39;)\" readonly=\"\" name=\"td05\"></td><td><input class=\"form-control popoption td06\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td06&#39;)\" readonly=\"\" name=\"td06\"></td><td><input class=\"form-control popoption td07\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td07&#39;)\" readonly=\"\" name=\"td07\"></td><td><input class=\"form-control popoption td08\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td08&#39;)\" readonly=\"\" name=\"td08\"></td></tr><tr><td><p>Tue</p></td><td><input class=\"form-control popoption td11\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td11&#39;)\" readonly=\"\" name=\"td11\"></td><td><input class=\"form-control popoption td12\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td12&#39;)\" readonly=\"\" name=\"td12\"></td><td><input class=\"form-control popoption td13\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td13&#39;)\" readonly=\"\" name=\"td13\"></td><td><input class=\"form-control popoption td14\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td14&#39;)\" readonly=\"\" name=\"td14\"></td><td><input class=\"form-control popoption td15\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td15&#39;)\" readonly=\"\" name=\"td15\"></td><td><input class=\"form-control popoption td16\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td16&#39;)\" readonly=\"\" name=\"td16\"></td><td><input class=\"form-control popoption td17\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td17&#39;)\" readonly=\"\" name=\"td17\"></td><td><input class=\"form-control popoption td18\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td18&#39;)\" readonly=\"\" name=\"td18\"></td></tr><tr><td><p>Wed</p></td><td><input class=\"form-control popoption td21\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td21&#39;)\" readonly=\"\" name=\"td21\"></td><td><input class=\"form-control popoption td22\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td22&#39;)\" readonly=\"\" name=\"td22\"></td><td><input class=\"form-control popoption td23\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td23&#39;)\" readonly=\"\" name=\"td23\"></td><td><input class=\"form-control popoption td24\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td24&#39;)\" readonly=\"\" name=\"td24\"></td><td><input class=\"form-control popoption td25\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td25&#39;)\" readonly=\"\" name=\"td25\"></td><td><input class=\"form-control popoption td26\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td26&#39;)\" readonly=\"\" name=\"td26\"></td><td><input class=\"form-control popoption td27\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td27&#39;)\" readonly=\"\" name=\"td27\"></td><td><input class=\"form-control popoption td28\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td28&#39;)\" readonly=\"\" name=\"td28\"></td></tr><tr><td><p>Thu</p></td><td><input class=\"form-control popoption td31\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td31&#39;)\" readonly=\"\" name=\"td31\"></td><td><input class=\"form-control popoption td32\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td32&#39;)\" readonly=\"\" name=\"td32\"></td><td><input class=\"form-control popoption td33\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td33&#39;)\" readonly=\"\" name=\"td33\"></td><td><input class=\"form-control popoption td34\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td34&#39;)\" readonly=\"\" name=\"td34\"></td><td><input class=\"form-control popoption td35\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td35&#39;)\" readonly=\"\" name=\"td35\"></td><td><input class=\"form-control popoption td36\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td36&#39;)\" readonly=\"\" name=\"td36\"></td><td><input class=\"form-control popoption td37\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td37&#39;)\" readonly=\"\" name=\"td37\"></td><td><input class=\"form-control popoption td38\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td38&#39;)\" readonly=\"\" name=\"td38\"></td></tr><tr><td><p>Fri</p></td><td><input class=\"form-control popoption td41\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td41&#39;)\" readonly=\"\" name=\"td41\"></td><td><input class=\"form-control popoption td42\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td42&#39;)\" readonly=\"\" name=\"td42\"></td><td><input class=\"form-control popoption td43\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td43&#39;)\" readonly=\"\" name=\"td43\"></td><td><input class=\"form-control popoption td44\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td44&#39;)\" readonly=\"\" name=\"td44\"></td><td><input class=\"form-control popoption td45\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td45&#39;)\" readonly=\"\" name=\"td45\"></td><td><input class=\"form-control popoption td46\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td46&#39;)\" readonly=\"\" name=\"td46\"></td><td><input class=\"form-control popoption td47\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td47&#39;)\" readonly=\"\" name=\"td47\"></td><td><input class=\"form-control popoption td48\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td48&#39;)\" readonly=\"\" name=\"td48\"></td></tr></tbody></table></form><div class=\"form-group mt-3\" style=\"float:right\">   \n                            <button type=\"button\" class=\"btn btn-success btn-icon-text\" onclick=\"save_table()\">\n                              <i class=\"mdi mdi-table-edit btn-icon-prepend\"></i>\n                               Save Table\n                            </button>\n                          </div> </div> </div> </div>  ', '[\"Balaji\",\"Ram\",\"Rajkumar\",\"latha\"]'),
(23, 'x', 'b', 'Ram', '[\"1-2\",\"dddd\",\"sdfs\",\"sdfsd\",\"sss\",\"dfdfdfd\",\"6\",\"6\",\"0000\",\"hhhh\",\"\",\"2\",\"4\",\"6\"]', ' <div class=\"card\"><div class=\"card-body\"><h4 class=\"card-title\">Time Table</h4>\n                    <p class=\"card-description\">Fill Details</p><div class=\"table-responsive pt-3\">\n                    <form id=\"t-table\"><table><thead><tr><td><p>Time</p></td><td><input class=\"form-control th1\" name=\"th1\" placeholder=\"Period: 1 Time\"></td><td><input class=\"form-control th2\" name=\"th2\" placeholder=\"Period: 2 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th3\" name=\"th3\" placeholder=\"Period: 3 Time\"></td><td><input class=\"form-control th4\" name=\"th4\" placeholder=\"Period: 4 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th5\" name=\"th5\" placeholder=\"Period: 5 Time\"></td><td><input class=\"form-control th6\" name=\"th6\" placeholder=\"Period: 6 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td></tr></thead><tbody><tr><td><p>Mon</p></td><td><input class=\"form-control popoption td01\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td01&#39;)\" readonly=\"\" name=\"td01\"></td><td><input class=\"form-control popoption td02\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td02&#39;)\" readonly=\"\" name=\"td02\"></td><td class=\"break\" rowspan=\"6\" style=\"\">\n                <textarea name=\"break2\" id=\"break2\" class=\"form-control\" cols=\"\" rows=\"7\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td03\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td03&#39;)\" readonly=\"\" name=\"td03\"></td><td><input class=\"form-control popoption td04\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td04&#39;)\" readonly=\"\" name=\"td04\"></td><td class=\"break\" rowspan=\"6\" style=\"\">\n                <textarea name=\"break4\" id=\"break4\" class=\"form-control\" cols=\"\" rows=\"7\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td05\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td05&#39;)\" readonly=\"\" name=\"td05\"></td><td><input class=\"form-control popoption td06\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td06&#39;)\" readonly=\"\" name=\"td06\"></td><td class=\"break\" rowspan=\"6\" style=\"\">\n                <textarea name=\"break6\" id=\"break6\" class=\"form-control\" cols=\"\" rows=\"7\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td></tr><tr><td><p>Tue</p></td><td><input class=\"form-control popoption td11\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td11&#39;)\" readonly=\"\" name=\"td11\"></td><td><input class=\"form-control popoption td12\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td12&#39;)\" readonly=\"\" name=\"td12\"></td><td><input class=\"form-control popoption td13\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td13&#39;)\" readonly=\"\" name=\"td13\"></td><td><input class=\"form-control popoption td14\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td14&#39;)\" readonly=\"\" name=\"td14\"></td><td><input class=\"form-control popoption td15\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td15&#39;)\" readonly=\"\" name=\"td15\"></td><td><input class=\"form-control popoption td16\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td16&#39;)\" readonly=\"\" name=\"td16\"></td></tr><tr><td><p>Wed</p></td><td><input class=\"form-control popoption td21\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td21&#39;)\" readonly=\"\" name=\"td21\"></td><td><input class=\"form-control popoption td22\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td22&#39;)\" readonly=\"\" name=\"td22\"></td><td><input class=\"form-control popoption td23\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td23&#39;)\" readonly=\"\" name=\"td23\"></td><td><input class=\"form-control popoption td24\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td24&#39;)\" readonly=\"\" name=\"td24\"></td><td><input class=\"form-control popoption td25\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td25&#39;)\" readonly=\"\" name=\"td25\"></td><td><input class=\"form-control popoption td26\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td26&#39;)\" readonly=\"\" name=\"td26\"></td></tr><tr><td><p>Thu</p></td><td><input class=\"form-control popoption td31\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td31&#39;)\" readonly=\"\" name=\"td31\"></td><td><input class=\"form-control popoption td32\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td32&#39;)\" readonly=\"\" name=\"td32\"></td><td><input class=\"form-control popoption td33\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td33&#39;)\" readonly=\"\" name=\"td33\"></td><td><input class=\"form-control popoption td34\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td34&#39;)\" readonly=\"\" name=\"td34\"></td><td><input class=\"form-control popoption td35\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td35&#39;)\" readonly=\"\" name=\"td35\"></td><td><input class=\"form-control popoption td36\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td36&#39;)\" readonly=\"\" name=\"td36\"></td></tr><tr><td><p>Fri</p></td><td><input class=\"form-control popoption td41\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td41&#39;)\" readonly=\"\" name=\"td41\"></td><td><input class=\"form-control popoption td42\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td42&#39;)\" readonly=\"\" name=\"td42\"></td><td><input class=\"form-control popoption td43\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td43&#39;)\" readonly=\"\" name=\"td43\"></td><td><input class=\"form-control popoption td44\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td44&#39;)\" readonly=\"\" name=\"td44\"></td><td><input class=\"form-control popoption td45\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td45&#39;)\" readonly=\"\" name=\"td45\"></td><td><input class=\"form-control popoption td46\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td46&#39;)\" readonly=\"\" name=\"td46\"></td></tr><tr><td><p>Sat</p></td><td><input class=\"form-control popoption td51\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td51&#39;)\" readonly=\"\" name=\"td51\"></td><td><input class=\"form-control popoption td52\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td52&#39;)\" readonly=\"\" name=\"td52\"></td><td><input class=\"form-control popoption td53\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td53&#39;)\" readonly=\"\" name=\"td53\"></td><td><input class=\"form-control popoption td54\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td54&#39;)\" readonly=\"\" name=\"td54\"></td><td><input class=\"form-control popoption td55\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td55&#39;)\" readonly=\"\" name=\"td55\"></td><td><input class=\"form-control popoption td56\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td56&#39;)\" readonly=\"\" name=\"td56\"></td></tr></tbody></table></form><div class=\"form-group mt-3\" style=\"float:right\">   \n                            <button type=\"button\" class=\"btn btn-success btn-icon-text\" onclick=\"save_table()\">\n                              <i class=\"mdi mdi-table-edit btn-icon-prepend\"></i>\n                               Save Table\n                            </button>\n                          </div> </div> </div> </div>  ', '[\"Ajay Kumar\",\"Ram\",\"Rajkumar\",\"mala\"]'),
(24, 'ix', 'c', 'latha', '', '', '[\"Ajay Kumar\",\"Balaji\",\"Rajkumar\"]'),
(25, 'VIII', 'A', 'kumaran', '[\"1-2\",\"1-2\",\"1-2\",\"1-2\",\"1-2\",\"1-2\",\"1-2\",\"1-2\",\"5\",\"8\",\"br1\",\"br1\",\"br4\",\"2\",\"3\",\"6\"]', ' <div class=\"card\"><div class=\"card-body\"><h4 class=\"card-title\">Time Table</h4>\n                    <p class=\"card-description\">Fill Details</p><div class=\"table-responsive pt-3\">\n                    <form id=\"t-table\"><table><thead><tr><td><p>Time</p></td><td><input class=\"form-control th1\" name=\"th1\" placeholder=\"Period: 1 Time\"></td><td><input class=\"form-control th2\" name=\"th2\" placeholder=\"Period: 2 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th3\" name=\"th3\" placeholder=\"Period: 3 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th4\" name=\"th4\" placeholder=\"Period: 4 Time\"></td><td><input class=\"form-control th5\" name=\"th5\" placeholder=\"Period: 5 Time\"></td><td><input class=\"form-control th6\" name=\"th6\" placeholder=\"Period: 6 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th7\" name=\"th7\" placeholder=\"Period: 7 Time\"></td><td><input class=\"form-control th8\" name=\"th8\" placeholder=\"Period: 8 Time\"></td></tr></thead><tbody><tr><td><p>Mon</p></td><td><input class=\"form-control popoption td01\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td01&#39;)\" readonly=\"\" name=\"td01\"></td><td><input class=\"form-control popoption td02\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td02&#39;)\" readonly=\"\" name=\"td02\"></td><td class=\"break\" rowspan=\"5\" style=\"\">\n                <textarea name=\"break2\" id=\"break2\" class=\"form-control\" cols=\"\" rows=\"6\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td03\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td03&#39;)\" readonly=\"\" name=\"td03\"></td><td class=\"break\" rowspan=\"5\" style=\"\">\n                <textarea name=\"break3\" id=\"break3\" class=\"form-control\" cols=\"\" rows=\"6\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td04\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td04&#39;)\" readonly=\"\" name=\"td04\"></td><td><input class=\"form-control popoption td05\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td05&#39;)\" readonly=\"\" name=\"td05\"></td><td><input class=\"form-control popoption td06\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td06&#39;)\" readonly=\"\" name=\"td06\"></td><td class=\"break\" rowspan=\"5\" style=\"\">\n                <textarea name=\"break6\" id=\"break6\" class=\"form-control\" cols=\"\" rows=\"6\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td07\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td07&#39;)\" readonly=\"\" name=\"td07\"></td><td><input class=\"form-control popoption td08\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td08&#39;)\" readonly=\"\" name=\"td08\"></td></tr><tr><td><p>Tue</p></td><td><input class=\"form-control popoption td11\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td11&#39;)\" readonly=\"\" name=\"td11\"></td><td><input class=\"form-control popoption td12\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td12&#39;)\" readonly=\"\" name=\"td12\"></td><td><input class=\"form-control popoption td13\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td13&#39;)\" readonly=\"\" name=\"td13\"></td><td><input class=\"form-control popoption td14\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td14&#39;)\" readonly=\"\" name=\"td14\"></td><td><input class=\"form-control popoption td15\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td15&#39;)\" readonly=\"\" name=\"td15\"></td><td><input class=\"form-control popoption td16\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td16&#39;)\" readonly=\"\" name=\"td16\"></td><td><input class=\"form-control popoption td17\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td17&#39;)\" readonly=\"\" name=\"td17\"></td><td><input class=\"form-control popoption td18\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td18&#39;)\" readonly=\"\" name=\"td18\"></td></tr><tr><td><p>Wed</p></td><td><input class=\"form-control popoption td21\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td21&#39;)\" readonly=\"\" name=\"td21\"></td><td><input class=\"form-control popoption td22\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td22&#39;)\" readonly=\"\" name=\"td22\"></td><td><input class=\"form-control popoption td23\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td23&#39;)\" readonly=\"\" name=\"td23\"></td><td><input class=\"form-control popoption td24\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td24&#39;)\" readonly=\"\" name=\"td24\"></td><td><input class=\"form-control popoption td25\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td25&#39;)\" readonly=\"\" name=\"td25\"></td><td><input class=\"form-control popoption td26\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td26&#39;)\" readonly=\"\" name=\"td26\"></td><td><input class=\"form-control popoption td27\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td27&#39;)\" readonly=\"\" name=\"td27\"></td><td><input class=\"form-control popoption td28\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td28&#39;)\" readonly=\"\" name=\"td28\"></td></tr><tr><td><p>Thu</p></td><td><input class=\"form-control popoption td31\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td31&#39;)\" readonly=\"\" name=\"td31\"></td><td><input class=\"form-control popoption td32\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td32&#39;)\" readonly=\"\" name=\"td32\"></td><td><input class=\"form-control popoption td33\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td33&#39;)\" readonly=\"\" name=\"td33\"></td><td><input class=\"form-control popoption td34\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td34&#39;)\" readonly=\"\" name=\"td34\"></td><td><input class=\"form-control popoption td35\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td35&#39;)\" readonly=\"\" name=\"td35\"></td><td><input class=\"form-control popoption td36\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td36&#39;)\" readonly=\"\" name=\"td36\"></td><td><input class=\"form-control popoption td37\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td37&#39;)\" readonly=\"\" name=\"td37\"></td><td><input class=\"form-control popoption td38\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td38&#39;)\" readonly=\"\" name=\"td38\"></td></tr><tr><td><p>Fri</p></td><td><input class=\"form-control popoption td41\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td41&#39;)\" readonly=\"\" name=\"td41\"></td><td><input class=\"form-control popoption td42\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td42&#39;)\" readonly=\"\" name=\"td42\"></td><td><input class=\"form-control popoption td43\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td43&#39;)\" readonly=\"\" name=\"td43\"></td><td><input class=\"form-control popoption td44\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td44&#39;)\" readonly=\"\" name=\"td44\"></td><td><input class=\"form-control popoption td45\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td45&#39;)\" readonly=\"\" name=\"td45\"></td><td><input class=\"form-control popoption td46\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td46&#39;)\" readonly=\"\" name=\"td46\"></td><td><input class=\"form-control popoption td47\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td47&#39;)\" readonly=\"\" name=\"td47\"></td><td><input class=\"form-control popoption td48\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td48&#39;)\" readonly=\"\" name=\"td48\"></td></tr></tbody></table></form><div class=\"form-group mt-3\" style=\"float:right\">   \n                            <button type=\"button\" class=\"btn btn-success btn-icon-text\" onclick=\"save_table()\">\n                              <i class=\"mdi mdi-table-edit btn-icon-prepend\"></i>\n                               Save Table\n                            </button>\n                          </div> </div> </div> </div>  ', '[\"Ajay Kumar\",\"Balaji\",\"Ram\",\"Rajkumar\"]'),
(28, 'v', 'd', 'mala', NULL, NULL, '[]'),
(30, 'II', 'f', 'latha', NULL, NULL, '[]'),
(31, 'II', 'g', 'latha', NULL, NULL, '[]'),
(32, 'I', 'B', 'yyy', '[\"\",\"\",\"\",\"\",\"\",\"\",\"6\",\"6\",\"\",\"\",\"\",\"2\",\"4\",\"6\"]', ' <div class=\"card\"><div class=\"card-body\"><h4 class=\"card-title\">Time Table</h4>\n                    <p class=\"card-description\">Fill Details</p><div class=\"table-responsive pt-3\">\n                    <form id=\"t-table\"><table><thead><tr><td><p>Time</p></td><td><input class=\"form-control th1\" name=\"th1\" placeholder=\"Period: 1 Time\"></td><td><input class=\"form-control th2\" name=\"th2\" placeholder=\"Period: 2 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th3\" name=\"th3\" placeholder=\"Period: 3 Time\"></td><td><input class=\"form-control th4\" name=\"th4\" placeholder=\"Period: 4 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th5\" name=\"th5\" placeholder=\"Period: 5 Time\"></td><td><input class=\"form-control th6\" name=\"th6\" placeholder=\"Period: 6 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td></tr></thead><tbody><tr><td><p>Mon</p></td><td><input class=\"form-control popoption td01\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td01&#39;)\" readonly=\"\" name=\"td01\"></td><td><input class=\"form-control popoption td02\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td02&#39;)\" readonly=\"\" name=\"td02\"></td><td class=\"break\" rowspan=\"6\" style=\"\">\n                <textarea name=\"break2\" id=\"break2\" class=\"form-control\" cols=\"\" rows=\"7\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td03\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td03&#39;)\" readonly=\"\" name=\"td03\"></td><td><input class=\"form-control popoption td04\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td04&#39;)\" readonly=\"\" name=\"td04\"></td><td class=\"break\" rowspan=\"6\" style=\"\">\n                <textarea name=\"break4\" id=\"break4\" class=\"form-control\" cols=\"\" rows=\"7\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td05\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td05&#39;)\" readonly=\"\" name=\"td05\"></td><td><input class=\"form-control popoption td06\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td06&#39;)\" readonly=\"\" name=\"td06\"></td><td class=\"break\" rowspan=\"6\" style=\"\">\n                <textarea name=\"break6\" id=\"break6\" class=\"form-control\" cols=\"\" rows=\"7\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td></tr><tr><td><p>Tue</p></td><td><input class=\"form-control popoption td11\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td11&#39;)\" readonly=\"\" name=\"td11\"></td><td><input class=\"form-control popoption td12\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td12&#39;)\" readonly=\"\" name=\"td12\"></td><td><input class=\"form-control popoption td13\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td13&#39;)\" readonly=\"\" name=\"td13\"></td><td><input class=\"form-control popoption td14\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td14&#39;)\" readonly=\"\" name=\"td14\"></td><td><input class=\"form-control popoption td15\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td15&#39;)\" readonly=\"\" name=\"td15\"></td><td><input class=\"form-control popoption td16\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td16&#39;)\" readonly=\"\" name=\"td16\"></td></tr><tr><td><p>Wed</p></td><td><input class=\"form-control popoption td21\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td21&#39;)\" readonly=\"\" name=\"td21\"></td><td><input class=\"form-control popoption td22\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td22&#39;)\" readonly=\"\" name=\"td22\"></td><td><input class=\"form-control popoption td23\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td23&#39;)\" readonly=\"\" name=\"td23\"></td><td><input class=\"form-control popoption td24\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td24&#39;)\" readonly=\"\" name=\"td24\"></td><td><input class=\"form-control popoption td25\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td25&#39;)\" readonly=\"\" name=\"td25\"></td><td><input class=\"form-control popoption td26\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td26&#39;)\" readonly=\"\" name=\"td26\"></td></tr><tr><td><p>Thu</p></td><td><input class=\"form-control popoption td31\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td31&#39;)\" readonly=\"\" name=\"td31\"></td><td><input class=\"form-control popoption td32\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td32&#39;)\" readonly=\"\" name=\"td32\"></td><td><input class=\"form-control popoption td33\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td33&#39;)\" readonly=\"\" name=\"td33\"></td><td><input class=\"form-control popoption td34\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td34&#39;)\" readonly=\"\" name=\"td34\"></td><td><input class=\"form-control popoption td35\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td35&#39;)\" readonly=\"\" name=\"td35\"></td><td><input class=\"form-control popoption td36\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td36&#39;)\" readonly=\"\" name=\"td36\"></td></tr><tr><td><p>Fri</p></td><td><input class=\"form-control popoption td41\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td41&#39;)\" readonly=\"\" name=\"td41\"></td><td><input class=\"form-control popoption td42\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td42&#39;)\" readonly=\"\" name=\"td42\"></td><td><input class=\"form-control popoption td43\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td43&#39;)\" readonly=\"\" name=\"td43\"></td><td><input class=\"form-control popoption td44\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td44&#39;)\" readonly=\"\" name=\"td44\"></td><td><input class=\"form-control popoption td45\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td45&#39;)\" readonly=\"\" name=\"td45\"></td><td><input class=\"form-control popoption td46\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td46&#39;)\" readonly=\"\" name=\"td46\"></td></tr><tr><td><p>Sat</p></td><td><input class=\"form-control popoption td51\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td51&#39;)\" readonly=\"\" name=\"td51\"></td><td><input class=\"form-control popoption td52\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td52&#39;)\" readonly=\"\" name=\"td52\"></td><td><input class=\"form-control popoption td53\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td53&#39;)\" readonly=\"\" name=\"td53\"></td><td><input class=\"form-control popoption td54\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td54&#39;)\" readonly=\"\" name=\"td54\"></td><td><input class=\"form-control popoption td55\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td55&#39;)\" readonly=\"\" name=\"td55\"></td><td><input class=\"form-control popoption td56\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td56&#39;)\" readonly=\"\" name=\"td56\"></td></tr></tbody></table></form><div class=\"form-group mt-3\" style=\"float:right\">   \n                            <button type=\"button\" class=\"btn btn-success btn-icon-text\" onclick=\"save_table()\">\n                              <i class=\"mdi mdi-table-edit btn-icon-prepend\"></i>\n                               Save Table\n                            </button>\n                          </div> </div> </div> </div>  ', '[\"Balaji\", \"Rajkumar\", \"mala\"]'),
(33, 'I', 'A', 'Ram', '[\"\",\"\",\"\",\"\",\"\",\"\",\"6\",\"6\",\"\",\"\",\"\",\"2\",\"4\",\"6\"]', ' <div class=\"card\"><div class=\"card-body\"><h4 class=\"card-title\">Time Table</h4>\n                    <p class=\"card-description\">Fill Details</p><div class=\"table-responsive pt-3\">\n                    <form id=\"t-table\"><table><thead><tr><td><p>Time</p></td><td><input class=\"form-control th1\" name=\"th1\" placeholder=\"Period: 1 Time\"></td><td><input class=\"form-control th2\" name=\"th2\" placeholder=\"Period: 2 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th3\" name=\"th3\" placeholder=\"Period: 3 Time\"></td><td><input class=\"form-control th4\" name=\"th4\" placeholder=\"Period: 4 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th5\" name=\"th5\" placeholder=\"Period: 5 Time\"></td><td><input class=\"form-control th6\" name=\"th6\" placeholder=\"Period: 6 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td></tr></thead><tbody><tr><td><p>Mon</p></td><td><input class=\"form-control popoption td01\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td01&#39;)\" readonly=\"\" name=\"td01\"></td><td><input class=\"form-control popoption td02\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td02&#39;)\" readonly=\"\" name=\"td02\"></td><td class=\"break\" rowspan=\"6\" style=\"\">\n                <textarea name=\"break2\" id=\"break2\" class=\"form-control\" cols=\"\" rows=\"7\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td03\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td03&#39;)\" readonly=\"\" name=\"td03\"></td><td><input class=\"form-control popoption td04\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td04&#39;)\" readonly=\"\" name=\"td04\"></td><td class=\"break\" rowspan=\"6\" style=\"\">\n                <textarea name=\"break4\" id=\"break4\" class=\"form-control\" cols=\"\" rows=\"7\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td05\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td05&#39;)\" readonly=\"\" name=\"td05\"></td><td><input class=\"form-control popoption td06\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td06&#39;)\" readonly=\"\" name=\"td06\"></td><td class=\"break\" rowspan=\"6\" style=\"\">\n                <textarea name=\"break6\" id=\"break6\" class=\"form-control\" cols=\"\" rows=\"7\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td></tr><tr><td><p>Tue</p></td><td><input class=\"form-control popoption td11\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td11&#39;)\" readonly=\"\" name=\"td11\"></td><td><input class=\"form-control popoption td12\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td12&#39;)\" readonly=\"\" name=\"td12\"></td><td><input class=\"form-control popoption td13\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td13&#39;)\" readonly=\"\" name=\"td13\"></td><td><input class=\"form-control popoption td14\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td14&#39;)\" readonly=\"\" name=\"td14\"></td><td><input class=\"form-control popoption td15\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td15&#39;)\" readonly=\"\" name=\"td15\"></td><td><input class=\"form-control popoption td16\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td16&#39;)\" readonly=\"\" name=\"td16\"></td></tr><tr><td><p>Wed</p></td><td><input class=\"form-control popoption td21\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td21&#39;)\" readonly=\"\" name=\"td21\"></td><td><input class=\"form-control popoption td22\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td22&#39;)\" readonly=\"\" name=\"td22\"></td><td><input class=\"form-control popoption td23\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td23&#39;)\" readonly=\"\" name=\"td23\"></td><td><input class=\"form-control popoption td24\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td24&#39;)\" readonly=\"\" name=\"td24\"></td><td><input class=\"form-control popoption td25\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td25&#39;)\" readonly=\"\" name=\"td25\"></td><td><input class=\"form-control popoption td26\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td26&#39;)\" readonly=\"\" name=\"td26\"></td></tr><tr><td><p>Thu</p></td><td><input class=\"form-control popoption td31\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td31&#39;)\" readonly=\"\" name=\"td31\"></td><td><input class=\"form-control popoption td32\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td32&#39;)\" readonly=\"\" name=\"td32\"></td><td><input class=\"form-control popoption td33\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td33&#39;)\" readonly=\"\" name=\"td33\"></td><td><input class=\"form-control popoption td34\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td34&#39;)\" readonly=\"\" name=\"td34\"></td><td><input class=\"form-control popoption td35\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td35&#39;)\" readonly=\"\" name=\"td35\"></td><td><input class=\"form-control popoption td36\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td36&#39;)\" readonly=\"\" name=\"td36\"></td></tr><tr><td><p>Fri</p></td><td><input class=\"form-control popoption td41\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td41&#39;)\" readonly=\"\" name=\"td41\"></td><td><input class=\"form-control popoption td42\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td42&#39;)\" readonly=\"\" name=\"td42\"></td><td><input class=\"form-control popoption td43\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td43&#39;)\" readonly=\"\" name=\"td43\"></td><td><input class=\"form-control popoption td44\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td44&#39;)\" readonly=\"\" name=\"td44\"></td><td><input class=\"form-control popoption td45\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td45&#39;)\" readonly=\"\" name=\"td45\"></td><td><input class=\"form-control popoption td46\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td46&#39;)\" readonly=\"\" name=\"td46\"></td></tr><tr><td><p>Sat</p></td><td><input class=\"form-control popoption td51\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td51&#39;)\" readonly=\"\" name=\"td51\"></td><td><input class=\"form-control popoption td52\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td52&#39;)\" readonly=\"\" name=\"td52\"></td><td><input class=\"form-control popoption td53\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td53&#39;)\" readonly=\"\" name=\"td53\"></td><td><input class=\"form-control popoption td54\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td54&#39;)\" readonly=\"\" name=\"td54\"></td><td><input class=\"form-control popoption td55\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td55&#39;)\" readonly=\"\" name=\"td55\"></td><td><input class=\"form-control popoption td56\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td56&#39;)\" readonly=\"\" name=\"td56\"></td></tr></tbody></table></form><div class=\"form-group mt-3\" style=\"float:right\">   \n                            <button type=\"button\" class=\"btn btn-success btn-icon-text\" onclick=\"save_table()\">\n                              <i class=\"mdi mdi-table-edit btn-icon-prepend\"></i>\n                               Save Table\n                            </button>\n                          </div> </div> </div> </div>  ', '[\"Balaji\", \"Ram\", \"mala\"]');
INSERT INTO `course_details` (`id`, `course_title`, `course`, `teacher`, `t_data`, `t_design`, `all_teacher`) VALUES
(35, 'test', 'test1', '36', '[\"asdas\",\"2-3\",\"sssss\",\"asdasd\",\"212\",\"ssss\",\"jjjj\",\"ooooo\",\"5\",\"8\",\"vvvv\",\"11111\",\"33333\",\"2\",\"3\",\"6\"]', ' <div class=\"card\"><div class=\"card-body\"><h4 class=\"card-title\">Time Table</h4>\n                    <p class=\"card-description\">Fill Details</p><div class=\"table-responsive pt-3\">\n                    <form id=\"t-table\"><table><thead><tr><td><p>Time</p></td><td><input class=\"form-control th1\" name=\"th1\" placeholder=\"Period: 1 Time\"></td><td><input class=\"form-control th2\" name=\"th2\" placeholder=\"Period: 2 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th3\" name=\"th3\" placeholder=\"Period: 3 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th4\" name=\"th4\" placeholder=\"Period: 4 Time\"></td><td><input class=\"form-control th5\" name=\"th5\" placeholder=\"Period: 5 Time\"></td><td><input class=\"form-control th6\" name=\"th6\" placeholder=\"Period: 6 Time\"></td><td style=\"transform:rotate(-90deg);\"><p>Break</p></td><td><input class=\"form-control th7\" name=\"th7\" placeholder=\"Period: 7 Time\"></td><td><input class=\"form-control th8\" name=\"th8\" placeholder=\"Period: 8 Time\"></td></tr></thead><tbody><tr><td><p>Mon</p></td><td><input class=\"form-control popoption td01\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td01&#39;)\" readonly=\"\" name=\"td01\"></td><td><input class=\"form-control popoption td02\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td02&#39;)\" readonly=\"\" name=\"td02\"></td><td class=\"break\" rowspan=\"5\" style=\"\">\n                <textarea name=\"break2\" id=\"break2\" class=\"form-control\" cols=\"\" rows=\"6\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td03\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td03&#39;)\" readonly=\"\" name=\"td03\"></td><td class=\"break\" rowspan=\"5\" style=\"\">\n                <textarea name=\"break3\" id=\"break3\" class=\"form-control\" cols=\"\" rows=\"6\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td04\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td04&#39;)\" readonly=\"\" name=\"td04\"></td><td><input class=\"form-control popoption td05\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td05&#39;)\" readonly=\"\" name=\"td05\"></td><td><input class=\"form-control popoption td06\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td06&#39;)\" readonly=\"\" name=\"td06\"></td><td class=\"break\" rowspan=\"5\" style=\"\">\n                <textarea name=\"break6\" id=\"break6\" class=\"form-control\" cols=\"\" rows=\"6\" style=\"width:10px;overflow:hidden\"></textarea>\n                </td><td><input class=\"form-control popoption td07\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td07&#39;)\" readonly=\"\" name=\"td07\"></td><td><input class=\"form-control popoption td08\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td08&#39;)\" readonly=\"\" name=\"td08\"></td></tr><tr><td><p>Tue</p></td><td><input class=\"form-control popoption td11\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td11&#39;)\" readonly=\"\" name=\"td11\"></td><td><input class=\"form-control popoption td12\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td12&#39;)\" readonly=\"\" name=\"td12\"></td><td><input class=\"form-control popoption td13\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td13&#39;)\" readonly=\"\" name=\"td13\"></td><td><input class=\"form-control popoption td14\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td14&#39;)\" readonly=\"\" name=\"td14\"></td><td><input class=\"form-control popoption td15\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td15&#39;)\" readonly=\"\" name=\"td15\"></td><td><input class=\"form-control popoption td16\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td16&#39;)\" readonly=\"\" name=\"td16\"></td><td><input class=\"form-control popoption td17\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td17&#39;)\" readonly=\"\" name=\"td17\"></td><td><input class=\"form-control popoption td18\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td18&#39;)\" readonly=\"\" name=\"td18\"></td></tr><tr><td><p>Wed</p></td><td><input class=\"form-control popoption td21\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td21&#39;)\" readonly=\"\" name=\"td21\"></td><td><input class=\"form-control popoption td22\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td22&#39;)\" readonly=\"\" name=\"td22\"></td><td><input class=\"form-control popoption td23\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td23&#39;)\" readonly=\"\" name=\"td23\"></td><td><input class=\"form-control popoption td24\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td24&#39;)\" readonly=\"\" name=\"td24\"></td><td><input class=\"form-control popoption td25\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td25&#39;)\" readonly=\"\" name=\"td25\"></td><td><input class=\"form-control popoption td26\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td26&#39;)\" readonly=\"\" name=\"td26\"></td><td><input class=\"form-control popoption td27\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td27&#39;)\" readonly=\"\" name=\"td27\"></td><td><input class=\"form-control popoption td28\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td28&#39;)\" readonly=\"\" name=\"td28\"></td></tr><tr><td><p>Thu</p></td><td><input class=\"form-control popoption td31\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td31&#39;)\" readonly=\"\" name=\"td31\"></td><td><input class=\"form-control popoption td32\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td32&#39;)\" readonly=\"\" name=\"td32\"></td><td><input class=\"form-control popoption td33\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td33&#39;)\" readonly=\"\" name=\"td33\"></td><td><input class=\"form-control popoption td34\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td34&#39;)\" readonly=\"\" name=\"td34\"></td><td><input class=\"form-control popoption td35\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td35&#39;)\" readonly=\"\" name=\"td35\"></td><td><input class=\"form-control popoption td36\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td36&#39;)\" readonly=\"\" name=\"td36\"></td><td><input class=\"form-control popoption td37\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td37&#39;)\" readonly=\"\" name=\"td37\"></td><td><input class=\"form-control popoption td38\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td38&#39;)\" readonly=\"\" name=\"td38\"></td></tr><tr><td><p>Fri</p></td><td><input class=\"form-control popoption td41\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td41&#39;)\" readonly=\"\" name=\"td41\"></td><td><input class=\"form-control popoption td42\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td42&#39;)\" readonly=\"\" name=\"td42\"></td><td><input class=\"form-control popoption td43\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td43&#39;)\" readonly=\"\" name=\"td43\"></td><td><input class=\"form-control popoption td44\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td44&#39;)\" readonly=\"\" name=\"td44\"></td><td><input class=\"form-control popoption td45\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td45&#39;)\" readonly=\"\" name=\"td45\"></td><td><input class=\"form-control popoption td46\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td46&#39;)\" readonly=\"\" name=\"td46\"></td><td><input class=\"form-control popoption td47\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td47&#39;)\" readonly=\"\" name=\"td47\"></td><td><input class=\"form-control popoption td48\" data-placement=\"bottom\" onclick=\"select_teacher(&#39;td48&#39;)\" readonly=\"\" name=\"td48\"></td></tr></tbody></table></form><div class=\"form-group mt-3\" style=\"float:right\">   \n                            <button type=\"button\" class=\"btn btn-success btn-icon-text\" onclick=\"save_table()\">\n                              <i class=\"mdi mdi-table-edit btn-icon-prepend\"></i>\n                               Save Table\n                            </button>\n                          </div> </div> </div> </div>  ', '[\"37\",\"38\",\"39\"]');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `pic_url` varchar(450) DEFAULT NULL,
  `last_modified_time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `pic_url`, `last_modified_time`) VALUES
(3, '1_5_2022_14_43_20_18.jpg', 'Wed Jun 01 2022 14:45:11 GMT+0530 (India Standard Time)'),
(4, '1_5_2022_14_47_49_17.jpg', 'Wed Jun 01 2022 14:49:08 GMT+0530 (India Standard Time)'),
(5, '1_5_2022_14_56_57_16.jpg', 'Wed Jun 01 2022 15:02:09 GMT+0530 (India Standard Time)'),
(6, '1_5_2022_15_8_35_15.jpg', 'Wed Jun 01 2022 15:09:37 GMT+0530 (India Standard Time)'),
(7, '1_5_2022_15_8_35_14.jpg', 'Wed Jun 01 2022 15:09:52 GMT+0530 (India Standard Time)'),
(8, '1_5_2022_15_8_35_13.jpg', 'Wed Jun 01 2022 15:10:00 GMT+0530 (India Standard Time)'),
(9, '1_5_2022_15_8_35_12.jpg', 'Wed Jun 01 2022 15:10:07 GMT+0530 (India Standard Time)'),
(10, '1_5_2022_15_8_35_11.jpg', 'Wed Jun 01 2022 15:10:14 GMT+0530 (India Standard Time)'),
(11, '1_5_2022_15_8_35_10.jpg', 'Wed Jun 01 2022 15:10:20 GMT+0530 (India Standard Time)'),
(12, '1_5_2022_15_8_35_9.jpg', 'Wed Jun 01 2022 15:10:27 GMT+0530 (India Standard Time)'),
(13, '1_5_2022_15_8_35_8.jpg', 'Wed Jun 01 2022 15:10:35 GMT+0530 (India Standard Time)'),
(14, '1_5_2022_15_13_13_7.jpg', 'Wed Jun 01 2022 15:25:25 GMT+0530 (India Standard Time)'),
(15, '8_5_2022_10_53_51_AShian.jpg', 'Thu Jun 09 2022 02:54:51 GMT-0700 (Mountain Standard Time)');

-- --------------------------------------------------------

--
-- Table structure for table `state_details`
--

CREATE TABLE `state_details` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state_details`
--

INSERT INTO `state_details` (`id`, `name`) VALUES
(1, 'Andaman and Nicobar Islands'),
(2, 'Andhra Pradesh'),
(3, 'Arunachal Pradesh'),
(4, 'Assam'),
(5, 'Bihar'),
(6, 'Chandigarh'),
(7, 'Chhattisgarh'),
(8, 'Dadra and Nagar Haveli'),
(9, 'Daman and Diu'),
(10, 'Delhi'),
(11, 'Goa'),
(12, 'Gujarat'),
(13, 'Haryana'),
(14, 'Himachal Pradesh'),
(15, 'Jammu and Kashmir'),
(16, 'Jharkhand'),
(17, 'Karnataka'),
(18, 'Kenmore'),
(19, 'Kerala'),
(20, 'Lakshadweep'),
(21, 'Madhya Pradesh'),
(22, 'Maharashtra'),
(23, 'Manipur'),
(24, 'Meghalaya'),
(25, 'Mizoram'),
(26, 'Nagaland'),
(27, 'Narora'),
(28, 'Natwar'),
(29, 'Odisha'),
(30, 'Paschim Medinipur'),
(31, 'Puducherry'),
(32, 'Punjab'),
(33, 'Rajasthan'),
(34, 'Sikkim'),
(35, 'Tamil Nadu'),
(36, 'Telangana'),
(37, 'Tripura'),
(39, 'Uttar Pradesh'),
(40, 'Uttarakhand'),
(42, 'West Bengal'),
(43, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `student_events`
--

CREATE TABLE `student_events` (
  `id` int(11) NOT NULL,
  `course_title` varchar(100) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `event_id` varchar(45) DEFAULT NULL,
  `events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`events`)),
  `last_modified_time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student_materials`
--

CREATE TABLE `student_materials` (
  `id` int(11) NOT NULL,
  `course_title` varchar(45) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`details`)),
  `last_modified_time` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_materials`
--

INSERT INTO `student_materials` (`id`, `course_title`, `course`, `details`, `last_modified_time`) VALUES
(15, '11', 'A', '{\"day\": \"06-08-2022\", \"time\": \" 06:23:39\", \"file_id\": \"8_5_2022_6_17_7_University Form.pdf\", \"file_desc\": \"Tamil notes\", \"file_name\": \"tamil\", \"subject_name\": \"Tamil\", \"uploader_name\": \"Ajay Kumar\"}', '6/8/2022'),
(16, 'XI', 'A', '{\"day\": \"06-08-2022\", \"time\": \" 07:32:31\", \"file_id\": \"8_5_2022_7_28_50_University Form.pdf\", \"file_desc\": \"\", \"file_name\": \"tamil\", \"subject_name\": \"Tamil\", \"uploader_name\": \"Ajay Kumar\"}', '6/8/2022'),
(17, 'XI', 'A', '{\"day\": \"06-08-2022\", \"time\": \" 09:35:42\", \"file_id\": \"8_5_2022_8_6_52_1638932058_fullstackdevelopment.pdf\", \"file_desc\": \"\", \"file_name\": \"Qwet\", \"subject_name\": \"Chemistry\", \"uploader_name\": \"Rajkumar\"}', '6/8/2022'),
(18, 'XI', 'A', '{\"day\": \"06-09-2022\", \"time\": \" 05:16:39\", \"file_id\": \"9_5_2022_5_11_28_University Form.pdf\", \"file_desc\": \"\", \"file_name\": \"qwertyuiop\", \"subject_name\": \"Tamil\", \"uploader_name\": \"Balaji\"}', '6/9/2022'),
(19, 'XI', 'A', '{\"day\": \"06-09-2022\", \"time\": \" 05:24:09\", \"file_id\": \"9_5_2022_5_23_11_University Form.pdf\", \"file_desc\": \"\", \"file_name\": \"qweqwe\", \"subject_name\": \"Mathematics\", \"uploader_name\": \"Balaji\"}', '6/9/2022'),
(20, 'XI', 'A', '{\"day\": \"06-09-2022\", \"time\": \" 05:30:12\", \"file_id\": \"9_5_2022_5_29_47_dfhdfhd.pdf\", \"file_desc\": \"\", \"file_name\": \"asfsfqwef\", \"subject_name\": \"English\", \"uploader_name\": \"Balaji\"}', '6/9/2022'),
(21, 'XI', 'A', '{\"day\": \"06-09-2022\", \"time\": \" 05:41:54\", \"file_id\": \"9_5_2022_5_41_6_dfhdfdfhdfh.pdf\", \"file_desc\": \"\", \"file_name\": \"drdfdf\", \"subject_name\": \"English\", \"uploader_name\": \"Sweetha\"}', '6/9/2022'),
(22, 'XI', 'A', '{\"day\": \"06-10-2022\", \"time\": \" 05:25:00\", \"file_id\": \"10_5_2022_5_24_19_dfhdfhd.pdf\", \"file_desc\": \"\", \"file_name\": \"qwerty\", \"subject_name\": \"English\", \"uploader_name\": \"Ajay Kumar\"}', '6/10/2022'),
(23, 'XI', 'A', '{\"day\": \"06-11-2022\", \"time\": \" 04:06:21\", \"file_id\": \"11_5_2022_4_3_37_dfhdfdfhdfh.pdf\", \"file_desc\": \"\", \"file_name\": \"qwerty\", \"subject_name\": \"Business Tamil\", \"uploader_name\": \"Ajay Kumar\"}', '6/11/2022'),
(24, 'XI', 'A', '{\"day\": \"06-12-2022\", \"time\": \" 23:42:53\", \"file_id\": \"12_5_2022_23_42_2_University Form.pdf\", \"file_desc\": \"\", \"file_name\": \"qwertyuiop\", \"subject_name\": \"English\", \"uploader_name\": \"Balaji\"}', '6/12/2022'),
(25, 'XI', 'A', '{\"day\": \"06-13-2022\", \"time\": \" 00:09:40\", \"file_id\": \"13_5_2022_0_9_3_University Form.pdf\", \"file_desc\": \"\", \"file_name\": \"asdf\", \"subject_name\": \"English\", \"uploader_name\": \"Balaji\"}', '6/13/2022'),
(26, 'XI', 'A', '{\"day\": \"06-13-2022\", \"time\": \" 02:20:05\", \"file_id\": \"13_5_2022_2_15_57_University Form.pdf\", \"file_desc\": \"\", \"file_name\": \"asdfghj\", \"subject_name\": \"English\", \"uploader_name\": \"Balaji\"}', '6/13/2022'),
(27, 'XI', 'A', '{\"day\": \"06-13-2022\", \"time\": \" 02:26:17\", \"file_id\": \"13_5_2022_2_25_21_University Form.pdf\", \"file_desc\": \"\", \"file_name\": \"awerfty\", \"subject_name\": \"Business Tamil\", \"uploader_name\": \"Ram\"}', '6/13/2022'),
(28, 'XI', 'A', '{\"day\": \"06-13-2022\", \"time\": \" 02:28:55\", \"file_id\": \"13_5_2022_2_28_6_University Form.pdf\", \"file_desc\": \"\", \"file_name\": \"ggfgdg\", \"subject_name\": \"English\", \"uploader_name\": \"Ram\"}', '6/13/2022'),
(29, 'XI', 'A', '{\"day\": \"06-13-2022\", \"time\": \" 02:32:55\", \"file_id\": \"13_5_2022_2_32_11_University Form.pdf\", \"file_desc\": \"\", \"file_name\": \"gxhjkhcj\", \"subject_name\": \"Physics\", \"uploader_name\": \"Rajkumar\"}', '6/13/2022');

-- --------------------------------------------------------

--
-- Table structure for table `student_material_file`
--

CREATE TABLE `student_material_file` (
  `id` int(11) NOT NULL,
  `file_id` varchar(450) DEFAULT NULL,
  `file_pdf` longtext DEFAULT NULL,
  `last_modified_time` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student_meeting`
--

CREATE TABLE `student_meeting` (
  `id` int(11) NOT NULL,
  `student_id` varchar(100) DEFAULT NULL,
  `cand_id` varchar(100) DEFAULT NULL,
  `meeting_link` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meeting_link`)),
  `meeting_number` varchar(100) DEFAULT NULL,
  `last_modified_time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_meeting`
--

INSERT INTO `student_meeting` (`id`, `student_id`, `cand_id`, `meeting_link`, `meeting_number`, `last_modified_time`) VALUES
(60, 'VIII', 'A', '{\"url\": \"https://us05web.zoom.us/j/89596664771&pwd=V241QVFreVUra0pxNEZXVVlhTjFEUT09\", \"time\": \"2022-06-20T08:19\", \"username\": \"Ravi\"}', '89596664771', '2022-06-19 17:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `student_menu`
--

CREATE TABLE `student_menu` (
  `id` int(11) NOT NULL,
  `realMenu` varchar(100) DEFAULT NULL,
  `menu` varchar(450) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_menu`
--

INSERT INTO `student_menu` (`id`, `realMenu`, `menu`, `status`) VALUES
(1, 'Calendar', 'student_calendar', 'Enabled'),
(2, 'Marks', 'student_marks', 'Enabled'),
(3, 'Fees', 'student_fees', 'Enabled'),
(4, 'Fees Receipt', 'student_receipt', 'Enabled'),
(5, 'Time-Table', 'student_timeTable', 'Enabled'),
(6, 'Materials', 'student_materials', 'Enabled'),
(7, 'Virtual Classes', 'student_vr_class', 'Enabled'),
(8, 'Attendance', 'student_attendance', 'Enabled');

-- --------------------------------------------------------

--
-- Table structure for table `student_time_table`
--

CREATE TABLE `student_time_table` (
  `id` int(11) NOT NULL,
  `course_title` varchar(45) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `semester` varchar(45) DEFAULT NULL,
  `table_struct` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`table_struct`)),
  `table_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`table_values`)),
  `last_modified_time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_time_table`
--

INSERT INTO `student_time_table` (`id`, `course_title`, `course`, `year`, `semester`, `table_struct`, `table_values`, `last_modified_time`) VALUES
(9, 'XI', 'A', '', '', '{\"days\": \"5\", \"mrng\": \"2\", \"after\": \"6\", \"lunch\": \"3\", \"periods\": \"8\", \"end_time\": \"\", \"start_time\": \"\"}', '{\"td\": {\"td01\": \"kumaran\", \"td02\": \"kumaran\", \"td03\": \"kumaran\", \"td04\": \"Rajkumar\", \"td05\": \"kumaran\", \"td06\": \"kumaran\", \"td07\": \"Ajay Kumar\", \"td08\": \"kumaran\", \"td11\": \"kumaran\", \"td12\": \"kumaran\", \"td13\": \"kumaran\", \"td14\": \"kumaran\", \"td15\": \"kumaran\", \"td16\": \"kumaran\", \"td17\": \"kumaran\", \"td18\": \"kumaran\", \"td21\": \"kumaran\", \"td22\": \"kumaran\", \"td23\": \"kumaran\", \"td24\": \"kumaran\", \"td25\": \"Ajay Kumar\", \"td26\": \"kumaran\", \"td27\": \"Ram\", \"td28\": \"kumaran\", \"td31\": \"kumaran\", \"td32\": \"Rajkumar\", \"td33\": \"kumaran\", \"td34\": \"kumaran\", \"td35\": \"kumaran\", \"td36\": \"kumaran\", \"td37\": \"kumaran\", \"td38\": \"kumaran\", \"td41\": \"kumaran\", \"td42\": \"kumaran\", \"td43\": \"kumaran\", \"td44\": \"kumaran\", \"td45\": \"kumaran\", \"td46\": \"kumaran\", \"td47\": \"kumaran\", \"td48\": \"kumaran\"}, \"th\": {\"th1\": \"sssss\", \"th2\": \"dddd\", \"th3\": \"dfd\", \"th4\": \"ddd\", \"th5\": \"ddd\", \"th6\": \"aaaaaaa\", \"th7\": \"aaaaaaaa\", \"th8\": \"asdsdsdsd\"}, \"breaks\": {\"break2\": \"\", \"break3\": \"ggggg\", \"break6\": \"\"}}', '2022-07-25 22:21:00'),
(10, 'VIII', 'A', '', '', '{\"days\": \"5\", \"mrng\": \"2\", \"after\": \"6\", \"lunch\": \"3\", \"periods\": \"8\", \"end_time\": \"\", \"start_time\": \"\"}', '{\"td\": {\"td01\": \"Balaji\", \"td02\": \"Ajay Kumar\", \"td03\": \"Ajay Kumar\", \"td04\": \"Ajay Kumar\", \"td05\": \"Ajay Kumar\", \"td06\": \"Ajay Kumar\", \"td07\": \"Balaji\", \"td08\": \"Rajkumar\", \"td11\": \"Rajkumar\", \"td12\": \"Ajay Kumar\", \"td13\": \"Rajkumar\", \"td14\": \"Ajay Kumar\", \"td15\": \"Ajay Kumar\", \"td16\": \"Ajay Kumar\", \"td17\": \"Ajay Kumar\", \"td18\": \"Balaji\", \"td21\": \"Ajay Kumar\", \"td22\": \"Ram\", \"td23\": \"Rajkumar\", \"td24\": \"Ajay Kumar\", \"td25\": \"Ram\", \"td26\": \"Ajay Kumar\", \"td27\": \"Rajkumar\", \"td28\": \"Balaji\", \"td31\": \"Rajkumar\", \"td32\": \"Ajay Kumar\", \"td33\": \"Ajay Kumar\", \"td34\": \"Ajay Kumar\", \"td35\": \"Balaji\", \"td36\": \"Balaji\", \"td37\": \"Ram\", \"td38\": \"Rajkumar\", \"td41\": \"Ajay Kumar\", \"td42\": \"Rajkumar\", \"td43\": \"Ajay Kumar\", \"td44\": \"Ajay Kumar\", \"td45\": \"Ajay Kumar\", \"td46\": \"Ajay Kumar\", \"td47\": \"Rajkumar\", \"td48\": \"Ajay Kumar\"}, \"th\": {\"th1\": \"1-2\", \"th2\": \"1-2\", \"th3\": \"1-2\", \"th4\": \"1-2\", \"th5\": \"1-2\", \"th6\": \"1-2\", \"th7\": \"1-2\", \"th8\": \"1-2\"}, \"breaks\": {\"break2\": \"br1\", \"break3\": \"br1\", \"break6\": \"br4\"}}', '2022-06-19 21:44:18'),
(11, 'XII', 'B', '', '', '{\"days\": \"5\", \"mrng\": \"2\", \"after\": \"3\", \"lunch\": \"4\", \"periods\": \"8\", \"end_time\": \"\", \"start_time\": \"\"}', '{\"td\": {\"td01\": \"latha\", \"td02\": \"Balaji\", \"td03\": \"Rajkumar\", \"td04\": \"Ram\", \"td05\": \"Rajkumar\", \"td06\": \"Rajkumar\", \"td07\": \"Rajkumar\", \"td08\": \"Balaji\", \"td11\": \"Ram\", \"td12\": \"Rajkumar\", \"td13\": \"Balaji\", \"td14\": \"Rajkumar\", \"td15\": \"Rajkumar\", \"td16\": \"Rajkumar\", \"td17\": \"Balaji\", \"td18\": \"Ram\", \"td21\": \"Balaji\", \"td22\": \"latha\", \"td23\": \"Balaji\", \"td24\": \"latha\", \"td25\": \"Rajkumar\", \"td26\": \"Rajkumar\", \"td27\": \"latha\", \"td28\": \"Rajkumar\", \"td31\": \"Ram\", \"td32\": \"Ram\", \"td33\": \"latha\", \"td34\": \"Rajkumar\", \"td35\": \"Ram\", \"td36\": \"latha\", \"td37\": \"Balaji\", \"td38\": \"latha\", \"td41\": \"Rajkumar\", \"td42\": \"Ram\", \"td43\": \"Rajkumar\", \"td44\": \"Ram\", \"td45\": \"latha\", \"td46\": \"latha\", \"td47\": \"Balaji\", \"td48\": \"Ram\"}, \"th\": {\"th1\": \"\", \"th2\": \"\", \"th3\": \"\", \"th4\": \"\", \"th5\": \"\", \"th6\": \"\", \"th7\": \"\", \"th8\": \"\"}, \"breaks\": {\"break2\": \"\", \"break3\": \"\", \"break4\": \"\"}}', '2022-06-17 02:08:08'),
(12, 'I', 'A', '', '', '{\"days\": \"6\", \"mrng\": \"2\", \"after\": \"6\", \"lunch\": \"4\", \"periods\": \"6\", \"end_time\": \"\", \"start_time\": \"\"}', '{\"td\": {\"td01\": \"Ram\", \"td02\": \"mala\", \"td03\": \"Ram\", \"td04\": \"\", \"td05\": \"Ram\", \"td06\": \"Ram\", \"td11\": \"Balaji\", \"td12\": \"Balaji\", \"td13\": \"Ram\", \"td14\": \"Ram\", \"td15\": \"Ram\", \"td16\": \"mala\", \"td21\": \"mala\", \"td22\": \"mala\", \"td23\": \"Ram\", \"td24\": \"mala\", \"td25\": \"Balaji\", \"td26\": \"Ram\", \"td31\": \"mala\", \"td32\": \"Balaji\", \"td33\": \"Balaji\", \"td34\": \"mala\", \"td35\": \"mala\", \"td36\": \"Ram\", \"td41\": \"mala\", \"td42\": \"Balaji\", \"td43\": \"Ram\", \"td44\": \"Balaji\", \"td45\": \"Ram\", \"td46\": \"Balaji\", \"td51\": \"Ram\", \"td52\": \"Ram\", \"td53\": \"mala\", \"td54\": \"Ram\", \"td55\": \"Ram\", \"td56\": \"Ram\"}, \"th\": {\"th1\": \"\", \"th2\": \"\", \"th3\": \"\", \"th4\": \"\", \"th5\": \"\", \"th6\": \"\"}, \"breaks\": {\"break2\": \"\", \"break4\": \"\", \"break6\": \"\"}}', '2022-06-17 02:19:29'),
(13, 'ix', 'c', '', '', '{\"days\": \"5\", \"mrng\": \"2\", \"after\": \"6\", \"lunch\": \"4\", \"periods\": \"8\", \"end_time\": \"\", \"start_time\": \"\"}', '{\"td\": {\"td01\": \"Ajay Kumar\", \"td02\": \"mala\", \"td03\": \"Rajkumar\", \"td04\": \"Ravi\", \"td05\": \"Rajkumar\", \"td06\": \"mala\", \"td07\": \"Kumar\", \"td08\": \"Kumar\", \"td11\": \"Kumar\", \"td12\": \"mala\", \"td13\": \"Kumar\", \"td14\": \"mala\", \"td15\": \"Rajkumar\", \"td16\": \"Kumar\", \"td17\": \"Rajkumar\", \"td18\": \"Ajay Kumar\", \"td21\": \"mala\", \"td22\": \"mala\", \"td23\": \"Ajay Kumar\", \"td24\": \"Balaji\", \"td25\": \"mala\", \"td26\": \"Kumar\", \"td27\": \"Rajkumar\", \"td28\": \"Balaji\", \"td31\": \"Ravi\", \"td32\": \"Ravi\", \"td33\": \"Balaji\", \"td34\": \"Ravi\", \"td35\": \"Ravi\", \"td36\": \"Rajkumar\", \"td37\": \"Ajay Kumar\", \"td38\": \"Balaji\", \"td41\": \"Ajay Kumar\", \"td42\": \"Rajkumar\", \"td43\": \"mala\", \"td44\": \"Balaji\", \"td45\": \"Rajkumar\", \"td46\": \"Balaji\", \"td47\": \"Balaji\", \"td48\": \"Ajay Kumar\"}, \"th\": {\"th1\": \"asd\", \"th2\": \"sdf\", \"th3\": \"sdfsdf\", \"th4\": \"sdfsdf\", \"th5\": \"sdfsdf\", \"th6\": \"sdfsdf\", \"th7\": \"sdfsdf\", \"th8\": \"sdfsdf\"}, \"breaks\": {\"break2\": \"\", \"break4\": \"\", \"break6\": \"\"}}', '2022-06-14 01:46:28'),
(14, 'x', 'b', '', '', '{\"days\": \"6\", \"mrng\": \"2\", \"after\": \"6\", \"lunch\": \"4\", \"periods\": \"6\", \"end_time\": \"\", \"start_time\": \"\"}', '{\"td\": {\"td01\": \"mala\", \"td02\": \"\", \"td03\": \"\", \"td04\": \"\", \"td05\": \"\", \"td06\": \"\", \"td11\": \"\", \"td12\": \"\", \"td13\": \"\", \"td14\": \"\", \"td15\": \"\", \"td16\": \"\", \"td21\": \"Ram\", \"td22\": \"Balaji\", \"td23\": \"\", \"td24\": \"Ram\", \"td25\": \"\", \"td26\": \"\", \"td31\": \"\", \"td32\": \"\", \"td33\": \"Ram\", \"td34\": \"\", \"td35\": \"\", \"td36\": \"\", \"td41\": \"\", \"td42\": \"\", \"td43\": \"mala\", \"td44\": \"mala\", \"td45\": \"\", \"td46\": \"\", \"td51\": \"Balaji\", \"td52\": \"Balaji\", \"td53\": \"Ram\", \"td54\": \"Balaji\", \"td55\": \"Balaji\", \"td56\": \"Balaji\"}, \"th\": {\"th1\": \"1-2\", \"th2\": \"dddd\", \"th3\": \"sdfs\", \"th4\": \"sdfsd\", \"th5\": \"sss\", \"th6\": \"dfdfdfd\"}, \"breaks\": {\"break2\": \"0000\", \"break4\": \"hhhh\", \"break6\": \"\"}}', '2022-07-25 04:07:10'),
(15, 'I', 'B', '', '', '{\"days\": \"6\", \"mrng\": \"2\", \"after\": \"6\", \"lunch\": \"4\", \"periods\": \"6\", \"end_time\": \"\", \"start_time\": \"\"}', '{\"td\": {\"td01\": \"Rajkumar\", \"td02\": \"Rajkumar\", \"td03\": \"Balaji\", \"td04\": \"mala\", \"td05\": \"Balaji\", \"td06\": \"mala\", \"td11\": \"mala\", \"td12\": \"mala\", \"td13\": \"mala\", \"td14\": \"mala\", \"td15\": \"mala\", \"td16\": \"Balaji\", \"td21\": \"Rajkumar\", \"td22\": \"Rajkumar\", \"td23\": \"mala\", \"td24\": \"Rajkumar\", \"td25\": \"mala\", \"td26\": \"Balaji\", \"td31\": \"Balaji\", \"td32\": \"mala\", \"td33\": \"Rajkumar\", \"td34\": \"Balaji\", \"td35\": \"Rajkumar\", \"td36\": \"mala\", \"td41\": \"Balaji\", \"td42\": \"mala\", \"td43\": \"Balaji\", \"td44\": \"Rajkumar\", \"td45\": \"mala\", \"td46\": \"mala\", \"td51\": \"mala\", \"td52\": \"mala\", \"td53\": \"Rajkumar\", \"td54\": \"mala\", \"td55\": \"mala\", \"td56\": \"mala\"}, \"th\": {\"th1\": \"\", \"th2\": \"\", \"th3\": \"\", \"th4\": \"\", \"th5\": \"\", \"th6\": \"\"}, \"breaks\": {\"break2\": \"\", \"break4\": \"\", \"break6\": \"\"}}', '2022-06-17 02:18:02'),
(16, 'test', 'test1', '', '', '{\"days\":\"5\",\"periods\":\"8\",\"mrng\":\"2\",\"lunch\":\"3\",\"after\":\"6\",\"start_time\":\"\",\"end_time\":\"\"}', '{\"th\":{\"th1\":\"asdas\",\"th2\":\"2-3\",\"th3\":\"sssss\",\"th4\":\"asdasd\",\"th5\":\"212\",\"th6\":\"ssss\",\"th7\":\"jjjj\",\"th8\":\"ooooo\"},\"td\":{\"td01\":\"Vimal/Tamil\",\"td02\":\"Vimal/French\",\"td03\":\"Hari/Tamil\",\"td04\":\"Raja/Tamil\",\"td05\":\"Vimal/Tamil\",\"td06\":\"Raja/Tamil\",\"td07\":\"Banu/Mathematics\",\"td08\":\"Raja/Tamil\",\"td11\":\"Hari/Tamil\",\"td12\":\"Vimal/Tamil\",\"td13\":\"Raja/Tamil\",\"td14\":\"Vimal/Tamil\",\"td15\":\"Banu/Mathematics\",\"td16\":\"Vimal/Tamil\",\"td17\":\"Banu/Mathematics\",\"td18\":\"Raja/Tamil\",\"td21\":\"Banu/Mathematics\",\"td22\":\"Hari/Tamil\",\"td23\":\"Raja/Tamil\",\"td24\":\"Vimal/Tamil\",\"td25\":\"Hari/Tamil\",\"td26\":\"Banu/Mathematics\",\"td27\":\"Vimal/Tamil\",\"td28\":\"Raja/Tamil\",\"td31\":\"Vimal/Tamil\",\"td32\":\"Banu/Mathematics\",\"td33\":\"Raja/Tamil\",\"td34\":\"Hari/Tamil\",\"td35\":\"Raja/Tamil\",\"td36\":\"Vimal/Tamil\",\"td37\":\"Raja/Tamil\",\"td38\":\"Vimal/Tamil\",\"td41\":\"Raja/Tamil\",\"td42\":\"Vimal/Tamil\",\"td43\":\"Banu/Mathematics\",\"td44\":\"Raja/Tamil\",\"td45\":\"Banu/Mathematics\",\"td46\":\"Vimal/Tamil\",\"td47\":\"Hari/Tamil\",\"td48\":\"Raja/Tamil\"},\"breaks\":{\"break2\":\"vvvv\",\"break3\":\"11111\",\"break6\":\"33333\"}}', '2022-08-22 11:11:43');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject`) VALUES
(1, 'Tamil'),
(2, 'French'),
(3, 'Mathematics'),
(4, 'Physics'),
(5, 'Chemistry'),
(8, 'Biology');

-- --------------------------------------------------------

--
-- Table structure for table `table_handler`
--

CREATE TABLE `table_handler` (
  `id` int(11) NOT NULL,
  `period` varchar(900) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table_handler`
--

INSERT INTO `table_handler` (`id`, `period`, `teacher_id`, `class_id`, `subject_id`) VALUES
(441, 'td01', 36, 35, 1),
(442, 'td13', 37, 35, 1),
(443, 'td12', 36, 35, 1),
(444, 'td02', 37, 35, 1),
(445, 'td11', 39, 35, 1),
(446, 'td03', 39, 35, 1),
(447, 'td05', 36, 35, 1),
(448, 'td08', 37, 35, 1),
(449, 'td07', 38, 35, 3),
(450, 'td06', 37, 35, 1),
(451, 'td04', 37, 35, 1),
(452, 'td14', 36, 35, 1),
(453, 'td15', 38, 35, 3),
(454, 'td17', 38, 35, 3),
(455, 'td18', 37, 35, 1),
(456, 'td21', 38, 35, 3),
(457, 'td16', 36, 35, 1),
(458, 'td22', 39, 35, 1),
(459, 'td23', 37, 35, 1),
(460, 'td26', 38, 35, 3),
(461, 'td25', 39, 35, 1),
(462, 'td24', 36, 35, 1),
(463, 'td27', 36, 35, 1),
(464, 'td28', 37, 35, 1),
(465, 'td31', 36, 35, 1),
(466, 'td32', 38, 35, 3),
(467, 'td33', 37, 35, 1),
(468, 'td35', 37, 35, 1),
(469, 'td36', 36, 35, 1),
(470, 'td34', 39, 35, 1),
(471, 'td41', 37, 35, 1),
(472, 'td38', 36, 35, 1),
(473, 'td37', 37, 35, 1),
(474, 'td43', 38, 35, 3),
(475, 'td42', 36, 35, 1),
(476, 'td45', 38, 35, 3),
(477, 'td44', 37, 35, 1),
(478, 'td46', 36, 35, 1),
(479, 'td47', 39, 35, 1),
(480, 'td48', 37, 35, 1),
(481, 'td06', 37, 35, 1),
(482, 'td07', 38, 35, 3),
(483, 'td13', 37, 35, 1),
(484, 'td01', 36, 35, 1),
(485, 'td12', 36, 35, 1),
(486, 'td11', 39, 35, 1),
(487, 'td03', 39, 35, 1),
(488, 'td05', 36, 35, 1),
(489, 'td02', 37, 35, 1),
(490, 'td08', 37, 35, 1),
(491, 'td04', 37, 35, 1),
(492, 'td14', 36, 35, 1),
(493, 'td21', 38, 35, 3),
(494, 'td18', 37, 35, 1),
(495, 'td17', 38, 35, 3),
(496, 'td15', 38, 35, 3),
(497, 'td26', 38, 35, 3),
(498, 'td24', 36, 35, 1),
(499, 'td25', 39, 35, 1),
(500, 'td23', 37, 35, 1),
(501, 'td16', 36, 35, 1),
(502, 'td22', 39, 35, 1),
(503, 'td28', 37, 35, 1),
(504, 'td31', 36, 35, 1),
(505, 'td27', 36, 35, 1),
(506, 'td32', 38, 35, 3),
(507, 'td33', 37, 35, 1),
(508, 'td35', 37, 35, 1),
(509, 'td43', 38, 35, 3),
(510, 'td37', 37, 35, 1),
(511, 'td38', 36, 35, 1),
(512, 'td36', 36, 35, 1),
(513, 'td34', 39, 35, 1),
(514, 'td41', 37, 35, 1),
(515, 'td42', 36, 35, 1),
(516, 'td48', 37, 35, 1),
(517, 'td47', 39, 35, 1),
(518, 'td46', 36, 35, 1),
(519, 'td44', 37, 35, 1),
(520, 'td45', 38, 35, 3),
(521, 'td01', 36, 35, 1),
(522, 'td03', 39, 35, 1),
(523, 'td06', 37, 35, 1),
(524, 'td13', 37, 35, 1),
(525, 'td08', 37, 35, 1),
(526, 'td05', 36, 35, 1),
(527, 'td07', 38, 35, 3),
(528, 'td12', 36, 35, 1),
(529, 'td11', 39, 35, 1),
(530, 'td02', 37, 35, 1),
(531, 'td04', 37, 35, 1),
(532, 'td21', 38, 35, 3),
(533, 'td15', 38, 35, 3),
(534, 'td17', 38, 35, 3),
(535, 'td18', 37, 35, 1),
(536, 'td14', 36, 35, 1),
(537, 'td16', 36, 35, 1),
(538, 'td22', 39, 35, 1),
(539, 'td23', 37, 35, 1),
(540, 'td26', 38, 35, 3),
(541, 'td25', 39, 35, 1),
(542, 'td24', 36, 35, 1),
(543, 'td27', 36, 35, 1),
(544, 'td32', 38, 35, 3),
(545, 'td31', 36, 35, 1),
(546, 'td28', 37, 35, 1),
(547, 'td33', 37, 35, 1),
(548, 'td36', 36, 35, 1),
(549, 'td35', 37, 35, 1),
(550, 'td38', 36, 35, 1),
(551, 'td41', 37, 35, 1),
(552, 'td34', 39, 35, 1),
(553, 'td43', 38, 35, 3),
(554, 'td37', 37, 35, 1),
(555, 'td46', 36, 35, 1),
(556, 'td44', 37, 35, 1),
(557, 'td45', 38, 35, 3),
(558, 'td42', 36, 35, 1),
(559, 'td48', 37, 35, 1),
(560, 'td47', 39, 35, 1),
(561, 'td06', 37, 35, 1),
(562, 'td07', 38, 35, 3),
(563, 'td01', 36, 35, 1),
(564, 'td13', 37, 35, 1),
(565, 'td03', 39, 35, 1),
(566, 'td11', 39, 35, 1),
(567, 'td12', 36, 35, 1),
(568, 'td05', 36, 35, 1),
(569, 'td02', 37, 35, 1),
(570, 'td04', 37, 35, 1),
(571, 'td14', 36, 35, 1),
(572, 'td08', 37, 35, 1),
(573, 'td21', 38, 35, 3),
(574, 'td18', 37, 35, 1),
(575, 'td17', 38, 35, 3),
(576, 'td26', 38, 35, 3),
(577, 'td24', 36, 35, 1),
(578, 'td25', 39, 35, 1),
(579, 'td23', 37, 35, 1),
(580, 'td15', 38, 35, 3),
(581, 'td16', 36, 35, 1),
(582, 'td22', 39, 35, 1),
(583, 'td31', 36, 35, 1),
(584, 'td28', 37, 35, 1),
(585, 'td27', 36, 35, 1),
(586, 'td33', 37, 35, 1),
(587, 'td35', 37, 35, 1),
(588, 'td06', 37, 35, 1),
(589, 'td01', 36, 35, 1),
(590, 'td04', 37, 35, 1),
(591, 'td07', 38, 35, 3),
(592, 'td13', 37, 35, 1),
(593, 'td12', 36, 35, 1),
(594, 'td02', 36, 35, 2),
(595, 'td14', 36, 35, 1),
(596, 'td05', 36, 35, 1),
(597, 'td11', 39, 35, 1),
(598, 'td03', 39, 35, 1),
(599, 'td08', 37, 35, 1),
(600, 'td21', 38, 35, 3),
(601, 'td18', 37, 35, 1),
(602, 'td17', 38, 35, 3),
(603, 'td15', 38, 35, 3),
(604, 'td24', 36, 35, 1),
(605, 'td25', 39, 35, 1),
(606, 'td26', 38, 35, 3),
(607, 'td23', 37, 35, 1),
(608, 'td22', 39, 35, 1),
(609, 'td16', 36, 35, 1),
(610, 'td32', 38, 35, 3),
(611, 'td31', 36, 35, 1),
(612, 'td28', 37, 35, 1),
(613, 'td27', 36, 35, 1),
(614, 'td33', 37, 35, 1),
(615, 'td35', 37, 35, 1),
(616, 'td34', 39, 35, 1),
(617, 'td41', 37, 35, 1),
(618, 'td36', 36, 35, 1),
(619, 'td38', 36, 35, 1),
(620, 'td37', 37, 35, 1),
(621, 'td43', 38, 35, 3),
(622, 'td42', 36, 35, 1),
(623, 'td45', 38, 35, 3),
(624, 'td44', 37, 35, 1),
(625, 'td46', 36, 35, 1),
(626, 'td47', 39, 35, 1),
(627, 'td48', 37, 35, 1),
(628, 'td06', 37, 35, 1),
(629, 'td07', 38, 35, 3),
(630, 'td13', 37, 35, 1),
(631, 'td01', 36, 35, 1),
(632, 'td03', 39, 35, 1),
(633, 'td05', 36, 35, 1),
(634, 'td11', 39, 35, 1),
(635, 'td12', 36, 35, 1),
(636, 'td02', 36, 35, 2),
(637, 'td08', 37, 35, 1),
(638, 'td21', 38, 35, 3),
(639, 'td14', 36, 35, 1),
(640, 'td04', 37, 35, 1),
(641, 'td18', 37, 35, 1),
(642, 'td17', 38, 35, 3),
(643, 'td26', 38, 35, 3),
(644, 'td25', 39, 35, 1),
(645, 'td15', 38, 35, 3),
(646, 'td24', 36, 35, 1),
(647, 'td23', 37, 35, 1),
(648, 'td22', 39, 35, 1),
(649, 'td28', 37, 35, 1),
(650, 'td16', 36, 35, 1),
(651, 'td27', 36, 35, 1),
(652, 'td31', 36, 35, 1),
(653, 'td33', 37, 35, 1),
(654, 'td35', 37, 35, 1),
(655, 'td43', 38, 35, 3),
(656, 'td32', 38, 35, 3),
(657, 'td37', 37, 35, 1),
(658, 'td38', 36, 35, 1),
(659, 'td36', 36, 35, 1),
(660, 'td34', 39, 35, 1),
(661, 'td41', 37, 35, 1),
(662, 'td48', 37, 35, 1),
(663, 'td42', 36, 35, 1),
(664, 'td47', 39, 35, 1),
(665, 'td45', 38, 35, 3),
(666, 'td01', 36, 35, 1),
(667, 'td03', 39, 35, 1),
(668, 'td44', 37, 35, 1),
(669, 'td46', 36, 35, 1),
(670, 'td13', 37, 35, 1),
(671, 'td08', 37, 35, 1),
(672, 'td05', 36, 35, 1),
(673, 'td06', 37, 35, 1),
(674, 'td07', 38, 35, 3),
(675, 'td11', 39, 35, 1),
(676, 'td04', 37, 35, 1),
(677, 'td12', 36, 35, 1),
(678, 'td02', 36, 35, 2),
(679, 'td21', 38, 35, 3),
(680, 'td15', 38, 35, 3),
(681, 'td17', 38, 35, 3),
(682, 'td14', 36, 35, 1),
(683, 'td16', 36, 35, 1),
(684, 'td18', 37, 35, 1),
(685, 'td22', 39, 35, 1),
(686, 'td23', 37, 35, 1),
(687, 'td26', 38, 35, 3),
(688, 'td25', 39, 35, 1),
(689, 'td24', 36, 35, 1),
(690, 'td32', 38, 35, 3),
(691, 'td27', 36, 35, 1),
(692, 'td31', 36, 35, 1),
(693, 'td28', 37, 35, 1),
(694, 'td33', 37, 35, 1),
(695, 'td35', 37, 35, 1),
(696, 'td38', 36, 35, 1),
(697, 'td41', 37, 35, 1),
(698, 'td34', 39, 35, 1),
(699, 'td36', 36, 35, 1),
(700, 'td43', 38, 35, 3),
(701, 'td37', 37, 35, 1),
(702, 'td45', 38, 35, 3),
(703, 'td46', 36, 35, 1),
(704, 'td44', 37, 35, 1),
(705, 'td42', 36, 35, 1),
(706, 'td47', 39, 35, 1),
(707, 'td06', 37, 35, 1),
(708, 'td48', 37, 35, 1),
(709, 'td07', 38, 35, 3),
(710, 'td01', 36, 35, 1),
(711, 'td13', 37, 35, 1),
(712, 'td03', 39, 35, 1),
(713, 'td11', 39, 35, 1),
(714, 'td12', 36, 35, 1),
(715, 'td05', 36, 35, 1),
(716, 'td02', 36, 35, 2),
(717, 'td04', 37, 35, 1),
(718, 'td14', 36, 35, 1),
(719, 'td17', 38, 35, 3),
(720, 'td18', 37, 35, 1),
(721, 'td21', 38, 35, 3),
(722, 'td08', 37, 35, 1),
(723, 'td24', 36, 35, 1),
(724, 'td25', 39, 35, 1),
(725, 'td26', 38, 35, 3),
(726, 'td23', 37, 35, 1),
(727, 'td15', 38, 35, 3),
(728, 'td16', 36, 35, 1),
(729, 'td22', 39, 35, 1),
(730, 'td31', 36, 35, 1),
(731, 'td28', 37, 35, 1),
(732, 'td27', 36, 35, 1),
(733, 'td35', 37, 35, 1),
(734, 'td33', 37, 35, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_additional_task`
--

CREATE TABLE `teacher_additional_task` (
  `id` int(11) NOT NULL,
  `node` varchar(900) DEFAULT NULL,
  `name` varchar(900) DEFAULT NULL,
  `task` varchar(900) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_additional_task`
--

INSERT INTO `teacher_additional_task` (`id`, `node`, `name`, `task`) VALUES
(1, 'td11', 'mala', 'Task 2'),
(2, 'td31', 'mala', 'Task 4'),
(3, 'td22', 'mala', 'Task 3'),
(4, 'td24', 'mala', 'Task 5'),
(5, 'td12', 'mala', 'Leisure Period'),
(6, 'td01', 'mala', 'Office Works'),
(7, 'td14', 'mala', 'Leisure Period'),
(8, 'td16', 'mala', 'Office Works'),
(9, 'td04', 'Rajkumar', 'Office Works'),
(10, 'td36', 'Rajkumar', 'Leisure Period'),
(11, 'td45', 'Rajkumar', 'Leisure Period'),
(12, 'td32', 'Rajkumar', 'misc'),
(13, 'td04', 'Rajkumar', 'Office Works'),
(14, 'td32', 'Rajkumar', 'misc'),
(15, 'td45', 'Rajkumar', 'Leisure Period'),
(16, 'td36', 'Rajkumar', 'Leisure Period'),
(17, 'td31', 'latha', 'Leisure Period'),
(18, 'td44', 'latha', 'Office Works'),
(19, 'td11', 'latha', 'Leisure Period');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_details`
--

CREATE TABLE `teacher_details` (
  `id` int(11) NOT NULL,
  `cand_id` varchar(100) DEFAULT NULL,
  `cand_name` varchar(100) DEFAULT NULL,
  `initial` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `subject` tinytext DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `address` varchar(450) DEFAULT NULL,
  `photo` longtext DEFAULT NULL,
  `last_modified_time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_details`
--

INSERT INTO `teacher_details` (`id`, `cand_id`, `cand_name`, `initial`, `mobile`, `email_id`, `subject`, `qualification`, `address`, `photo`, `last_modified_time`) VALUES
(6, 'AJAY325728', 'Ajay Kumar', 'Mr', '987654321', 'rajakumaran14599@gmail.com', 'Tamil', 'BE', 'pavoorchatram,\nTenkasi,', 'data:image/jpeg;base64,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', '6/7/2022, 8:55:38 AM'),
(7, 'BALA692384', 'Balaji', 'Mr', '95555555555', '', 'Mathematics', '', 'test address', 'https://gelogicproducts.in/admin/TeacherDetails', '6/8/2022, 6:08:05 AM'),
(9, 'RAM675701', 'Ram', 'Mr', '92222222222', '', 'Biology', '', 'test address', 'https://gelogicproducts.in/admin/TeacherDetails', '6/8/2022, 6:09:15 AM'),
(10, 'RAJK404010', 'Rajkumar', 'Mr', '', '', 'Mathematics', 'MSC', '', 'https://gelogicproducts.in/admin/TeacherDetails', '6/8/2022, 6:33:45 AM'),
(11, 'MALA034747', 'mala', 'Mr', '5449', '', 'Tamil', 'sdff', '', 'https://gelogicproducts.in/admin/TeacherDetails', '6/9/2022, 12:16:50 AM'),
(12, 'DFSS085057', 'yyy', 'Mr', '', 'fdasf', 'Mathematics', 'rrr', '', 'https://gelogicproducts.in/admin/TeacherDetails', '6/17/2022, 1:35:54 AM'),
(15, 'RAVI285692', 'Ravi', 'Mr', '', '', 'Mathematics', 'MSc', '', 'https://gelogicproducts.in/admin/TeacherDetails', '6/10/2022, 6:41:13 AM'),
(16, 'KUMA213357', 'Kumar', 'Mr', '', '', 'Biology', '', '', 'https://gelogicproducts.in/admin/TeacherDetails', '6/12/2022, 9:57:16 PM'),
(17, 'KUMA853728', 'kumaran', 'Mr', '00000000', 'rajakumaran14599@gmail.com', 'Chemistry', 'BE', '2/292 pillaiyar kovil street', 'data:image/jpeg;base64,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ueC/c8F+54JhGo852Ezr6PJfueCKwPCCLy2u4Bcwg8r9zwTBNR5z/wCxr//aAAwDAQACAAMAAAAQ88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888889tfvd188888888888888888888888888888888888888888881++++++t888888888888888888888888888888888888888889+62Zq3++t088888888888888888888888888888888888zGNt+/8A/uquv/vvTbv/ADzzzzzzzzzzzzzzzzzzzzzzzzzzzzzx777776LyzzzzzX77765rzzzzzzzzzzzzzzzzzzzzzzzzzzzzzb77XarTfzzzzzz7Bbr3757zzzzzzzzzzzzzzzzzzzzzzzzzzzv777zzzzzzzzzzzzzzyzr77/zzzzzzzzzzzzzzzzzzzzzzzzzzz7nTzzzzzzzzzzzzzzwQ/wB+888888888888888888888888888f+i/j88888888888880649+v888888888888888888888888883+Z928888888888888scnB+7888888888888888888888888889+tuOU8884888888884VdF+9888888888888888888888888882+uvNF084138888888We+++y8888888888888888888888888843++vp9q9+/8APPPPPOHzfvu1PPPPPPPPPPPPPPPPPPPPPPPPPPPO/wD777777XzzzzzyM/777s/zzzzzzzzzzzzzzzzzzzzzzzzzzzzx/H7777JzzzzihCv777l/zzzzzzzzzzzzzzzzzzzzzzzzzzzzzjyDZH3JBBBRgyQCMJetzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzygjjwywpTxTiBRDCsp+TDTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyxy47fwyyxzyzxt6szzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz75fzzzzzzzyv6vzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz75fzzzzzzzyv6vzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz75fzzzzzzzyv6vzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz77/AP8A/wD/AP8A/wD/AP8Aq/PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPvvvvvvvvvvvvq/PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP/wD/AP8A/wD/AP8A/wD/AP8A7/PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPN/OM/M/O888/PM9e/O9/Os+M888+N/PM9PPPPPPPPPPPPPPPPPfeLZvPv0c+8V+P8d5wqvPffEsccv8A7Xz1fzzzzzzzzzzzzzzzz323rzz7/wAop8sfv88cCoz298CTz+/7vb9X88888888888888889+zK88+/8op8uuc888C79798S191/wD+O91/PPPPPPPPPPPPPPPPb/P3fPv/ACinzzVr/j8Krz33wJ//AL//ALFvl/PPPPPPPPPPPPPPPO8PP4XMd/LYvPLlf+TyJPOcuEccZv8AHzzl/wA8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888/8QAIREBAAICAgIDAQEAAAAAAAAAAQAREDEgQDBQIUFwgFH/2gAIAQMBAT8Q/ti5bm2X6xeY16pbzUqfHAa9LeFsvIVj5cK4XLcL9AvIc05D3lyGSmHNlZKyPcXIdFMj23B0X/YNxMHd+oag9Ajg7v1DUN+Zhh13Xgfhh5XBn1g7bw2Qa4LcPAw9KGsLwepTwBzdcgrvJK4h4HXAIFehqUSjxOs16YPC69Sa8Lr1JrwuvUmvC69Sa8Lr8LolEolEolEolEolEolEolH4BZmzFmLJZLJZm5cvFwbxcvFkslkvFmbOk6hhYGTUplYphFxTg4DDeaZTAjrA4dw10XUItwOBrDDfAOIZZFhvNksw6yNx3DXRdZHgaww3wOSmVDeaZTCOsJD4wa6LqGRyaww3lIMslwb4DDebJZLI6ymDXRdQMJKcUwwwM1KlSoFRIYYGKZTKYEdSnNQ/sv8A/8QAIhEAAwACAQUBAQEBAAAAAAAAAAEREDEgITBAQVBRgGBw/9oACAECAQE/EP7YTEEREQP5ZKiU5tUnyUplihXg1fipN4QRZbolTosIE7mIjBpr4C/XJvXNO8n+POT3ltLJA315pxkZE08p78xK8v8AHg/plqeWnTDfQngdXQag1WE6eWtY9mw13oLoJ0NsPXlrC2bD13zFo2w/LWsexDqQ1OE7TYWhLrh68tuC6MavBIPfdG9eWnBdctUSg0ngkWHvmuolD3wb8xOdhuc1snFu+cnBI+L/AB2NuDRDd+DWUUXs7Zr+MNTs7fJe+zt8l77O3yXvs7fJe+zt/wALooooooooooooor/fpUjwupWKxRRRWUmyiPCVGmsJUjxRRRHisxk8HYesJQb9ZeyoTTxA9iYjDl4GxpmCBtQ2wmFo28HYehKDeuD3jY04N3iSlCNGmaKGobZagtG3g7YonB7xsaYXNYVCaZpmCBqbD0N6GqLRt4Ow9CcE6JMveNjTKdQ6Ixfo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', '6/17/2022, 1:32:53 AM'),
(18, 'ABC368150', 'Abc', 'Mrs', '', '', 'Tamil', '', '', 'https://gelogicproducts.in/admin/TeacherDetails', '6/13/2022, 10:11:21 PM'),
(19, 'LATH784966', 'latha', 'Mrs', '', '', 'Physics', 'mca', '', 'https://gelogicproducts.in/admin/TeacherDetails', '6/17/2022, 1:37:47 AM'),
(36, 'VIMA161813', 'Vimal', 'Mr', '08220898671', 'Psvimal33329@gmail.com', '[\"1\",\"2\",\"3\",\"4\",\"5\"]', 'cccc', '1 - i, Valayapathi Street, Vannarpettai', 'http://localhost:8000/admin/TeacherDetails', '8/18/2022, 9:13:35 PM'),
(37, 'RAJA410394', 'Raja', 'Mr', '08220898671', 'Psvimal33329@gmail.com', '[\"1\",\"4\",\"8\"]', 'ssssss', '1 - i, Valayapathi Street, Vannarpettai', 'http://localhost:8000/admin/TeacherDetails', '8/18/2022, 9:18:25 PM'),
(38, 'BANU017174', 'Banu', 'Mrs', '08220898671', 'Psvimal33329@gmail.com', '[\"3\",\"5\",\"8\"]', 'ggggg', '1 - i, Valayapathi Street, Vannarpettai', 'http://localhost:8000/admin/TeacherDetails', '8/19/2022, 7:45:48 PM'),
(39, 'HARI819793', 'Hari', 'Mr', '08220898671', 'Psvimal33329@gmail.com', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"8\"]', 'bbbb', '1 - i, Valayapathi Street, Vannarpettai', 'http://localhost:8000/admin/TeacherDetails', '8/19/2022, 7:48:20 PM');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subjects`
--

CREATE TABLE `teacher_subjects` (
  `id` int(11) NOT NULL,
  `t_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_tasks`
--

CREATE TABLE `teacher_tasks` (
  `id` int(11) NOT NULL,
  `name` varchar(900) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_tasks`
--

INSERT INTO `teacher_tasks` (`id`, `name`) VALUES
(7, 'Leisure Period'),
(8, 'Office Works'),
(9, 'misc');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `user_id` varchar(900) DEFAULT NULL,
  `name` varchar(900) DEFAULT NULL,
  `user_type` varchar(900) DEFAULT NULL,
  `password` varchar(900) DEFAULT NULL,
  `email_id` varchar(256) DEFAULT NULL,
  `last_modified_time` varchar(450) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `name`, `user_type`, `password`, `email_id`, `last_modified_time`) VALUES
(6, 'admin', 'admin', 'Admin', 'D0814A21F099110104AF0B67867C30D6', NULL, '03/25/2021 19:08:13'),
(229, 'AJAY325728', 'Ajay Kumar', 'Staff', '7E0B50A1D5FD57CA56E92621622F018D', 'rajakumaran14599@gmail.com', '6/7/2022, 8:55:38 AM'),
(230, 'RAJI387035', 'raji', 'Student', 'FF7B6AE64FFF9BC01DF42EAB5EAA522D', 'rajakumaran14599@gmail.com', '6/8/2022, 2:58:29 AM'),
(231, 'BALA692384', 'Balaji', 'Staff', '782F985D281AFE5F03D4D90886FB9913', '', '6/8/2022, 6:08:05 AM'),
(233, 'RAM675701', 'Ram', 'Staff', '5C07E8196387BC840D87C69A759C5407', '', '6/8/2022, 6:09:15 AM'),
(234, 'RAVI186495', 'Ravi', 'Student', '00A8CC7DBDD3E53C91788B9240FF5A45', '', '6/8/2022, 6:11:20 AM'),
(236, 'RAJK404010', 'Rajkumar', 'Staff', '45B4D5C89CB4A9454720366451DF8B44', '', '6/8/2022, 6:33:45 AM'),
(237, 'RAJA994556', 'raja', 'Student', '17F501748D48F6E209D7F12C4C7EFEC1', 'rajakumaran14599@gmail.com', '6/8/2022, 7:30:49 AM'),
(238, 'KUMA278041', 'kumaran', 'Student', '7E0B50A1D5FD57CA56E92621622F018D', 'rkumaran368@gmail.com', '6/8/2022, 7:31:36 AM'),
(240, 'RR036985', 'rr', 'Student', '30F66D2BCBF5B0911F652C9FFC420CD0', '', '6/8/2022, 11:33:12 PM'),
(241, 'MALA034747', 'mala', 'Staff', '30F66D2BCBF5B0911F652C9FFC420CD0', '', '6/9/2022, 12:16:50 AM'),
(242, 'DFSS085057', 'yyy', 'Staff', '7E0B50A1D5FD57CA56E92621622F018D', 'fdasf', '6/9/2022, 2:48:49 AM'),
(246, 'RAVI285692', 'Ravi', 'Staff', '8ECD8E17808EBA866331EC4C99A30E2A', '', '6/10/2022, 6:41:13 AM'),
(247, 'GURU496889', 'Guru', 'Student', 'CD7EBAD12EF373404F1EA16C247B556C', '', '6/12/2022, 9:55:29 PM'),
(248, 'KUMA213357', 'Kumar', 'Staff', 'CD7EBAD12EF373404F1EA16C247B556C', '', '6/12/2022, 9:57:16 PM'),
(249, 'KUMA853728', 'kumaran', 'Staff', '17F501748D48F6E209D7F12C4C7EFEC1', 'rajakumaran14599@gmail.com', '6/13/2022, 7:29:46 AM'),
(250, 'ABC368150', 'Abc', 'Staff', 'CD7EBAD12EF373404F1EA16C247B556C', '', '6/13/2022, 10:11:21 PM'),
(251, 'YAZH778643', 'Yazhini', 'Student', 'CD7EBAD12EF373404F1EA16C247B556C', 'toravi.a@gmail.com', '6/13/2022, 10:16:48 PM'),
(252, 'LATH784966', 'latha', 'Staff', 'C0BE94E03990AAC91E7C01B4526994AD', '', '6/17/2022, 1:37:47 AM'),
(253, 'sadmin', 'sadmin', 'sadmin', 'D0814A21F099110104AF0B67867C30D6', NULL, '03/25/2021 19:08:13'),
(254, 'itadmin', 'itadmin', 'itadmin', 'D0814A21F099110104AF0B67867C30D6', NULL, '03/25/2021 19:08:13'),
(255, 'VIMA264807', 'Vimal', 'Student', '5178D2655FEDA06CAAA779752F2FF539', 'test@gmail.com', '8/8/2022, 6:11:49 PM'),
(256, 'TEST125050', 'testuser', 'Student', '5178D2655FEDA06CAAA779752F2FF539', 'test2@gmail.com', '8/9/2022, 7:10:33 PM'),
(257, 'Hari2323', 'Hari2323', 'itadmin', 'D0814A21F099110104AF0B67867C30D6', NULL, NULL),
(258, '630244', '', 'Staff', '7E0B50A1D5FD57CA56E92621622F018D', '', '8/18/2022, 7:49:02 PM'),
(259, 'VIMA984099', 'Vimal', 'Staff', '7E0B50A1D5FD57CA56E92621622F018D', '', '8/18/2022, 7:51:23 PM'),
(260, 'VIMA911162', 'Vimal', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 7:53:11 PM'),
(261, 'VIMA864471', 'Vimal', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 7:54:24 PM'),
(262, 'ASDF946401', 'asdfasdfsdf', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 7:55:42 PM'),
(263, 'VIMA661080', 'Vimal', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 7:58:58 PM'),
(264, 'VIMA124351', 'Vimal', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 8:00:10 PM'),
(265, 'VIMA567916', 'vimal', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 8:03:02 PM'),
(266, 'VIMA869008', 'Vimal', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 8:06:22 PM'),
(267, 'SAAS819292', 'saasdad', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 8:12:55 PM'),
(268, 'VIMA706113', 'Vimalraj', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 8:17:45 PM'),
(269, 'VIMA633165', 'Vimalraj', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 8:18:59 PM'),
(270, 'VIMA030506', 'Vimal', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 8:19:37 PM'),
(271, 'VIMA838847', 'Vimalraj', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 8:20:44 PM'),
(272, 'TEST320149', 'test', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 8:42:20 PM'),
(273, 'VIMA909046', 'Vimalraj', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 8:49:51 PM'),
(274, 'VIMA161813', 'Vimal', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 9:13:35 PM'),
(275, 'RAJA410394', 'Raja', 'Staff', '6B652CF689D8627E911009874F9BE314', 'Psvimal33329@gmail.com', '8/18/2022, 9:18:25 PM'),
(276, 'BANU017174', 'Banu', 'Staff', '316F9EC05DDF9AB468072CCD18DA3D3E', 'Psvimal33329@gmail.com', '8/19/2022, 7:45:48 PM'),
(277, 'HARI819793', 'Hari', 'Staff', 'FF39E5D262DBBD3AF0B0C7A2A305AEFD', 'Psvimal33329@gmail.com', '8/19/2022, 7:48:20 PM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `biometric_details`
--
ALTER TABLE `biometric_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cand_id_index` (`cand_id`);

--
-- Indexes for table `blood_group`
--
ALTER TABLE `blood_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cand_admission_details`
--
ALTER TABLE `cand_admission_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cand_marks_details`
--
ALTER TABLE `cand_marks_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `college_details`
--
ALTER TABLE `college_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `community_details`
--
ALTER TABLE `community_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_details`
--
ALTER TABLE `course_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state_details`
--
ALTER TABLE `state_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_events`
--
ALTER TABLE `student_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_materials`
--
ALTER TABLE `student_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_material_file`
--
ALTER TABLE `student_material_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_meeting`
--
ALTER TABLE `student_meeting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_menu`
--
ALTER TABLE `student_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_time_table`
--
ALTER TABLE `student_time_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_handler`
--
ALTER TABLE `table_handler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_additional_task`
--
ALTER TABLE `teacher_additional_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_details`
--
ALTER TABLE `teacher_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_tasks`
--
ALTER TABLE `teacher_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `_index` (`user_id`(100),`password`(100));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `biometric_details`
--
ALTER TABLE `biometric_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `blood_group`
--
ALTER TABLE `blood_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cand_admission_details`
--
ALTER TABLE `cand_admission_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `cand_marks_details`
--
ALTER TABLE `cand_marks_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `college_details`
--
ALTER TABLE `college_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `community_details`
--
ALTER TABLE `community_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `course_details`
--
ALTER TABLE `course_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `state_details`
--
ALTER TABLE `state_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `student_events`
--
ALTER TABLE `student_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_materials`
--
ALTER TABLE `student_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `student_material_file`
--
ALTER TABLE `student_material_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_meeting`
--
ALTER TABLE `student_meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `student_menu`
--
ALTER TABLE `student_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `student_time_table`
--
ALTER TABLE `student_time_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `table_handler`
--
ALTER TABLE `table_handler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=735;

--
-- AUTO_INCREMENT for table `teacher_additional_task`
--
ALTER TABLE `teacher_additional_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `teacher_details`
--
ALTER TABLE `teacher_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_tasks`
--
ALTER TABLE `teacher_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
