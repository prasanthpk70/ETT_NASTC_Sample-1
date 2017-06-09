# ETT_NASTC_Sample

Introduction:

Each NASTC members who files their return with ExpressTruckTax will be verified. To achieve this we use "NASTC API" and "NASTC Web Client"

Requirements:

OS: Windows 7 or Higher
IDE: Visual Studio 2013
Core Framework: Dot.Net
Database: SQL Server 2014

NASTC API:

This is the API we will use to communicate with the Database for the NASTC Member details.

From Web client, requests will be posted to API and then the API will send back the results whether the member details entered by the user are valid or not.

NASTC Web Client:

The Web Client will have a screen to input the membership details. Data entered here will be forwarded to API and the API will send back the results whether the member exists or not.

Configuration:

We have a database file in App Data folder. Please add it to your SQL Server and change the credentials in connectoin string.
Also script file is there in App data folder, if you find difficult to add .mdf file means, please use ETT_NASTC_Script to create Database in your server.

First run the API project and then run the Web client project.

1.NASTC.Web.API
2.NASTC.Web.Client 

Second you can see a Page  "NASTC Member Verification" when you run NASTC.Web.Client project, in that page enter the below listed test data
to check the memeber verification process.

We have added some test data in Member table already. So please use below test data for it.

Example 1: 
Membership Id: 112536
First Name: William
Last Name: Osborn
Company Name: Great Land Company

Please enter this data and check it will verify the member data successful.

