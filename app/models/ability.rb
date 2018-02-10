class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
        can :manage, :all
    elsif user.role? :manager
        can :update, Event do |event|  
          event.user_id == user.id
        end
        can :destroy, Event do |event|  
          event.user_id == user.id
        end
    elsif user.role? :member
        can :update, Band do |band|  
          band.id == user.band_id
        end
    else
        can :read, :all
    end
  end
end