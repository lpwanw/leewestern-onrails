import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="copy"
export default class extends Controller {
  static values = {
    text: String
  }

  connect() {
    this.element.addEventListener("click", this.copy.bind(this))
  }

  copy() {
    navigator.clipboard.writeText(this.textValue)
  }
}
