-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220911.e96fab654d
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2022 at 04:17 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stackuncontrol`
--

-- --------------------------------------------------------

--
-- Table structure for table `askquestion`
--

CREATE TABLE `askquestion` (
  `queid` int(5) NOT NULL,
  `title` mediumtext NOT NULL,
  `detailsque` mediumtext NOT NULL,
  `userid` int(5) NOT NULL,
  `ranqueid` varchar(5) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `askquestion`
--

INSERT INTO `askquestion` (`queid`, `title`, `detailsque`, `userid`, `ranqueid`, `time`) VALUES
(1, 'How to disable button when textbox is empty in javascript?', '<p>my code:</p><div class=\"ps-relative p0 ws-normal ow-normal\">\r\n        <div class=\"ps-absolute t2 r4 fs-fine pe-none us-none fc-black-300 js-language-indicator\" contenteditable=\"false\">plaintext</div>\r\n        <div class=\"d-flex ps-absolute t0 r0 js-processor-toggle d-none\">\r\n            <label class=\"flex--item mr4\" for=\"js-editor-toggle-4927\">\r\n                Edit\r\n            </label>\r\n            <div class=\"flex--item s-toggle-switch\">\r\n                <input class=\"js-processor-is-editing\" id=\"js-editor-toggle-4927\" type=\"checkbox\">\r\n                <div class=\"s-toggle-switch--indicator\"></div>\r\n            </div>\r\n        </div>\r\n        <div class=\"d-none js-processor-view\"></div>\r\n        <pre class=\"s-code-block js-code-view js-code-mode\"><code class=\"content-dom\">&lt;html&gt;\r\n&lt;head&gt;&lt;title&gt;Document&lt;/title&gt;&lt;/head&gt;\r\n&lt;body&gt;&lt;/body&gt;\r\n&lt;/html&gt;</code></pre></div><p><br class=\"ProseMirror-trailingBreak\"></p>', 3, 'JRex0', '2022-12-22 14:45:36'),
(2, 'How to disable button when textbox is empty in javascript? 2', '<p>my code:</p><div class=\"ps-relative p0 ws-normal ow-normal\">\r\n        <div class=\"ps-absolute t2 r4 fs-fine pe-none us-none fc-black-300 js-language-indicator\" contenteditable=\"false\">plaintext</div>\r\n        <div class=\"d-flex ps-absolute t0 r0 js-processor-toggle d-none\">\r\n            <label class=\"flex--item mr4\" for=\"js-editor-toggle-2452\">\r\n                Edit\r\n            </label>\r\n            <div class=\"flex--item s-toggle-switch\">\r\n                <input class=\"js-processor-is-editing\" id=\"js-editor-toggle-2452\" type=\"checkbox\">\r\n                <div class=\"s-toggle-switch--indicator\"></div>\r\n            </div>\r\n        </div>\r\n        <div class=\"d-none js-processor-view\"></div>\r\n        <pre class=\"s-code-block js-code-view js-code-mode\"><code class=\"content-dom\">&lt;html&gt;\r\n&lt;head&gt;&lt;title&gt;Document&lt;/title&gt;&lt;/head&gt;\r\n&lt;body&gt;&lt;/body&gt;\r\n&lt;/html&gt;</code></pre></div>', 2, 'V4bpR', '2022-12-22 15:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cno` varchar(12) NOT NULL,
  `description` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `cno`, `description`, `time`) VALUES
(1, 'mayank', 'mayank1@gmail.com', '9988776655', 'Hii there!!', '2022-11-07 06:33:50'),
(2, 'Ram', 'ram1@gmail.com', '9988776644', 'Hii there!!', '2022-11-07 11:26:53');

-- --------------------------------------------------------

--
-- Table structure for table `editqadata`
--

CREATE TABLE `editqadata` (
  `id` int(5) NOT NULL,
  `editqadetails` mediumtext NOT NULL,
  `editqauname` varchar(15) NOT NULL,
  `ranqueid` int(5) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `postid` int(5) NOT NULL,
  `postDetail` mediumtext NOT NULL,
  `postuname` varchar(15) NOT NULL,
  `ranqueid` varchar(5) NOT NULL,
  `ranpostid` varchar(5) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`postid`, `postDetail`, `postuname`, `ranqueid`, `ranpostid`, `time`) VALUES
(2, '<p>This is awesome question i ever think. 2</p>', 'Ram', 'JRex0', 'o2fvZ', '2022-12-23 02:22:05'),
(3, '<p>This is awesome question i ever think. 3</p>', 'Ram', 'JRex0', 'ZPkaU', '2022-12-24 03:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `userid` int(5) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(15) NOT NULL,
  `aboutme` varchar(100) DEFAULT 'Tell us about yourself',
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`userid`, `username`, `email`, `pass`, `aboutme`, `time`) VALUES
(1, 'Mayank', 'mayank@gmail.com', '12', 'Hii there!', '2022-12-19 04:49:45'),
(2, 'Ram', 'ram@gmail.com', '12', 'Hii there!', '2022-12-24 03:31:47'),
(3, 'Krishna', 'krish@gmail.com', '12', 'Tell us about yourself', '2022-12-08 04:12:24'),
(4, 'Radha', 'radha@gmail.com', '12', 'Tell us about yourself', '2022-12-08 04:15:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `askquestion`
--
ALTER TABLE `askquestion`
  ADD PRIMARY KEY (`queid`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`postid`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `askquestion`
--
ALTER TABLE `askquestion`
  MODIFY `queid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `postid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `userid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
