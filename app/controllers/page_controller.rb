class PageController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:usercontracts,:managecontracts]
 
  
  def index
    #completed
    @contracts=Contract.where("open"=>false)
  end

  def about
  end

  def hire
  end

  def managecontracts
    if not current_user.admin
      redirect_to(root_path)
    end
    #open
    @current=Contract.where("pending"=>false,"open"=>true)
    #pending
    @pending=Contract.where("pending"=>true)
    #available
    @available=Contract.where({:user_id=>nil,:pending=>false,:open=>true}).where("instructions<> ?",'Unlisted')
  end

  def usercontracts
    
    #pending
    @pending=current_user.contracts.where("pending"=>true)
    #available
    @current=current_user.contracts.where("pending"=>false,"open"=>true)
    #current
    @available=Contract.where({:user_id=>nil,:pending=>false,:open=>true}).where("instructions<> ?",'Unlisted')
  end
  

end
