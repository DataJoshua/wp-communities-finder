module Communities
    class Destroy
      include Interactor::Organizer
      
      organize Communities::Destroy::Execute
      
    end
  end