class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  # def index?
  #   false
  # end

  # def show?
  #   scope.where(:id => record.id).exists?
  # end

  # def create?
  #   false
  # end

  # def new?
  #   create?
  # end

  def update?
    user && is_owner?(record)
  end

  def edit?
    update?
  end

  def destroy?
    user && is_owner?(record)
  end

  # def scope
  #   Pundit.policy_scope!(user, record.class)
  # end

  # class Scope
  #   attr_reader :user, :scope

  #   def initialize(user, scope)
  #     @user = user
  #     @scope = scope
  #   end

  #   def resolve
  #     scope
  #   end
  # end

  private

  def is_owner?(record)
    user.id == record.user_id
  end

end
