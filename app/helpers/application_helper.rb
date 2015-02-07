 module ApplicationHelper
   def form_group_tag(errors, &block)
     if errors.any?
       content_tag :div, capture(&block), class: 'form-group has-error'
     else
       content_tag :div, capture(&block), class: 'form-group'
     end
   end


  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def vote_link_classes(post,direction)
    if direction == "up"
        if (current_user.voted(post) && current_user.voted(post).up_vote?)
          return 'glyphicon glyphicon-chevron-up voted'
        else
          return 'glyphicon glyphicon-chevron-up'
        end
        
    elsif direction == "down"
        if (current_user.voted(post) && current_user.voted(post).down_vote?)
          return 'glyphicon glyphicon-chevron-down voted' 
       else
          return 'glyphicon glyphicon-chevron-down' 
        end
    end
  end
 end