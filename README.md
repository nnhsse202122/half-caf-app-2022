# half-caf-web-app
Group Members: Nathan, Naglis, David, Aadi

Group Members v2: Grace, Jessica, Kasey, Owen

nnhshalfcaf.com


## Insights

Do not turn to any of those "easy web app maker" sites and source their code. We tried this for the first sprint and a half, and ultimately we discovered that the coding conventions are so diverse that none of the tutorial code or prior knowledge you have gained applies. It takes longer to understand and modify this code to your needs than it does to make your own web app with your obtained knowledge.

Make sure everyone is on the same page throughout the course of the semester. Take your stand-up meeting times to make sure everyone understands the concepts and has everything they need to work on their assigned tasks. It is okay to slow down to have somebody catch up because by the end of the project it will be a lot more efficient and helpful to have them on the same page.

Create a schedule and stick to it (google calendar is a great tool for this). When writing the code for the website, unknown issues frequently come up. In order to ensure that you have enough time to finish a sprint, leave yourself time at the end of each sprint to tie up loose ends.

Use pair programming to your advantage. Just because it may seem faster to divide and conquer in terms of being able to get tasks done doesnt mean it necessarily is. Having a second set of eyes to catch errors and talk things through with can be extremely beneficial and save you tons of time in the long run.

## Virtual environments

Know how to create virtual environments. A virtual environment is essential because it isolates the Flask downloads from the rest of the computer files. This ultimately prevents countless problems from occurring. Always do your Flask related downloads in a virtual environment and run the app in the virtual environment. Make your virtual enviroment in the Web-App directory.

```
$ python3 -m venv venv
$ source venv/bin/activate
```

The first line of code is run once when you first clone the repository to your computer. Run the second line of code to activate the virtual environment on your computer every new terminal window.
Your tutorial goes into specifics, only use this page for quick and easy access to those lines of code. Be sure to look into the specifics of virtual environments in your tutorial.

once in your virtual enviroment, type the following in your command line:

```
docker-compose up --build db
docker-compose up --build webapp
```

the first of these 2 lines of code must be run every time something is changed in the database. The second line is used every time you would like to run the web app.

After running it, proceed to your browser and go to "localhost" to see the running webapp.

## Git

Git workflows: https://www.google.com/url?q=https://docs.google.com/document/d/1eWng-q4m3h4TwRcapSAPxexKST6AjQMfA9iVv2GRnwM/edit?usp%3Dsharing&sa=D&ust=1559225309220000

### Models (Database)
Record - Entry in a table
SQLite - A form of database used for testing that will only save the content of the database to a file called app.db inside the app
MySQL - The type of database used on the production server which is a real database that can be accessed from any instance of the app
Model - A class in models.py which will define a table in the SQLite or MySQL database

A database is a collection of tables with the name of the item or "model" each record represents. Each table has columns, each of with having a data type and a name. Every table will have an ID column which is used to identify the individual records in the table.


__tablename__ - The name you can use to reference this table anywhere else in this file
id - The only column every table will have, always a db.Integer

The __repr__ function tells python how to print a record from the table. This example would print "Example David" or "Example Nathan"

```python
class Example(db.Model):

    __tablename__ = 'example'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), index=True)
    otherModel = db.relationship('Other Model', backref='example', foreign_keys='[OtherModel.order_id]')

    def __repr__(self):
            return '<Example {}>'.format(self.name)
```

### Routes
Each function in the routes.py file is a view function. View functions are basically the code that the page you are viewing is running on.

The @bp.route decorator tells Flask that this function will be used as the view function for the page specified in the render_template function.

The model variable is an example of how you can query the database in the view function and pass it as a variable to later be accessed in the templating code on that page.

```python
@bp.route('/', methods=['GET', 'POST'])
@bp.route('/example, methods=['GET', 'POST'])
def example():
        model = Model.query.all()

        return render_template('example.html', title=Example Page', model=model)
```

### Forms

The only thing about forms that we used that was not covered in the tutorial is the dynamically populated fields. 

In the init function, you call super then set each field's choices as the items coerced from the database with a for loop in the format shown.

```python
class ExForm(FlaskForm):
    dynamicField= SelectField(u'Things', coerce=str)

    submit = SubmitField('Submitr')

    def __init__(self):
        super(Form, self).__init__()

        self.dynamicField.choices = [(m.id, m.name) for m in Model.query.order_by(Model.id)]
```


### Jinja (Templating Language)
This link has everything you need to know
https://pythonprogramming.net/bootstrap-jinja-templates-flask/

### CSS / Bootstrap
All of the styling of an HTML document is set by code written in a language called CSS (Cascading Style Sheets). With CSS code, you can set every aspect of the styling (colors, size, elements, features) of either an entire page of the web app, or a portion of a page. Bootstrap is the most popular CSS and HTML framework.

If order to style a page, you need to set a &lt;style&gt; html tag within the head of your html page and define some properties of the  page within it. For example:

```html
<style>
	margin = 10px;
	color = #F0F8FF;
</style>
```

This is the exact styling used on our "layout" template, meaning if the html page "layout" was displayed, the page margin would be 10 pixels and the color associated with the HEX value of #F0F8FF, which is "Alice Blue" (link for all color Hex tags linked below).

All colors and Hex tags recognized in CSS: https://www.w3schools.com/colors/colors_names.asp

Now if you look at the rest of our HTML template pages, they all extend "layout". This means the styling of the "layout" page applies to all pages extending it as well. However, simply adding a new style tag in the head of a page extending "layout" would override the styling of "layout".

If you don't want to style the whole page and only certain elements within the page, use a method called in line styling. Essentially, you can add &lt;div&gt; tags around the element you would like to style and then add CSS code for that element within the div tag.
	
## Docker

Docker is the shell-like container that holds the webapp so that we can easily deploy it onto Amazon Web Services. However, we have two main docker containers that we are combining using docker-compose. You shouldn't have to modify the docker container files at all unless additional features added somehow interfere. However, when you add new code to your local machine, you need to migrate the code to the database container by using the command docker db migrate (if changes are made to the db). Instead of using flask run to run the program, you will now run the changes that you made through the docker container using docker-compose up --build when starting your machine or after making changes. If you have already run this command but want to rerun it, you can use docker-compose up to run it quicker. Then upload the newly made changes from the docker container into AWS. You will need to reference Mr.Schmit for this part.

Essential lines of code include:

- STARTING APP (WHEN YOU FIRST LOG ON)
Run each command in a different terminal window (do not have to be in your virtual  environment)
	```
	docker-compose up --build db 
	docker-compose up --build webapp
	```

- Allows user to enter the executive container in order to execute certain commands
	```
	docker-compose exec webapp /bin/sh
	```

- Rebuild the MYSQL container and recreate from scratch. Use this when you make changes to the db container before building the container again. Leave out -d to see it run	
	```
	docker-compose up -d --build --force-recreate --renew-anon-volumes db
	```

- Stops ALL docker containers running	
	```
	docker-compose stop
	```

-Use to upload changes to the docker containers database (in place of flask db migrate/upgrade
	```
	docker db migrate 
	docker db upgrade
	```
	
## Requirements.txt
Specifies the versions of all the different modules that have been imported/used within the code

Essential Lines of code:

-Do this to install/ create the requirements document (only do once in the beginning)
	```
	pip install -r requirements.txt
	```
- Do this if you import anything new to automatically update your requirement.txt file to the newest version	
	```
	pip freeze > requirements.txt
	```
	

## Backup.sql
This file holds all the hardcoded database information regarding the website in case the database is ever wiped

Essential lines of code:

docker exec CONTAINER /usr/bin/mysqldump -u root --password=root DATABASE > backup.sql

	Creates and/or updates backup file for database
	
cat backup.sql | docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE

	Restore file for database on a machine

## Things for repairing

use /supersecretpage to register any types of users.
This is a way to get around activating accounts manually.
If you get locked out, start here.

## Moving Forward… 
Easy things that could be improved with the website
-Styling, it is a very basic look right now and with some added CSS and bootstrap it can look pretty great (add logo)

Harder things
-improve funtionality of modify drinks page for all aspects of a drink not just flavors
-email/notification sent to admin when a user registers so that Mr.Skarr knows when to activate them
-have a way to store information to show trends to Mr.Skarr of what people are buying
-Potentially show inventory of specific ingredients and after each order is made baristas would be able to enter it, and Mr.Skarr would know when to buy more
-password reset option for teachers
-email/notification sent to barista when order is made


## Production Server

#### Initial Setup:

1. Build the webapp image on the local development machine (not the EC2 instance):
	`docker-compose build webapp`
2. Save the built image:
	`docker save <image name> > halfcafwebapp.tar`
3. Create an [AWS EC2 instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html) running an Ubuntu Server
	* don't change any of the default settings while stepping through the wizard except to add HTTP and HTTPS to the security group when stepping through the wizard
4. Click the Connect button in the EC2 dashboard. Follow the instructions. You will need to have the private key in order to ssh into the instance.
5. On the EC2 instance, install nginx:
	`sudo apt-get -y install nginx`
6. Remove the default site:
	`sudo rm /etc/nginx/sites-enabled/default`
7. Create a reverse proxy for the Half Caf flask server. In the file /etc/nginx/sites-enabled/nnhshalfcaf:

    server {
		# listen on port 80 (http)
		listen 80;
		server_name nnhshalfcaf.com;
		# not sure if the rest of this block is needed now that the nginx plugin is being used for certbot
		location ~ /.well-known {
			root /home/ubuntu/.well-known;
		}
    	location / {
			# redirect any requests to the same URL but on https
			return 301 https://$host$request_uri;
		}
	}
	server {
		# listen on port 443 (https)
		listen 443 ssl;
		server_name nnhshalfcaf.com;

		# write access and error logs to /var/log
		access_log /var/log/nnhshalfcaf_access.log;
		error_log /var/log/nnhshalfcaf_error.log;

		location / {
			# forward application requests to the gunicorn server
			proxy_pass http://localhost:5000;
			proxy_redirect off;
			proxy_set_header Host $host;
			proxy_set_header X-Real-IP $remote_addr;
			proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		}

		#location /static {
			# handle static files directly, without forwarding to the application
		#    alias /home/ubuntu/microblog/app/static;
		#    expires 30d;
		#}
	}
8. Restart the nginx server:
	`sudo service nginx reload`
9. [Install certbot](https://itnext.io/node-express-letsencrypt-generate-a-free-ssl-certificate-and-run-an-https-server-in-5-minutes-a730fbe528ca) to automate the generation and maintenance of SSL certificates so HTTPS works:
	`sudo add-apt-repository ppa:certbot/certbot`
	`sudo apt-get update`
	`sudo apt-get install certbot python3-certbot-nginx`
10. Generate an SSL certificate:
	`sudo certbot --nginx`
	*specify nnhshalfcaf.com as the domain name*
16. [Generate SSH keys for GitHub](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent). Don't enter a passphrase.
17. clone this repository from GitHub
18. [Install docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/) from its repository
19. [Install docker compose](https://docs.docker.com/compose/install/).
20. create the .env file in the Web-App folder:
	`SECRET_KEY=<secret key>`
	`DATABASE_URL=mysql+pymysql://halfcafmysql:<password>@db/nnhshalfcaf`
21. From the local machine, copy the tar file to the EC2 instance:	
	`scp -i half-caf-server.pem halfcafwebapp.tar ubuntu@<domain name>:/home/ubuntu/halfcafwebapp.tar`
22. In the EC2 instance, load the image:
	`cat halfcafwebapp.tar | sudo docker load`
23. Then tag the image (use docker images to see all images and their IDs):
	`sudo docker tag <image id> nnhsse/half-caf:<tag>`
24. Edit the docker-compose.yml to refer to the tagged image. Replace:
	`build: ./Web-App`
	with:
	`image: nnhsse/half-caf:<tag>`
25. start the container for the database, building it from scratch, `sudo docker-compose up --build --force-recreate --renew-anon-volumes db`
26. start the container for the webapp: `sudo docker-compose up webapp`
27. initialize the database with default values:
	`cat backup.sql | sudo docker exec -i half-caf-web-app_db_1 /usr/bin/mysql -u halfcafmysql --password=<password> nnhshalfcaf`


#### Connecting to the EC2 Instance:
1. Click the Connect button in the EC2 dashboard. Follow the instructions. You will need to have the private key in order to ssh into the instance.


#### Updating code on the EC2 instance:
1. Build the webapp image on the local development machine (not the EC2 instance):
	`docker-compose build webapp`
2. Save the built image:
	`docker save <image name> > halfcafwebapp.tar`
3. From the local machine, copy the tar file to the EC2 instance:	
	`scp -i half-caf-server.pem halfcafwebapp.tar ubuntu@<domain name>:/home/ubuntu/halfcafwebapp.tar`
4. In the EC2 instance, load the image:
	`cat halfcafwebapp.tar | sudo docker load`
5. Then tag the image (use docker images to see all images and their IDs):
	`sudo docker tag <image id> nnhsse/half-caf:<tag>`
6. On the EC2 instance discard changes to the docker-compose.ym file:
	`git checkout -- docker-compose.yml`
7. Pull the latest code from master:
	`git pull`
8. Re-edit the docker-compose.yml to refer to the tagged image. Replace:
	`build: ./Web-App`
	with:
	`image: nnhsse/half-caf:<tag>`
9. start the container for the database:
	`sudo docker-compose up --build db`
10. start the container for the webapp:
	`sudo docker-compose up webapp`




## ESSENTIAL LINES OF CODE AND COMMANDS

<style>
#tips {
  border-collapse: collapse;
  width: 100%;
}

#tips td, #tips th {
  border: 1px solid #ddd;
  padding: 8px;
}

#tips tr:nth-child(even){background-color: #f2f2f2;}

#tips tr:hover {background-color: #ddd;}

#tips th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
<table id="tips">
  <tr>
    <td>code</td>
    <td>where it's used</td>
    <td>what it does/when to use</td>
  </tr>
  <tr>
    <td>1. shift command P → select interpreter (python 3 venv)
2. shift command P →  integrated terminal</td>
    <td>VS Code</td>
    <td>DO THIS RIGHT WHEN YOU START VS CODE!</td>
  </tr>
  <tr>
    <td>flask run</td>
    <td>terminal</td>
    <td>Runs the web app</td>
  </tr>
  <tr>
    <td>flask db migrate
flask db upgrade</td>
    <td>terminal</td>
    <td>Use whenever you modify the database to upload the changes</td>
  </tr>
  <tr>
    <td>db.session.commit()</td>
    <td>routes, forms</td>
    <td>Commits changes to the database</td>
  </tr>
  <tr>
    <td>docker-compose up --build db
docker-compose up --build webapp</td>
    <td>terminal (docker)</td>
    <td>STARTING APP (WHEN YOU FIRST LOG ON)
Run each command in a different terminal window (do not have to be in your virtual  environment)</td>
  </tr>
  <tr>
    <td>docker-compose exec webapp /bin/sh</td>
    <td>terminal (docker)</td>
    <td>Allows user to enter the executive container in order to execute certain commands</td>
  </tr>
  <tr>
    <td>docker-compose up --build</td>
    <td>Terminal (docker)</td>
    <td>Builds and runs the docker container. Can build individual containers by adding the container name at the end.</td>
  </tr>
  <tr>
    <td>docker-compose up</td>
    <td>Terminal (docker)</td>
    <td>Use to run the webapp if you have already built container and have not made any changes</td>
  </tr>
  <tr>
    <td>docker-compose up -d --build --force-recreate --renew-anon-volumes db</td>
    <td>Terminal (docker)</td>
    <td>Rebuild the MYSQL container and recreate from scratch. Use this when you make changes to the db container before building the container again. Leave out -d to see it run</td>
  </tr>
  <tr>
    <td>docker-compose stop</td>
    <td>Terminal (docker)</td>
    <td>Stops ALL docker containers running</td>
  </tr>
  <tr>
    <td>docker db migrate
docker db upgrade</td>
    <td>Terminal 
 </td>
    <td>Use to upload changes to the docker containers database (in place of flask db migrate/upgrade)</td>
  </tr>
  <tr>
    <td>pip install -r requirements.txt</td>
    <td>Terminal</td>
    <td>Do this to install/ create the requirements document (only do once in the beginning)</td>
  </tr>
  <tr>
    <td>pip freeze > requirements.txt</td>
    <td>Terminal</td>
    <td>Do this if you import anything new to automatically update your requirement.txt file to the newest version</td>
  </tr>
  <tr>
    <td>docker exec CONTAINER /usr/bin/mysqldump -u root --password=root DATABASE > backup.sql</td>
    <td>Terminal</td>
    <td>Creates and/or updates backup file for database</td>
  </tr>
  <tr>
    <td>cat backup.sql | docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE</td>
    <td>Terminal</td>
    <td>Restore file for database on a machine</td>
  </tr>
  <tr>
    <td>Open the terminal
Secure shell into the existing server
Ls
Cd nnhshalfcaf.com
Ls
Cd tmp
Ls
Touch restart
Touch restart.txt</td>
    <td>Terminal</td>
    <td>Restart old nnhsCaf server</td>
  </tr>
</table>


## HALF CAF WEB APP STRUCTURE

### models.py

Where all the tables in the database are created as classes. Add new columns/tables to the database here. Must do "docker db migrate" & "docker db upgrade" in the terminal afterward to update the database.

### forms.py

This is where you make all of the buttons, text fields, select fields, etc. This works using the HTML templates.

### routes.py

Handles interactions between the user and the webpage. This is where everything is connected (forms, models, etc). This is where you read information from the site (e.g. which button was pressed or if a checkmark is selected) and do things with the info like modify the database (make sure to use db.session.commit()!!!). Once you're done, reroute the user to a different page (or to the same one to refresh).

### Templates

HTML templates for page designs/structures.

**Requirements.txt**

Specifies the versions of all the different modules that have been imported/used within the code

**Docker-Compose.yml**

Initializes container that includes both Dockerfile and database

* Uses mysql

* Container  name: webapp

* Root password: halfcafwebappadmins123

**Init.sql**

Creates and Initializes database

	Database name: nnhshalfcaf

Creates and grants all privileges to user

	Username: halfcafmysql

	Password: halfcafwebappadmins123

**Dockerfile**

Initializes container by running set commands

COPY: copies files

RUN: runs files

**.env**

Creates a secret key and initializes database url

DATABASE_URL=mysql+pymysql://username:password@db/databasename

Accessed through config.py

## NOTES

**Docker**

Docker is the shell-like container that holds the webapp so that we can easily deploy it onto Amazon Web Services. However, we have two main docker containers that we are combining using docker-compose. You shouldn't have to modify the docker container files at all unless additional features added somehow interfere. However, when you add new code to your local machine, you need to migrate the code to the database container by using the command *docker db migrate *(if changes are made to the db). Instead of using flask run to run the program, you will now run the changes that you made through the docker container using *docker-compose up --build *when starting your machine or after making changes. If you have already run this command but want to rerun it, you can use *docker-compose up *to run it quicker. Then upload the newly made changes from the docker container into AWS. You will need to reference Mr.Schmit for this part.

**DrinksToFlavor**

This is an object created to designate what flavors belong to what drink. Each object has two parts, saying a drink and a flavor. This means that there would be a bunch of DrinkToFlavor objects for a singular drink, and if you collected all of them it would display what flavors belong to what drink, which is what we do in the modify drink page.







