class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to prototype_comments_path(@comment.tweet) # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
      else
        @prototype = @comment.prototypes
        @comments = @prototype.comments
        render "prototypes/show" # views/tweets/show.html.erbのファイルを参照しています。
     end
  end
end
