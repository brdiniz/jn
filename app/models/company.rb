class Company < Account
  has_and_belongs_to_many :professionals, :join_table => :companies_professionals
  has_many :jobs, :dependent => :destroy
end
