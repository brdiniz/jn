class Emails < ActionMailer::Base
  
  def mailer_to_candidate(candidate, listing)
    from       "no-reply@jobs-now.com.br"
    recipients "#{candidate.name} <#{candidate.email}>"
    subject    "RE: (JOBS-now) Informações da vaga #{listing.code} - #{listing.job.title}"
    body       :candidate => candidate, :listing => listing
  end
  
  def mailer_to_company(candidate, listing)
    from       "no-reply@jobs-now.com.br"
    recipients "#{listing.job.company.name} <#{listing.email}>"
    subject    "RE: Um candidato para a vaga #{listing.code} - #{listing.job.title} (JOBS-now)"
    body       :candidate => candidate, :listing => listing
  end
end
