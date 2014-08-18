###Bootstrap SASS

####Bootstrap
Add in `Gemfile`,


	gem 'bootsrap-sass'


	bundle install


Change the extension of `app/assets/stylesheets/applciation.css` file as `..../application.css.scss`.And import  bootstrap

	@import "bootstrap"


####Simple_Form
Add in `Gemfile`,
	
	gem 'simple_form'


simple installation

	rails g simple_form:install --bootstrap


####Carrierwave
Add in `Gemfile`

	gem 'carrierwave


####Mail Attachment
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
####Pagination

#####Kaminari

		gem 'kaminari'
		

To install kaminari default(without any style)
	
		rails g kaminari:views default

Add in `Gemfile`,

		gem 'kaminari-bootstrap'

To install kaminari bootstrap

		rails g kaminari:views bootstrap

Creating friendly URLs and caching, add in `routes.rb`,

	resources :my_resources do
	  get 'page/:page', :action => :index, :on => :collection
	end

in `controller`

	@posts = Post.page(params[:page]).per(1)

in `views`

	<%= paginate @users %>


####Will_Paginate

	gem 'will_paginate'
	gem 'will_paginate-bootstrap'


in `controller`

	@posts = Post.paginate(:page => params[:page], :per_page => 30)


in `views`,

	<%= will_paginate @collection, renderer: BootstrapPagination::Rails %>

without `bootstrap`

	<%= will_paginate @posts %>

