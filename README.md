###Bootstrap SASS

Add in `Gemfile`,


	gem 'bootsrap-sass'


	bundle install


Change the extension of `app/assets/stylesheets/applciation.css` file as `..../application.css.scss`.And import  bootstrap

	@import "bootstrap"

Add in `Gemfile`,
	
	gem 'simple_form'


simple installation

	rails g simple_form:install --bootstrap

Add in `Gemfile`

	gem 'carrierwave



To send attachment via email add this ` attachments.inline` in `model_mailer.rb` file.
````ruby
class PostMailer < ActionMailer::Base
  default from: "info@rornetwork.com"
  def post_email(post)
    @post = post
    attachments.inline["#{post.image_identifier}"]=File.read("public#{post.image.to_s}")
    @url  = 'http://rornetwork.com/login'
    mail(to: "iashanmugavel@gmail.com", subject: 'A new post has been shared!')
  end
end
````