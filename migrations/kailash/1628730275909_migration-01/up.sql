CREATE TABLE Clients."Customer_01" (
	  "id" integer PRIMARY KEY uuid NOT NULL,
	  "customer_name" char(50) NOT NULL
);
 
CREATE TABLE Jira."JiraInstance_01" (
	  "id" integer PRIMARY KEY uuid NOT NULL,
	  "instance_name" char(50) uuid NOT NULL,
	  "instance_url" char(250) uuid NOT NULL,
	  "user_name" char(150) uuid NOT NULL,
	  "access_token" char(150) uuid NOT NULL,
	  "customer_id" integer uuid NOT NULL
);
	  
