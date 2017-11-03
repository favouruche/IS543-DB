-- IS 443/543 Database Design | Term Project
-- Fall 2017
-- Joshua Faust, Juble Lacy, Favour Ojika, Alex Ardolf
-- <last revised date> 12:36pm Oct. 23rd, 2017
-- Term project
-- Tested at: https://livesql.oracle.com

-- Table Cleanup for Testing Purposes:

DROP Students;
DROP Appointments;
DROP Student_Requests;

-- Students Table
CREATE TABLE Students (
	Stu_ID VARCHAR2(15) CONSTRAINT student_pk PRIMARY KEY,
	Stu_Fname VARCHAR2(25),
	Stu_Lname VARCHAR2(25),
	Stu_Major VARCHAR2(20),
	Stu_Sex CHAR(1),
	Stu_Eth VARCHAR2(15));

-- Appointments Table
CREATE TABLE Appointments (
	Apt_ID VARCHAR2(4) CONSTRAINT appointment_pk PRIMARY KEY,
	Tut_ID VARCHAR2(4) CONSTRAINT Tut_ID_FK REFERENCES Tutor (Tut_ID),
	Stu_ID VARCHAR2(15) CONSTRAINT Stu_ID_FK REFERENCES Students (Stu_ID),
	Apt_Date DATE,
	Apt_Time TIME,
	Apt_NoShow CHAR(1));
	
-- Student Requests Table
CREATE TABLE Student_Requests(
	Req_ID VARCHAR2(10),
	Stu_ID VARCHAR2(15) CONSTRAINT STU_ID_FK REFERENCES (STU_ID),
	COURSE_ID NUMBER(7) CONSTRAINT COURSE_ID_FK REFERENCES (COURSE_ID),
	COMMENTS VARCHAR2(200));