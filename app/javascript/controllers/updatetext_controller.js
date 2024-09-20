import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="updatetext"
export default class extends Controller {
  static targets = ["text"]

  connect() {
  }

  updateText({params}) {
    const { text } = params
    this.textTarget.textContent = text
  }
}
