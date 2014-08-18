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


###acts_as_taggable_on

in `Gemfile`

	gem 'acts-as-taggable-on'

then,Install migrations

	rake acts_as_taggable_on_engine:install:migrations

Review the generated migrations then migrate :

	rake db:migrate


usage,in `models/post.rb`

````ruby
class Post < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	acts_as_taggable	
end
````

in controller,
````ruby
class PostsController < ApplicationController
  def post_params
    params.require(:post).permit(:title, :text, :image,:tag_list)
  end
end
````

in /app/views/posts/_form.html.erb 

	<%= f.input :tag_list %>

in /app/views/posts/index.html.erb	  	

	<p>Tags: <%= raw article.tag_list.map { |t| link_to t, tag_path(t) }.join(', ') %></p>
	

/config/routes.rb 

	get 'tags/:tag', to: 'articles#index', as: :tag


/app/controllers/posts_controller.rb 

````ruby


def index
  if params[:tag]
    @posts = Post.tagged_with(params[:tag])
  else
    @posts = Post.all
  end
end

````
	
Adding a Tag Cloud


/app/views/posts/index.html.erb

	<div id="tag_cloud">
	  <% tag_cloud Post.tag_counts, %w{s m l} do |tag, css_class| %>
	    <%= link_to tag.name, tag_path(tag.name), class: css_class %>
	  <% end %>
	</div>


/app/assets/stylesheets/articles.css.scss
````scss
#tag_cloud {
  width: 400px;
  line-height: 1.6em;
  .s { font-size: 0.8em; }
  .m { font-size: 1.2em; }
  .l { font-size: 1.8em; }
}

````