Factory.define :company do |f|
	f.sequence(:name) { |n| "company_#{n}" }
  f.kind "Company"
	f.sequence(:email_main) { |n| "company_#{n}@jn.com" }
  f.association :user, :factory => :user
end

Factory.define :category do |c|
  c.name "category"
end

Factory.define :user do |u|
  u.sequence(:login) { |n| "login#{n}" }
  u.password "ABC123"
  u.password_confirmation "ABC123"
end

Factory.define :professional do |f|
	f.sequence(:name) { |n| "professional_#{n}" }
  f.kind "Profissional"
	f.sequence(:email_main) { |n| "professional_#{n}@jn.com" }
  f.association :user, :factory => :user
end

Factory.define :job do |j|
  j.title "Ruby on Rails Develpment"
  j.salary_info "Salário Atrativo"
  j.description "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  j.category_name Category.first.name
  j.association :company, :factory => :company
end

Factory.define :listing do |l|
  l.region "SP"
  l.location "São Paulo"
  l.email "professional@jn.com"
  l.opening "10"
  l.day_count "10"
  l.code nil
  l.association :job, :factory => :job
end