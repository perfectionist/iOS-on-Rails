class Employee < ActiveRecord::Base
  validates :name, :presence => true
  
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
