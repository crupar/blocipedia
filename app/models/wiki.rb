class Wiki < ActiveRecord::Base
  belongs_to :user
  before_create :default_wiki_public


  default_scope { order(title: :asc) }
  
  def default_wiki_public
    if self.public.nil?
      self.public = true
    end
  end

end
