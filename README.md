# README

papooablog is simply blog developed with Ruby on Rails. This is my personal project, just for fun & learn. But can use for simple blogging platform (maybe enough).

# Feature:

* Multiple categories for every post

* Posts archives

* Pin/Unpin Post (sticky post)

* Post rich text with summernote

* Publish or Save as Draft post

* Image upload

* Rich text syntax higlighter

* Disquss command (you can modify with your disquss code)

* Sitemap generator

* Default theme with bootstrap, you can modify layout code with yourself.


# Compatibiliby

Tested & Worked on Rails 5.1 & Ruby 2.4


# How to Use?
1. Clone
2. `bundle install`
3. Rename & Edit file `database.yml.example` located at `config/` folder to `database.yml` and then fill with your user, password & database name.
4. `rake db:create`
5. `rake db:migrate`

After db:migrate, run rails console :

Create admin with rails console.

```
# rails c
> u = User.new(name: 'your name', email: 'your@everythingmail.com', password: 'your password', level: 1)
> u.save
```

and then :

`# rails s`  

to run server.

open browser http://localhost:3000

Login with your email and password created above at http://localhost:3000/users/sign_in

# Sitemap Configuration
- Sitemap file located at public/ folder with name sitemap.xml.gz
- Sitemap configuration located at config/ folder with name sitemap.rb

In order that sitemap pointing to your domain name, please change this line below at sitemap.rb with your domain name.

`# SitemapGenerator::Sitemap.default_host = "https://papooa.com"`

and then re-generate the sitemap with rails command below :

`# rake sitemap:refresh`

after that, file sitemap.xml.gz located at public/ folder will re-generated. You can try access your sitemap http://localhost:3000/sitemap.xml.gz , will dowload that file. If you try extract that file, you will find .xml file and can open on browser for preview your sitemap.

More details about sitemap_generator please visit https://github.com/kjvarga/sitemap_generator


# Demo
https://papooa.com/

papooablog free for use and modifying everything you want!
