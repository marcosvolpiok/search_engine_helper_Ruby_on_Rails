Blog
=========

Requirements
------------
You need to have installed Postgres and Ruby 7.



Installation
------------

First, configure Postgres user and password in .env file
Second, run:

    bin/rails db:migrate:status
    bin/rails db:migrate

Run server
------------
    bundle exec foreman start -p 3000

Admin
------------
To admin the blog entry at http://localhost/admin

Visit the blog
------------
To visit the blog entry at http://localhost/blog