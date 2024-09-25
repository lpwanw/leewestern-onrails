import { Controller } from "@hotwired/stimulus"
import { Dismiss } from "flowbite"

// Connects to data-controller="toast"
export default class extends Controller {
  connect() {
    const options = {
      transition: "transition-opacity",
      timing: "ease-out",
    }

    this.dismiss = new Dismiss(this.element, null, options)

    let timeoutId
    
    timeoutId = setTimeout(() => {
      this.dismiss.hide()
    }, 5000)

    this.element.addEventListener("mouseenter", () => {
      clearTimeout(timeoutId)

    })

    this.element.addEventListener("mouseleave", () => {
      timeoutId = setTimeout(() => {
        this.dismiss.hide()
      }, 5000)
    })
  }

  close() {
    this.dismiss.hide()
  }
}
