class Ability
  include CanCan::Ability

  def initialize(user)
    
    user = User.find_by_login(user)
    alias_action :index, :create, :edit, :update, :show, :to => :manage_jobs
    alias_action :index, :create, :edit, :update, :show, :to => :manage_listings
    alias_action :index, :edit, :update, :show, :to => :my_account
    
    if user.admin?
      can :manage, :all
    else
      can :manage_jobs, Job do |j|
        j.company.professionals.include?(user.person) || j.company == user.person
      end

      can :manage_listings, Listing do |l|
        l.job.company.professionals.include?(user.person) || l.job.company == user.person
      end
      
      can :my_account, Account do |a|
        a == user.person
      end
    end
  end
end