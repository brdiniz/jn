Feature: Manage category
  In order to manage categoriess
  As a all users
  I want be able to create, update and delete categorys

	Scenario: Create a new Category
  	Given I am on the list of category
		And I follow "Criar Categoria"
		And I should see "Ações para Categoria"
	  When I fill in "category_name" with "Ruby on Rails"
		And I press "Salvar"
	  Then I should see "Criação de Categoria realizada com sucesso"
		And I should see "Ruby on Rails"