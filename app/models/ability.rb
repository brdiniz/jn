class Ability
  include CanCan::Ability

  def initialize(user)
    user = Account.find_by_login(user)
    alias_action :index, :create, :edit, :update, :show, :to => :manage_jobs
    alias_action :index, :create, :edit, :update, :show, :to => :manage_listings
    alias_action :index, :edit, :update, :show, :to => :my_account
    
    if user.admin?
      can :manage, :all
    else
      can :manage_jobs, Job do |j|
        j.company.professionals.include?(user) || j.company == user
      end

      can :manage_listings, Listing do |l|
        l.job.company.professionals.include?(user) || l.job.company == user
      end
      
      can :my_account, Account do |a|
        a == user
      end
    end
  end
end