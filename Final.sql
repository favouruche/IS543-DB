-- IS 443/543 Database Design | Term Project
-- Fall 2017
-- Joshua Faust, Juble Lacy, Favour Ojika, Alex Ardolf
-- <last revised date> 12:36pm Oct. 23rd, 2017
-- Term project
-- Tested at: https://livesql.oracle.com

-- Table Cleanup for Testing Purposes:
DROP TABLE Students;
DROP TABLE Appointments;
DROP TABLE Student_Requests;
DROP TABLE Courses;
DROP TABLE Tutor;
DROP TABLE Avail;


-- Students Table
CREATE TABLE Students (
	Stu_ID VARCHAR2(15) CONSTRAINT student_pk PRIMARY KEY,
	Stu_Fname VARCHAR2(25),
	Stu_Lname VARCHAR2(25),
	Stu_Major VARCHAR2(20),
	Stu_Sex VARCHAR2(1),
	Stu_Eth VARCHAR2(15));

-- Course table
CREATE TABLE Courses (
	Crs_ID VARCHAR2 (4) CONSTRAINT COURSE_ID_PK PRIMARY KEY,
	Crs_Name VARCHAR2 (20),
	Crs_Desc VARCHAR2 (100),
	Crs_Date DATE,
	--TIME VARCHAR2(4),
	Crs_Sem VARCHAR2(10));

-- Tutor Table
CREATE TABLE Tutor(
	Tut_ID VARCHAR2(5) CONSTRAINT tutor_pk PRIMARY KEY,
	Stu_ID VARCHAR2(15) CONSTRAINT TUT_STU_FK REFERENCES Students (Stu_ID));
	
-- Appointments Table
CREATE TABLE Appointments (
	Apt_ID VARCHAR2(4) CONSTRAINT appointment_pk PRIMARY KEY,
	Tut_ID VARCHAR2(5) CONSTRAINT APT_TUT_FK REFERENCES Tutor(Tut_ID),
	Stu_ID VARCHAR2(15) CONSTRAINT APT_STU_FK REFERENCES Students(Stu_ID),
	Apt_Date DATE,
	--Apt_Time TIME(HH:SS),
	Apt_NoShow VARCHAR2(1));
	
-- Student Requests Table
CREATE TABLE Student_Requests(
	Req_ID VARCHAR2(10) CONSTRAINT requests_pk PRIMARY KEY,
	Stu_ID VARCHAR2(15) CONSTRAINT REQ_STU_FK REFERENCES Students(Stu_ID),
	Crs_ID 	VARCHAR2(4) CONSTRAINT REQ_CRS_FK REFERENCES Courses(CRS_ID),
	Comments VARCHAR2(200));
	
-- Availability Table
CREATE TABLE Avail(
	Avail_ID VARCHAR2(5) CONSTRAINT avail_pk PRIMARY KEY,
	Tut_ID VARCHAR2(5) CONSTRAINT AVAIL_TUT_FK REFERENCES Tutor(Tut_ID),
	Avail_Date DATE,
	--Avail_Time  TIME,
	Crs_ID VARCHAR2(4) CONSTRAINT AVAIL_CRS_FK REFERENCES Courses(Crs_ID));
	
