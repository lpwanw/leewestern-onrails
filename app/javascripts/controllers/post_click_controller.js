import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post-click"
export default class extends Controller {
  static values = {
    url: String,
  }

  connect() {}

  goto(event) {
    const clickedElement = event.target
    const closestLink = clickedElement.closest("a")
    const closestPrevent = clickedElement.closest(".preventGoto")
    if (closestLink || closestPrevent) {
      return
    }
    
    event.stopPropagation()
    Turbo.visit(this.urlValue)
  }
}
