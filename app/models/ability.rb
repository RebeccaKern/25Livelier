class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
        can :manage, :all
    elsif user.role? :manager
        can :update, Band do |band|  
          band.id == user.band_id
        end
        can :destroy, Band do |band|  
          band.id == user.band_id
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