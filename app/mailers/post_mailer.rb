class PostMailer < ActionMailer::Base
  default from: "info@rornetwork.com"
  def post_email(post)
    @post = post
    attachments.inline["#{post.image_identifier}"]=File.read("public#{post.image.to_s}")
    @url  = 'http://rornetwork.com/login'
    mail(to: "iashanmugavel@gmail.com", subject: 'A new post has been shared!')
  end
end
