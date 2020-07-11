class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  #before_save :make_title_case
  # p = Post.create(title: "testing")
  #   (0.1ms)  begin transaction
  #   (0.1ms)  rollback transaction
  # => #<Post id: nil, title: "testing", description: nil, created_at: nil, updated_at: nil, post_status: nil, author_id: nil>
 # p.valid? => false


 before_validation :make_title_case
 before_save :email_author_about_post

 #Whenever you are modifying an attribute of the model, use before_validation. If you are doing some other action, then use before_save.
  
 private

  def email_author_about_post
    # Not implemented.
    # For more information: https://guides.rubyonrails.org/action_mailer_basics.html
  end
  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    # Rails provides a String#titlecase method
    self.title = self.title.titlecase
  end
end
