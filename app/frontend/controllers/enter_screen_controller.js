import { Controller } from "@hotwired/stimulus"
import { animate } from "motion"

// Connects to data-controller="enter-screen"
export default class extends Controller {
  connect() {
    animate(this.element, { backgroundColor: "white" }, { duration: 3 })
    this.element.scrollIntoView({ behavior: "smooth", block: "center" })
  }
}
