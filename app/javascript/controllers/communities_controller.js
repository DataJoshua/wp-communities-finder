import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this._dropdown = document.getElementById("categories-dropdown");
  }
  dropdown(){
    this._dropdown.classList.toggle("active");
  }
}
