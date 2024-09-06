import { Controller } from "@hotwired/stimulus";
import { Dropdown } from "flowbite";

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["dropdown", "trigger"];
  static values = {
    overlay: Boolean,
    placement: { type: String, defalt: "top" },
  };

  connect() {
    const options = {
      placement: this.placementValue || "top",
      triggerType: "click",
      delay: 300,
      ignoreClickOutsideClass: false,
      ...this.offsetOptions(),
    };

    this.dropdown = new Dropdown(
      this.dropdownTarget,
      this.triggerTarget,
      options,
    );
  }

  close() {
    this.dropdown.hide();
  }

  offsetOptions() {
    const offsetHeight = +this.triggerTarget.offsetHeight;
    const offsetWidth = +this.triggerTarget.offsetWidth;
    this.dropdownTarget.classList.remove("hidden");
    const dropdownOffestWidth = +this.dropdownTarget.offsetWidth;
    this.dropdownTarget.classList.add("hidden");

    if (this.overlayValue) {
      return {
        offsetSkidding: offsetWidth,
        offsetDistance: -offsetHeight,
      };
    } else {
      return {
        offsetSkidding: -dropdownOffestWidth / 2,
        offsetDistance: 0,
      };
    }
  }
}
