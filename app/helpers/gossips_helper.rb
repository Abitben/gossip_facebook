module GossipsHelper

  def verify_user
    if current_user.id == @gossip.user.id 
      return true
    else
      return false
    end
  end

end
