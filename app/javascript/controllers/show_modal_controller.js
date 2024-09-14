import { Controller } from "@hotwired/stimulus"
import { Modal } from "flowbite"

// Connects to data-controller="show_modal"
export default class extends Controller {
  static targets = ["modal"];
  static values = {
    show: { type: Boolean, default: false },
    level: { type: Number, default: 1 },
  }

  connect() {
    const options = {
      backdropClasses: `bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 ${this.backdropLevelClass()}`
    }

    this.modalTarget.classList.add(this.modalLevelClass())
    this.modal = new Modal(this.modalTarget, options);
    if (this.showValue) {
      this.modal.show();
    }
  }

  close() {
    this.modal.hide();
  }

  open() {
    this.modal.show()
  }

  backdropLevelClass() {
    if (this.levelValue === 1) {
      return "z-40"
    }

    return "z-[" +this.baseLevelZIndex() + "]"
  }

  modalLevelClass() {
    if (this.levelValue === 1) {
      return "z-50"
    }

    return `z-[${this.baseLevelZIndex() + 10}]`
  }

  baseLevelZIndex() {
    return this.levelValue * 20 + 20
  }

  disconnect() {
    this.modal.destroy();
  }
}
