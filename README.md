# ETT_NASTC_Sample

Introduction:

Each NASTC members who files their return with ExpressTruckTax will be verified. To achieve this we use "NASTC API" and "NASTC Web Client"

Requirements:

OS: Windows 7 or Higher
IDE: Visual Studio 2013
Core Framework: Dot.Net
Database: SQL Server 2014

NASTC API (NASTC.Web.API):

This is the API we will use to communicate with the Database for the NASTC Member details.

From Web client, requests will be posted to API and then the API will send back the results whether the member details entered by the user are valid or not.

NASTC Web Client (NASTC.Web.Client):

The Web Client will have a screen to input the membership details. Data entered here will be forwarded to API and the API will send back the results whether the member exists or not.

Configuration:

The database file () and SQL script (ETT_NASTC_Script.sql) is included in the App Data folder. Please attach the DB to your SQL Server and change the connectoin string. 

Step 1: Run the API project and then run the Web client project.

Step 2: Run the client project and open the Page "NASTC Member Verification" to test the app.

We have added test data in Member table. Please use following test data.

Membership Id: 112536
First Name: William
Last Name: Osborn
Company Name: Great Land Company

Please enter this data and check it will verify the member data successful.

