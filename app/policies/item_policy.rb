class ItemPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError unless user
      @user = user
      @scope = scope
    end

    def resolve
      if @user.admin?
        scope.all
      else
        scope.where user: @user
      end
    end
  end
end
