import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static values = { to: String }

  connect() {}

  scrollToElement() {
    const element = document.getElementById(this.toValue);
    if (element) {
      element.scrollIntoView({ behavior: "smooth", block: "start" });
    }
  }
}
