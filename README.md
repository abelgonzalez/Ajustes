<h1 align="center">
  <img 
    src="./Doc/home.jpg"
  />
  <p> 🧑‍🎓👩‍🎓 Ajustes </p>
</h1>

---
<br>

<h1 align="center">
  <img 
    src="./Doc/demo.gif"
  />
</h1>

---
## 🧾 About
**Ajustes** is a Python-Django project to facilitate the process of adjusting curricula in Universities. This project was part of my Engineeer thesis and was tested at Universidad de Matanzas in Cuba. In this work, I could execute all software development cycles from scratch until the final delivery to the user using agile methodology XP.

---
## 📷 Screenshots
**Home**
<h1>
  <img 
    src="./Doc/home.jpg"
  />
</h1>

**Cohort 1**
<h1>
  <img 
    src="./Doc/cohort.jpg"
  />
</h1>

**Cohort 2**
<h1>
  <img 
    src="./Doc/cohort2.jpg"
  />
</h1>

**Final result**
<h1>
  <img 
    src="./Doc/finalResult.jpg"
  />
</h1>

**Database**
<h1>
  <img 
    src="./Doc/database.jpg"
  />
</h1>

**Workflow**
<h1>
  <img 
    src="./Doc/workflow.jpg"
  />
</h1>

---
## 🕖 Versioning
- Ajustes v1.0 (relased in 23/05/2015)

---
## ✅ Main features
**Career coordinator**
- [x] CRUD Study Plan
- [x] CRUD Cohort
- [x] CRUD Topic
- [x] CRUD Student historic

---
## 🔧 Technology

- [Python](https://www.python.org/) 
- [Django](https://www.djangoproject.com/) 💚
- [Apache](https://httpd.apache.org/)
- [MySQL](https://www.mysql.com/)

---
## 👨‍💻 How to Setup

```bash
  # Clone the project
  $ git clone https://github.com/abelgonzalez/Ajustes.git
```
```bash
  # Enter directory
  $ cd Ajustes
```

Download and install:

 - [XAMPP for Windows 7.4.29](https://www.apachefriends.org/download.html)
  
 - [Python 3.7.7](https://www.python.org/downloads/release/python-377/)

 - [Django 1.7](https://www.djangoproject.com/download/1.7/tarball/) 
   or
  ```bash
    # Clone the project
    $ pip install Django==1.7
  ```
  
- [Visual Studio Code 1.67.2](https://code.visualstudio.com/Download)

- [Microsoft C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)

- On your system you would do this by running this in your command prompt:
```bash     
    $ set "MOD_WSGI_APACHE_ROOTDIR=C:\xampp\apache"
  ```
-  Install mod_wsgi 4.9.2
   ```bash
    # Install the last version
    $ pip install mod_wsgi
   ```
  

- You can add WSGIScriptAlias /mysite "C:/xampp/htdocs/wsgi/scripts/mysite.wsgi" in wsgi.conf to run http://YOURSITE/mysite, or you can just run http://YOURSITE/wsgi/mysite.wsgi
Relaunch apache if necessary.
  
- At the end of file C:\xampp\apache\conf\httpd.conf , add the following:
  AddHandler cgi-script .py
  ScriptInterpreterSource Registry-Strict
- Locate <IfModule dir_module> label and add **index.py** at right of **home.htm**
- Save the httpd.conf changes
  
- Open MySQL and import the database file **ajustes_bd.sql** in the project source.
  Database name: ajustes_UM
  utf: utf8_spanish_ci
  
  
 - Go to project root folder (**tesis**)
  ```bash
    # Run
    $ python manage.py migrate
    $ python manage.py makemigrations
    $ python manage.py migrate
  ```
     
---
## 😎 How to Run

 - Make sure the database was correctly loaded and MySQL is running.
  
 - In root folder (**tesis**) run:
  ```bash
    # Run
    $ python manage.py runserver 
  ```

---
## 👉 Additional information
* App Demo https://youtu.be/4jX4oDhjTtc
* Technical and User's Manual is available in [Doc](https://github.com/abelgonzalez/Ajustes/tree/main/Doc) folder (in Spanish).
* In case of sensitive bugs like security vulnerabilities, don't hesitate to contact me at abelgodev@gmail.com instead of using the issue tracker. I value your effort to improve the security and privacy of this project!

---
## 📝 License

This project is under the MIT license. See the file <a href="https://github.com/abelgonzalez/Ajustes/LICENSE">LICENCE</a> for more details.

---
## 🧑‍💻 Autor
<p align="center">Done with 💙 by Abel González Mondéjar</p>


[![LinkedIn Badge](https://img.shields.io/badge/-Abel_González_Mondéjar-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/abelgonzalezmondejar/)](https://www.linkedin.com/in/abelgonzalezmondejar/)
