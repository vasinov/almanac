class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can [:read, :show], [Almanac::Post, Almanac::Blog]
    can :manage, Almanac::Post
    can :manage, Almanac::Blog
    can :manage, Almanac::Image
  end
end
