class PotinController < ApplicationController
  def show
  	@gossip = Gossip.find(params['id'])
  	@user = @gossip.user
  	end 
end
