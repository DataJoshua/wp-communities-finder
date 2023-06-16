import { Application } from "@hotwired/stimulus"
import CommunitiesController from "./communities_controller";

const application = Application.start()
application.register("communities", CommunitiesController);
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
