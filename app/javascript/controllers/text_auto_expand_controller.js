import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="text-auto-expand"
export default class extends Controller {
  connect() {
    this.element.addEventListener("input", () => {
      this.element.style.height = "inherit";
      this.element.style.height = `${this.element.scrollHeight}px`;
    });
  }
}
