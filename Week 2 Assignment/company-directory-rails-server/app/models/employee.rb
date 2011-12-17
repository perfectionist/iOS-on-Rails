class Employee < ActiveRecord::Base
  attr_accessible :name, :job_title, :birthday, :salary
  validates :name, :presence => true

  belongs_to :department
  
  def birthday=(birthday) 
    case birthday
    when String
      self.birthday = Date.parse(birthday)
    else
      write_attribute(:birthday, birthday)
    end
  end
  
  def as_json(options = {})
    super(:only => [:name, :job_title, :birthday, :salary])
  end
end
