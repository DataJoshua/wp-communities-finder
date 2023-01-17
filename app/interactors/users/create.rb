module Users
  class Create
    include Interactor::Organizer

    organize Users::Save
  end
end
