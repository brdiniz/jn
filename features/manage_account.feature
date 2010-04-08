Feature: Manage account
  In order to manage account
  As a all users
  I want be able to create, update and delete accounts

	Scenario: Create a new account
	  Given I am on the list of account
		And I should see "Ações para Conta"
		And I follow "Criar conta"
		And I should see "Ações para Conta"
	  When I select "Empresa" from "account_kind"
		And I fill in "account_name" with "account-now.com.br"
		And I fill in "account_email_main" with "webmaster@account-now.com.br"
		And I fill in "account_login" with "account-now"
		And I fill in "account_password" with "account123"
		And I press "Salvar"
	  Then I should see "Criação de Conta realizada com sucesso"
		And I should see "account-now.com.br"
		And I should see "account-now"
		And I should see "Profissionais"
		And I should see "Vagas"


