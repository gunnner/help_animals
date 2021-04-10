# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    return unless user&.active?

    user.roles.each do |role|
      send "#{role.name}_permissions"
    end
  end

  def animal_manager_permissions
    can :read, %i[closed_requests open_requests]
    can :crud, :animals
  end

  def request_manager_permissions
    can :read, :animals
    can :crud, %i[closed_requests open_requests]
  end

  def manager_permissions
    animal_manager_permissions
    request_manager_permissions
  end

  def admin_permissions
    can :manage, :all
  end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
