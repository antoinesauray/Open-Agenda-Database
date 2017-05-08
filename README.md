# Open Agenda Database
Open-Agenda is a Software to manage big quantities of collaborative agendas  
[Link to API](https://github.com/antoinesauray/Open-Agenda-API)   
## Open Agenda Central Database  
### What is the Central database ?
The Central databas hosts the Users data. It also references Providers to distribute agendas (see below)
The code is made for **SQL Server** (tested on Microsoft Azure)  
### How to use
* Open the Visual Studio project
* Publish the project to a SQL Server instance

## Open Agenda Provider Database (Optional)
The code is made for **SQL Server** (tested on Microsoft Azure)  
### What is a Provider ?
A Provider is an autonomous hosted Database that contains data for agendas. It has  
* Entities which are Agendas holders
* Agendas which provide Events
* Events which are what we look to distribute  
A provider manages the user access on his own. It can be referenced to the [Open Agenda Database](https://github.com/antoinesauray/Open-Agenda-Database)
### How to use
* Open the Visual Studio project
* Publish the project to a SQL Server instance
* Reference it in a Open Agenda Database to make it useable