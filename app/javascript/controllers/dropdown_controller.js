import { Controller } from "@hotwired/stimulus";
import { Dropdown } from "flowbite";

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["dropdown", "trigger"];

  connect() {
    const offsetHeight = +this.triggerTarget.offsetHeight;
    const offsetWidth = +this.triggerTarget.offsetWidth;
    const options = {
      placement: "top",
      triggerType: "click",
      offsetSkidding: offsetWidth,
      offsetDistance: -offsetHeight,
      delay: 300,
      ignoreClickOutsideClass: false,
    };

    this.dropdown = new Dropdown(
      this.dropdownTarget,
      this.triggerTarget,
      options,
    );
  }
}
