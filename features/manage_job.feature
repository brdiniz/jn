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
		And I fill in "job_salary_info" with "15000 U$$ per month"
		And I fill in "job_description" with "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
		And I press "Salvar"
	  Then I should see "Criação de Vaga realizada com sucesso"
		And I should see "Ruby on Rails development Senior"


