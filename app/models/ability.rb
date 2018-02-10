class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
        can :manage, :all

    elsif user.role? :manager
        can :index, Building
        can :read, Room
        can :read, Event
        can :index, Organization

        can :create, Event
        #Event do |event|
        #     puts "test"
        # end
        can :update, Event do |event|  
          event.user_id == user.id
        end
        can :destroy, Event do |event|  
          event.user_id == user.id
        end

        can :read, User do |user|
          user.id == user.id
        end 

        can :update, User do |user|
          user.id == user.id
        end 


    elsif user.role? :general
        can :read, Building
        can :read, Room
        can :read, Event
        can :read, Organization
    end
  end

end