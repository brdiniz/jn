class CreateCompaniesProfissionals < ActiveRecord::Migration
  def self.up
    create_table :companies_professionals, :id => false do |t|
      t.integer :company_id
      t.integer :professional_id
    end
  end

  def self.down
    drop_table :companies_professionals
  end
end
