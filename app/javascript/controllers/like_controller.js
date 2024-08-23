import { Controller } from "@hotwired/stimulus";
import { put } from "@rails/request.js";

// Connects to data-controller="like"
export default class extends Controller {
  static targets = ["count"];
  static values = {
    url: String,
  };

  connect() {
    this.isLiked = this.element.dataset.liked === "true";
    this.count = +this.countTarget.innerHTML;
  }

  toggle() {
    this.isLiked = !this.isLiked;
    this.element.dataset.liked = this.isLiked;
    this.count = this.count + (this.isLiked ? 1 : -1);
    this.countTarget.innerHTML = this.count;
    put(this.urlValue);
  }
}
