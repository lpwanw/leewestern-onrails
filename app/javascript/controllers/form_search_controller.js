import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-search"
export default class extends Controller {
  static targets = ["input"]
  connect() {
    this.debounce = null;
    this.inputTarget.addEventListener('input', () => {
      clearTimeout(this.debounce)

      this.debounce = setTimeout(() => {
        this.element.requestSubmit()
      }, 500)
    })
  }

  reset() {
    clearTimeout(this.debounce)

    this.inputTarget.value = ''

    this.element.requestSubmit()
  }
}
