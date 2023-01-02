module Communities
  class Create
    include Interactor::Organizer

    organize Communities::Save
  end
end