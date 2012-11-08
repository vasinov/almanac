class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can [:read, :show], [Slate::Post, Slate::Blog]
    can :manage, Slate::Post
    can :manage, Slate::Blog
    can :manage, Slate::Comment
    can :manage, Slate::Image
  end
end
