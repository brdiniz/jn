Feature: Manage job
  In order to manage jobs
  As a all users
  I want be able to create, update and delete jobs

	Scenario: Create a new Job
	  Given I have a new company with name "accountnow"
		And I am on the "accountnow" account showing screen
		And I follow "Criar Vaga"
		And I should see "Ações para Vaga"
		And I should see "Categoria"
	  When I fill in "job_category_name" with "Category_1"
		And I fill in "job_title" with "Ruby on Rails development Senior"
		And I fill in "job_salary_info" with "15000 U$$ per month"
		And I fill in "job_description" with "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
		And I press "Salvar"
	  Then I should see "Criação de Vaga realizada com sucesso"
		And I should see "Category_1"
		And I should see "Ruby on Rails development Senior"

	Scenario: Display error messages when trying to save by not specifying the required fields
	  Given I have a new company with name "accountnow"
		And I am on the "accountnow" account showing screen
		And I follow "Criar Vaga"
		And I should see "Ações para Vaga"
		And I press "Salvar"
	  Then I should not see "Criação de Vaga realizada com sucesso"
		And I should see "Título é um campo obrigatório, é muito curto (não menos do que 10 caracteres)"
		And I should see "Benefícios é um campo obrigatório, é muito curto (não menos do que 10 caracteres)"
		And I should see "Descrição é um campo obrigatório, é muito curto (não menos do que 50 caracteres)"