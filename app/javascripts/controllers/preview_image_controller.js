import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preview-image"
export default class extends Controller {
  static targets = ["preview"]

  connect() {
  }

  preview(event) {
    const input = event.target

    if (input.files && input.files[0]) {
      const reader = new FileReader()

      reader.onload = (e) => {
        this.previewTarget.src = e.target.result
      }

      reader.readAsDataURL(input.files[0])
    }
  }
}
