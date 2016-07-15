class User < ActiveRecord::Base

  #enum role: [:standard, :editor, :admin]
  #after_initialize :set_default_role, :if => :new_record?
  has_many :wikis
  has_one :subscription
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #change later if you make set role in database
  #before_create :set_role


  def standard?
    role == 'standard'
  end

  def premium?
    role == 'premium'
  end

  def admin?
    role == 'admin'
  end

  def downgrade_account
    wikis.update all(public: true)
  end

  private

  def set_role
    self.role ||= 'standard'
  end

end
