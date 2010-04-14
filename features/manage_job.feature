Feature: Manage job
  In order to manage jobs
  As a all users
  I want be able to create, update and delete jobs

	Scenario: Create a new Job
	  Given I have a new company with name "account-now"
		And I am on the "account-now" account showing screen
		And I follow "Criar Vaga"
		And I should see "Ações para Vaga"
	  When I fill in "job_title" with "Ruby on Rails development Senior"
		And I fill in "job_opening" with "10"
		And I fill in "job_salary_info" with "15000 U$$"
		And I fill in "job_description" with "Description Job for Ruby on Rails"
		And I press "Salvar"
	  Then I should see "Criação de Vaga realizada com sucesso"
		And I should see "Ruby on Rails development Senior"


