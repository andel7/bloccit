class FavoriteMailer < ActionMailer::Base
  default from: "root@localhost"

  def new_comment(user,post,comment)

    headers["Message-ID"] = "<comments/#{comment.id}@bloccit.lev.ninja>"
    headers["In-Reply-To"] = "<post/#{post.id}@bloccit.lev.ninja>"
    headers["References"] = "<post/#{post.id}@bloccit.lev.ninja>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New Comment on #{post.title}")

  end
end
