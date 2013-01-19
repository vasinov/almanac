# Almanac
Almanac is the most elegant mountable blog engine that can be easily hooked up in the existing Rails application. You can read more about it in [this blog post](http://www.vasinov.com/blog/beautifully-simple-blogging).

## Main Features
- Slick default design that can be easily customized.
- kramdown (better Markdown) for all input fields.
- Drafts that make sense.
- Easy Google Analytics support.
- Disqus support for comments.
- Built-in social sharing with Facebook and Twitter.
- RSS support.
- Tags for posts.
- Photo uploading.
- Complete integration with Devise and CanCan.
- Tested with RSpec and FactoryGirl
- Uses haml, scss, CoffeeScript and Bootstrap for views.

## Installation
### 1. Add the gem to your `Gemfile`
```ruby
gem "almanac"
```
And run `bundle install`.

### 2. Setup Routes
To hook up Almanac routes to your current Rails app simply put this code in your `config/routes.rd` file

```ruby
mount Almanac::Engine, :at => '/blog'
```

You can obviously setup any route you want. E.g. `/posts` or `/almanac`.

### 3. Run Almanac Migrations
First off, install Almanac migrations:

```ruby
rake almanac:install:migrations
```

Then migrate your database:

```ruby
rake db:migrate
```

### 4. Devise and CanCan Setup
Almanac relies on Devise and CanCan properly configured in your app. In short, the `current_user` variable and CanCan `ability.rb` file has to exist. You can setup permissions for the following Almanac models:

```ruby
can :manage, Almanac::Post
can :manage, Almanac::Blog
can :manage, Almanac::Image
```

These particular rules will allow the specified user to do anything with any Almanac record in the database.

### 5. Dragonfly Setup
Almanac relies on the Dragonfly gem for file uploads. Configure Dragonfly in your app by adding the following line to `config/initializers/dragonfly.rb`:

```ruby
require 'dragonfly/rails/images'
```

In order for some of the Dragonfly functionality to work, [ImageMagick](http://www.imagemagick.org/script/binary-releases.php) is required.

### 6. Specify User Class Name
Lastly, you'll have to specify the name of your user model. Create a `config/initializers/almanac.rb` file and add the following line there:

```ruby
Almanac.user_class = "User" # other possibilities: "Author", "Writer", etc.
```

## Kramdown
[Kramdown](http://kramdown.rubyforge.org/index.html) is the superset of Markdown. All input fields can use it. Check out all [syntax rules](http://kramdown.rubyforge.org/syntax.html) for kramdown. One of the best examples of kramdown usage is code highlighting that is part of Almanac. In your post you can simply write:

```
~~~ruby
def foo
  puts "bar"
end
~~~
```

And it will generate a nice looking block of Ruby code once your post is published.

## Post Comments
Almanac supports commenting via [Disqus](http://disqus.com/)—the best commenting solution on the web. If you want your blog to support commenting, register with Disqus, add a website and copy-paste "Site Shortname" to the appropriate field in Blog Settings.

Prior to version 0.9 Almanac had it's own commenting solution. It's not supported anymore. However, you can back up your comments from the database, since there is no migration that removes the comments table in the system.

## Extending
Almanac is a mountable Rails engine, which means that all of its controllers, views and models can be rewritten in your main application. E.g. if you want to change the main layout view, create a `app/views/layouts/almanac/application.html.haml` file in your project directory that will be used automatically by Rails instead of the default Almanac layout.

This applies to all other views, models and controllers. Basically, add an `almanac` folder to any abstraction that you are willing to change and replace almanac files with your own.

## Testing
Almanac's models and controllers are tested with RSpec and FactoryGirl. Rails engines, such as Almanac, are normally tested with a dummy app that is located inside the 'spec' folder. Migrate your test database from the `spec/dummy` directory:

```ruby
rake db:migrate RAILS_ENV=test
```

Go back to the `almanac` directory and run `rspec spec`.

## Contribute
- Fork the project.
- Write code for a feature or bug fix.
- Add Rspec tests for it.
- Commit, do not make changes to rakefile or version.
- Submit a pull request.
