module Communities
  class Update
    include Interactor::Organizer
    
    organize Communities::Update::Execute
    
  end
end