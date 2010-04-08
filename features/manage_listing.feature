Feature: Manage listing
  In order to manage listings
  As a all users
  I want be able to create, update and delete listings

	Scenario: Create a new listing in job
	  Given I have a new company with name "account-now"
		And I have a new job with title "work_1" in account with name "account-now"
		And I am on the show "work_1" job in the "account-now" account
		And I follow "Criar Anuncio"
		And I should see "Vaga: work_1"
	  When I fill in "listing_region" with "BRA, SP"
		And I fill in "listing_location" with "São Paulo"
		And I fill in "listing_email" with "hr@account-now.com.br"
		And I fill in "listing_day_count" with "10"
		And I press "Salvar"
	  Then I should see "Criação de Anuncio realizada com sucesso"
		And I should see "Região: BRA, SP"
		And I should see "Localização: São Paulo"
		And I should see "E-mail: hr@account-now.com.br"
		And I should see "Data da ativação"
		And I should see "Data da validade"
	
	
	