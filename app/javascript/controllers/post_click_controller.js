import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="post-click"
export default class extends Controller {
  static values = {
    url: String,
  };

  connect() {}

  goto(event) {
    if (event.target.tagName.toLowerCase() === "a") {
      return;
    }
    event.stopPropagation();
    Turbo.visit(this.urlValue);
  }
}
