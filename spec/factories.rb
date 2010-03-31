Factory.define :company do |f|
	f.sequence(:name) { |n| "company_#{n}" }
  f.kind "Company"
	f.sequence(:email_main) { |n| "company_#{n}@jn.com" }
	f.sequence(:login) { |n| "company_#{n}" }
	f.password "123"
end

Factory.define :professional do |f|
	f.sequence(:name) { |n| "professional_#{n}" }
  f.kind "Profissional"
	f.sequence(:email_main) { |n| "professional_#{n}@jn.com" }
	f.sequence(:login) { |n| "professional_#{n}" }
	f.password "123"
end

Factory.define :job do |j|
  j.title "Título"
  j.salary_info "atrativo"
  j.description "Description"
  j.association :company, :factory => :company
end

Factory.define :listing do |l|
  l.region "SP"
  l.location "São Paulo"
  l.email "professional@jn.com"
  l.day_count "10"
  l.association :job, :factory => :job
end