class Employee < ActiveRecord::Base
  
  def as_json(options = {})
    super(:only => [:name, :job_title, :birthday, :salary])
  end
end
