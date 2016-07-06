class User < ActiveRecord::Base

#enum role: [:standard, :editor, :admin]
#after_initialize :set_default_role, :if => :new_record?
has_many :wikis
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable
before_create :default_user_role_standard


def standard?
  role == 'standard'
end

def premium?
  role == 'premium'
end

def admin?
  role == 'admin'
end

def publicize_wikis_if_standard
  if standard?
    wikis.each do |wiki|
      wiki.public = true
      wiki.save
    end
  end
end

private

def default_user_role_standard
  self.role ||= 'standard'
end


end
