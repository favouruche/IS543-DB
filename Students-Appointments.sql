-- Students and Appointments Table Creation

CREATE TABLE Students (
	Stu_ID VARCHAR2(15) CONSTRAINT student_pk PRIMARY KEY,
	Stu_Fname VARCHAR2(25),
	Stu_Lname VARCHAR2(25),
	Stu_Major VARCHAR2(20),
	Stu_Sex CHAR(1),
	Stu_Eth VARCHAR2(15));


CREATE TABLE Appointments (
	Apt_ID VARCHAR2(4) CONSTRAINT appointment_pk PRIMARY KEY,
	Tut_ID VARCHAR2(4) CONSTRAINT Tut_ID_FK REFERENCES Tutor (Tut_ID),
	Stu_ID VARCHAR2(15) CONSTRAINT Stu_ID_FK REFERENCES Students (Stu_ID),
	Apt_Date DATE,
	Apt_Time TIME,
	Apt_NoShow CHAR(1));
	


