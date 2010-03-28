class Professional < Account
  has_and_belongs_to_many :companies, :join_table => :companies_professionals
end
