# Rails for Designers

#### Social stuff

- Feel free to tag your tweets with [#tslrails](https://twitter.com/search?q=%23tslrails&src=hash)
- We live at [@starterleague](https://twitter.com/starterleague)

#### Us

- [Arjun Venkataswamy](https://twitter.com/thevenkataswamy)
- [Sandor Weisz](http://santheo.com)
- [Mike McGee](http://twitter.com/michaelmcgee)
- [The Starter League](http://www.starterleague.com/)

### Agenda

- 9:30am - 9:45am : Orientation
- 9:45am - 10:15am: Explore static mockup of app / HTML review
- 10:15am - 12:00pm : Dive in to Rails
- 12:00pm - 1:00pm : Break for Lunch
- 1:00pm - 2:30pm : Bring mockup to life with Rails
- 2:30pm - 3:30pm : Add an API
- 2:45pm - 4:00pm : Create admin functionality
- 4:15pm - 5:00pm : Deploy to the web
- 5:00pm - 6:00pm : Reflections and office hours

---

## Setup

### Environment setup

 - If you haven't already, create an account at [GitHub](https://github.com/). If you have, log in.
 - If you haven't already, create an account at [Nitrous.io](https://www.nitrous.io/). If you have, log in. Create a free box. Ignore all the upsell prompts. From your Boxes page, choose the box you created and click "IDE".

### Backchannel doc

Load up [this Google doc](https://docs.google.com/document/d/18k1szk6zdQAwIQ5Yl2pmTZyGBkVEwZj8g0j3yHUogeQ/edit?usp=sharing) (anonymously, if you'd like) to share feedback & questions. We'll keep an eye on it throughout the day.

### Download our mockup

- Go to [the GitHub repository for our mockup](https://github.com/tsl-sxsw-2014/dinner-mockup) and click the Download Zip button. Unzip.
- Open up `item.html` and `new.html` and look 'em over.

---


## Creating an app

### First steps

- `rails new dinner` Create a new app
- `cd dinner` Navigate into your app
- `bundle install` To set up your environemnt, in case this didn't happen automatically.
- `rails server` Start your web server
- Visit your app by going to Preview > Port 3000 in the menu bar.

### Create a model

For our purposes, we'll use `Item`, but it can be anything.

```
rails generate scaffold Item title:string description:string link:string image:string category:string
```

Then, set up the database by runnning this:

```
rake db:migrate
```

### Destroy a model

```
rails destroy scaffold Item
```

### Sandbox for playing with Ruby and with your models

```
rails console
```

### Viewing all the routes your app knows about

```
rake routes
```

---

## Forking our codebase

**Step 1:** Fork [this repo](https://github.com/tsl-sxsw-2014/dinner)

**Step 2:** Clone your fork to your Nitrous account. First delete the old `dinner` directory.

```
cd
rm -rf dinner
git clone https://YOUR-GIT-REPO-URL
cd dinner
bundle install
```

## Step 0

Revert your git repo to the "step0" commit:

```
git checkout step0
rake db:migrate
rails server
```

Seed the database with our data. Open a new console/terminal tab, then type:

```
rake db:seed
```

Create a new route for our homepage, using a new controller:

```
get("/", { :controller => 'public', :action => "random" })
```

---

## Deployment

### How to deploy site to Heroku (don't do this right now)

- [Get Started with Heroku](https://devcenter.heroku.com/articles/quickstart)
- Open your app's `Gemfile`
- Change this:

```
gem 'sqlite3'
```

to this:

```
group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
```

- From the command line, `bundle install`
- `git add -A` Add all of the files in the current folder to a version staging area
- `git commit -m '[COMMIT MESSAGE OF YOUR CHOICE]'` Describe and save the current version of the code
- `heroku create APP-NAME` Create a repository for our code in Heroku's cloud
- `git push heroku master` Send our code to Heroku for deployment
- `heroku run rake db:migrate` Create any database tables we need on Heroku's server
- `heroku open` Open our live app

---

## Command line reference

- `pwd` Display your current location
- `ls` List the contents of the current folder
- `mkdir <folder name>` Create a subfolder
- `cd` Navigate to your Home folder
- `cd <folder name>` Navigate into a subfolder
- `cd ..` Navigate back to the parent folder
- `Control + c` Stop the server, get back to command line

## Nitrous.io reference

- `clear` to clear your terminal section

## Rails reference

### CRUD Resource

- At the heart of every app is data; *things* that the app keeps track of, and presents to the user in a valuable way.
- To store all this data, we typically use databases. A database is simply a set of tables.
- We refer to these *things* as resources. Pretty much every app you can think of is a collection of resources that you can **C**reate, **R**ead, **U**pdate, and/or **D**elete.
- As such, Rails gives us a handy tool to get a head start on building a CRUD resource.
- `rails generate scaffold <table name (singular)> <first column>:<datatype> <second column>:<datatype> …` Get a headstart on building a database-backed web resource
- `rake db:migrate` Create the actual table in your database
- Open `http://localhost:3000/<table name (plural)>` in Chrome

### The asset pipeline

- Place all CSS files into `app/assets/stylesheets`
- Place all JavaScript files into `app/assets/javascripts`
- Place all image files into `app/assets/images`
- CSS and JavaScript will be automatically included in all of the pages served by the app by default.
- Images can be located at `http://localhost:3000/assets/<filename>`
- Delete the `app/stylesheets/scaffolds.css.scss` file.

### Make a local clone from GitHub

- `git clone REPO-URL` Download the code and version history
- `cd REPO-NAME` Navigate into the repository
- `bundle install` Install all the libraries that the app needs
- `rake db:migrate` Create your database and tables
- `rake db:seed` Pre-populates database with dummy data
- `rails server` Start the server (don't forget to quit any other running servers with CTRL-C)

### HTML templates in Rails

- Your HTML templates are located in the `app/views/CONTROLLER-NAME>` folder.
- View templates are standard HTML with a bit of Ruby sprinkled in.
- Ruby goes in special Embedded Ruby Tags, <%=  %>
- Check out `app/views/projects/show.html.erb`. What's the pattern for accessing data from the database?
- Try to enhance the HTML around the ERB to look more like our mockup.
- You need not include `<html>`, `<head>`, or `<body>` tags in the view template; Rails will automatically include them. Just include the content of the body.
- First just paste the static markup into the view template; then try to go through, line by line, and embed Ruby wherever you need to in order to make it dynamic.

### Authentication

- In the controller file, add a line like this: `http_basic_authenticate_with :name => "sxs2", :password => "2014"` on line 2
- This will require authentication for every action in this controller.

---

Please [stay in touch with us](https://twitter.com/starterleague); we'd love to see the beautiful things you build.

### Thank you very much for attending, and happy coding!
