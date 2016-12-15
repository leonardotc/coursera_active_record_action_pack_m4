class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: ['male', 'female']
  validate :either_names_not_null, :sue_is_not_male

  def either_names_not_null
    if last_name.nil? and first_name.nil?
      errors.add(:first_name, "First Name cant be null if Last Name is also null")
      errors.add(:last_name, "Last Name cant be null if First Name is also null")
    end
  end

  def sue_is_not_male
    if first_name and first_name.downcase == "sue" and gender and gender == "male"
      errors.add(:first_name, "Sue is not a male name")
    end
  end

  def self.get_all_profiles(min, max)
    Profile.where("birth_year BETWEEN ? and ?", min, max).order(:birth_year)
  end
end
