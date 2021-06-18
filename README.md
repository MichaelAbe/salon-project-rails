# README
# Style Salon 


An app designed to allow a sophisticated conduit between a customer and a salon. A user can signup by entering their email address or using a google account(omniauth). Once signed in a user is able to schedule or edit an existing an appointment.


## Installation

System dependencies run:
```bash
'bundle install'
```

Database creation:  already created

Database initialization run 
```bash
'rails db:migrate'
```
To set up omniauth go to https://console.developers.google.com/ and follow instructions. After receiving a client id and a client secret, set up .env file to add it to and for use of gitignore

Run 
```bash
'rails s'
```
"rails s" command in terminal and visit http://localhost:3000/ to interact with the application

## Usage

Create profile

Access list of available stylists

Use dropdown to select time/date and type of appointment 
 
Full crud capability to Create, Read, Update, and Delete appointment

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)

