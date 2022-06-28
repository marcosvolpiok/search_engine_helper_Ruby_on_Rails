class Project < ActiveRecord::Base
  has_many :projects_users, -> { with_active_access }  # line #2
  has_many :users, through: :projects_users
end

class ProjectsUser < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  scope :with_active_access , ->() { where("projects_users.expires_at is null or projects_users.expires_at > ?", Date.today) }
  scope :with_inactive_access , ->() { where("projects_users.expires_at <= ?", Date.today) }

  def access_expired?
    return false if expires_at.nil? # If the date is empty, it means the access Never expires, so we return false (has not expired)
    expires_at <= Date.today
  end
end

class User < ActiveRecord::Base
  has_many :projects_users
  has_many :projects, through: :projects_users
end

class EmailList < ActiveRecord::Base
  belongs_to :project
  has_and_belongs_to_many :users
end


describe 'Project controller'
  
end